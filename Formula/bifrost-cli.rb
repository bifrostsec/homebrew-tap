class BifrostCli < Formula
  desc "Upload SBOM (Software Bill of Materials) files to bifrost"
  homepage "https://bifrostsec.com"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-darwin-arm64"
      sha256 "c1b4245754892a0ab5454b42ee23aa8155bf9edd1199f74b22783083e081d626"
    end
    on_intel do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-darwin-amd64"
      sha256 "f66714360ff3dfba26844874d32c96c3fb264b2e8d6c2f0d3ccb195178868439"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-linux-arm64"
      sha256 "8de27c9e9d440bf7869c3d559d57b4ae17487b14ecce6cdcd9e3e0d07b46003c"
    end
    on_intel do
      url "https://github.com/bifrostsec/bifrost-cli/releases/download/v#{version}/bifrost-linux-amd64"
      sha256 "cf31d0de9a828267560bcb691cf162f36411f326d1d6b3562fe67bc038276a6b"
    end
  end

  def install
    # Each release asset is a single bare binary named bifrost-<os>-<arch>;
    # install it as the `bifrost` command.
    bin.install Dir["bifrost-*"].first => "bifrost"
  end

  test do
    # The CLI prints its banner (incl. version) then exits 2 when no subcommand
    # is given, so assert against the combined output with the expected status.
    assert_match version.to_s, shell_output("#{bin}/bifrost 2>&1", 2)
  end
end
