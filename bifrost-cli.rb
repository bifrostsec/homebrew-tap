# This file is automatically updated by the update-formula workflow.
# DO NOT EDIT.
class BifrostCli < Formula
  desc "Upload SBOM (Software Bill of Materials) files to bifrost"
  homepage "https://bifrostsec.com"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-darwin-arm64"
      sha256 "f58def0f31d2388ec61217d2352cccfcf59ba95cb35c5249f688e78658914fb0" # darwin-arm64
    end
    on_intel do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-darwin-amd64"
      sha256 "112a788b5bfef7c288453461769d8731fba69ef0271ca03a734d8ae03bba4310" # darwin-amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-linux-arm64"
      sha256 "cf4cf543af9f0e075ad064e6d8354dc4ff57b214fa93136495d68a75915879af" # linux-arm64
    end
    on_intel do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-linux-amd64"
      sha256 "18b1237f8b6f17325f0a9a04f8438fee3033e8d48eebc475bb5a54bcad1f5038" # linux-amd64
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
