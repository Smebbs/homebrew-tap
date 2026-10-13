class Varde < Formula
  desc "Task management and memory for AI coding agents"
  homepage "https://github.com/Smebbs/varde"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.1.0/varde-v1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "edca1a6bc8cd8685a5e6308f83cbe8bb981eb471bcc888ea2a17d70836aa8d5a"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.1.0/varde-v1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "e9ea887ce5795df54c05dac4ad59167bf9af324da95dda30e53be10168a1d9f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.1.0/varde-v1.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a343a62516a0aa931071ee01ad3d644cae22efd9ddc48b3f1e8ae546945294a5"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.1.0/varde-v1.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a0696230f2f17b6349ee08f5ce89021fcd3db1b6c51d96e2a6bcbdc36875e9b0"
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
