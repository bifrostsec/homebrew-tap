# This file is automatically updated by the update-formula workflow.
# DO NOT EDIT.
class BifrostCli < Formula
  desc "Upload SBOM (Software Bill of Materials) files to bifrost"
  homepage "https://bifrostsec.com"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-darwin-arm64"
      sha256 "89638d6465ca8af0846cded855e48b2d242d51f0e4c7522a69c660c63d3fd1dc" # darwin-arm64
    end
    on_intel do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-darwin-amd64"
      sha256 "3a4adb907487b56fb88c51b8546bf39031efd6d1cac0bef499db75eb1fe44f5d" # darwin-amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-linux-arm64"
      sha256 "0b7f4c61ee4ed810511479a93c9325c3f84dc99340b6375be97dc09603a440e5" # linux-arm64
    end
    on_intel do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-linux-amd64"
      sha256 "174d394a04eee09588127c871f84c608c14b7d3a1a70611b8b327cb017f27445" # linux-amd64
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
