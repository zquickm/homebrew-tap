cask "usagebar" do
  version "1.1.0"
  sha256 "0615f03f8141f0012a565ff950ea26b846479e6f6f497082ff68784599d4304e"

  url "https://github.com/zquickm/UsageBar/releases/download/v#{version}/UsageBar-v#{version}.zip"
  name "UsageBar"
  desc "Menu bar monitor for AI CLI token usage (Claude Code, Codex, etc.)"
  homepage "https://github.com/zquickm/UsageBar"

  livecheck do
    url :latest
    strategy :github_latest
  end

  app "UsageBar.app"
end
