# This file is automatically updated by the update-formula workflow.
# DO NOT EDIT.
class BifrostCli < Formula
  desc "Upload SBOM (Software Bill of Materials) files to bifrost"
  homepage "https://bifrostsec.com"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-darwin-arm64"
      sha256 "2e336c235168081373f6b6b9d5df010ffc7a6a0d7716d4ef31693735ecc7f0fe" # darwin-arm64
    end
    on_intel do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-darwin-amd64"
      sha256 "5fa7c4444d0b39a74d2f2ced03c80c8fd2e21c868a80fa0cfc87720e06bfe218" # darwin-amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-linux-arm64"
      sha256 "68243b452e4ad5086ffc0779894e1dd651c9578fd9a8e66936d2474c5e9fa787" # linux-arm64
    end
    on_intel do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-linux-amd64"
      sha256 "bc704bfdcb26967675242fd8db657c2f804868cfe96fb2d058ea4555dd9d53a3" # linux-amd64
    end
  end

  def install
    # Each release asset is a single bare binary named bifrost-<os>-<arch>.
    # Select the one for this platform explicitly so the install is deterministic
    # and fails clearly if the expected asset is missing.
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "bifrost-#{os}-#{arch}" => "bifrost"
  end

  test do
    # The CLI prints its banner (incl. version) then exits 2 when no subcommand
    # is given, so assert against the combined output with the expected status.
    assert_match version.to_s, shell_output("#{bin}/bifrost 2>&1", 2)
  end
end
