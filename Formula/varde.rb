class Varde < Formula
  desc "Task management and memory for AI coding agents"
  homepage "https://github.com/Smebbs/varde"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.3.1/varde-v1.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "12e28906eeed8d3d63b9a77c358c1971fc3d2f8abdb8c52150c81187c01a2b78"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.3.1/varde-v1.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "51cc9623da0901f42201273cba76411e21010b8b4cf699ebea1014a57f7b826b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.3.1/varde-v1.3.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6e6b77aa84904423ef7595e373458ab4a1e977b1a445d5b3ad830880ca1d464e"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.3.1/varde-v1.3.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0e539d983e3831772623eeea0d1c7a43b356d78f573d6d5e9b3ddf0651cb5a91"
    end
  end

  def install
    bin.install "varde"
  end

  def caveats
    <<~EOS
      varde needs its hooks in the agent. In Claude Code:
        /plugin marketplace add Smebbs/varde
        /plugin install varde@varde
      Then `varde doctor` says what else is missing.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/varde --version")
  end
end
