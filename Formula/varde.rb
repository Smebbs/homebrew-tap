class Varde < Formula
  desc "Task management and memory for AI coding agents"
  homepage "https://github.com/Smebbs/varde"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.0.3/varde-v1.0.3-aarch64-apple-darwin.tar.gz"
      sha256 "7acfe8fb6685bb71320c602f560990d42e499e7654f0009e683732c9e2b4a230"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.0.3/varde-v1.0.3-x86_64-apple-darwin.tar.gz"
      sha256 "d1ce8b40a200d0f20f2412e4fe7f5b4c7024690db567e1e6ca70c624a41dea67"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.0.3/varde-v1.0.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d51381f902add14b3d71c438ea8122563fada7b2c76181cea9e8570fd5429d79"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.0.3/varde-v1.0.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "96c44d8e9f19b952a8b8d71441d71a8a8a2588680ca656a2d9037ce5c4f4149d"
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
