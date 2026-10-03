cask "usagebar" do
  version "1.1.0"
  sha256 "5f036fe4dfbb18e4802acd8f54261e550158655f25eed5d1dcd2a0506bcb7a25"

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
