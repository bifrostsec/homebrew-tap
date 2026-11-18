# This file is automatically updated by the update-formula workflow.
# DO NOT EDIT.
class BifrostCli < Formula
  desc "Upload SBOM (Software Bill of Materials) files to bifrost"
  homepage "https://bifrostsec.com"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-darwin-arm64"
      sha256 "8dd2d22b22641f844e489fb08ecd17c6e58ad347fd5c2aea9f9b8902a81c29fa" # darwin-arm64
    end
    on_intel do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-darwin-amd64"
      sha256 "df4bf2184a716973e933276bed784329a5eab2781a8fdd6cdf2d9dd40b371ca6" # darwin-amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-linux-arm64"
      sha256 "c5e0be5a8e3a776df5a2a71ff9f4f0d5bae2cf1ee1da2620b811ef4bebe2dde4" # linux-arm64
    end
    on_intel do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-linux-amd64"
      sha256 "6ddd19d1da298effa225858e7df96304d72cd780d289e9f9262eceab91840305" # linux-amd64
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
