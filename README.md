# zquickm/tap

Homebrew tap for [UsageBar](https://github.com/zquickm/UsageBar) — macOS menu bar AI CLI token usage monitor.

```bash
brew install --cask zquickm/tap/usagebar
```

Installs without the Gatekeeper prompt: Homebrew 5+ always quarantines cask downloads and removed `--no-quarantine`, so the cask strips the quarantine stamp itself in a `postflight` block (the app is ad-hoc signed, not notarized yet).

New versions: update `version` + `sha256` in `Casks/usagebar.rb` on each release.
