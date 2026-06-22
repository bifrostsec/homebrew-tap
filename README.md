# bifrostsec/homebrew-tap

Homebrew tap for [bifrost](https://bifrostsec.com/) command-line tools.

## Install

```bash
brew install bifrostsec/tap/bifrost-cli
```

(The `bifrostsec/tap` prefix automatically taps this repository; no separate
`brew tap` step is needed.)

## Update

```bash
brew update
brew upgrade bifrost-cli
```

## Why a tap?

Installing through Homebrew avoids the macOS Gatekeeper prompt you get when
downloading the release binary directly with a browser — Homebrew does not
apply the `com.apple.quarantine` attribute to formula installs, so the binary
runs without the "Apple could not verify…" warning.

> macOS users who prefer the direct download, and all Windows users, should
> follow the instructions in the [bifrost-cli README](https://github.com/bifrostsec/bifrost-cli#get-started).

## Available formulae

| Formula | Tool |
| ------- | ---- |
| `bifrost-cli` | [bifrost-cli](https://github.com/bifrostsec/bifrost-cli) — SBOM uploader (installs the `bifrost` command) |

This tap is intended to host multiple bifrost tools over time; each lives in its
own Ruby file in this repository (e.g., `bifrost-cli.rb`).
