# This file is automatically updated by the update-formula workflow.
# DO NOT EDIT.
class BifrostCli < Formula
  desc "Upload SBOM (Software Bill of Materials) files to bifrost"
  homepage "https://bifrostsec.com"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-darwin-arm64"
      sha256 "ca57a447c399340349ef9530ee5874350178d834671b5207d1bd918861c6e5bb" # darwin-arm64
    end
    on_intel do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-darwin-amd64"
      sha256 "7c494b2bc4036d1fe90a7f75a7d2b6377bd7185ed8c80f9095bae405438901f6" # darwin-amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-linux-arm64"
      sha256 "73aa3e3e20d1aa5bcd09740074503fd32b49bb05c8d935dbf099b602475628c1" # linux-arm64
    end
    on_intel do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-linux-amd64"
      sha256 "516eaf892818d6a5f406dd10ce44ccd5b68546399b705d9dc0d5b711d2f4b9d1" # linux-amd64
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
