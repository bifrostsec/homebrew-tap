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

## Available formulae

| Formula | Tool |
| ------- | ---- |
| `bifrost-cli` | [bifrost-cli](https://github.com/bifrostsec/bifrost-cli) — SBOM uploader (installs the `bifrost` command) |

This tap is intended to host multiple bifrost tools over time; each lives in its
own Ruby file in this repository (e.g., `bifrost-cli.rb`).
