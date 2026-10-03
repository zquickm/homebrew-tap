cask "usagebar" do
  version "1.1.0"
  sha256 "0615f03f8141f0012a565ff950ea26b846479e6f6f497082ff68784599d4304e"

  url "https://github.com/zquickm/UsageBar/releases/download/v#{version}/UsageBar-v#{version}.zip"
  name "UsageBar"
  desc "Menu bar monitor for AI CLI token usage (Claude Code, Codex, etc.)"
  homepage "https://github.com/zquickm/UsageBar"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "UsageBar.app"

  # Homebrew 5+ always quarantines cask artifacts and dropped --no-quarantine.
  # The app is ad-hoc signed (not notarized yet), so strip the quarantine
  # stamp post-install to skip the one-time Gatekeeper prompt. Ceiling: if a
  # future macOS blocks userland xattr on quarantined bundles, this stops
  # working and notarization becomes the only route.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/UsageBar.app"]
  end
end
