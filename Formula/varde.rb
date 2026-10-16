class Varde < Formula
  desc "Task management and memory for AI coding agents"
  homepage "https://github.com/Smebbs/varde"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.3.0/varde-v1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "6d8687b03ed04a68f76cf2ca0b8168293e8cfee93ba70d2353e280ed7505603d"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.3.0/varde-v1.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "ecee18ad1f443511536fc1f18bf5c93fe971dedf2950bba059c5061918521be9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.3.0/varde-v1.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a8a796cae7f68a0d8d3e8feeffa6c67e815b21f2111653fc661dd7aead0240cd"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.3.0/varde-v1.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f32cca65b09693d55226864f97b14385a067e247d2a2991b50baef70f4d78f7a"
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
