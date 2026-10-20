class Varde < Formula
  desc "Task management and memory for AI coding agents"
  homepage "https://github.com/Smebbs/varde"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.5.1/varde-v1.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "b1bce6e54b0d37112e57146861f51e793d4bc17041ccdab2636cbdc71ed883ae"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.5.1/varde-v1.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "bc25055964dbf3b8ba40fdce2eb811cb39b64d509cb74cf61cf762dcd18559cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.5.1/varde-v1.5.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ffba4ff3c5a3239c5db344af1c917047c62c599078cb679ec6f4fbc47bdff958"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.5.1/varde-v1.5.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "207a2a7e22115d0efe8d0d565cca288fc4fe660e7360b5237d3b862e07c2cbc5"
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
