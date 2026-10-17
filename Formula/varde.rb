class Varde < Formula
  desc "Task management and memory for AI coding agents"
  homepage "https://github.com/Smebbs/varde"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.4.0/varde-v1.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "143f376e0358af1ca71d7c64b6d2efab4824824838a380f906da66d57eea46a8"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.4.0/varde-v1.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "ab2b3ce20cc2478b40e03a144abf673dda894df85a2bce69861680cd182d7bca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.4.0/varde-v1.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "26c271745afa7b67e4528f37f8e92e1c90bd281cd786dbd9f3a1bef8bc31ee44"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.4.0/varde-v1.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dc8313a96555029190629181762616cbe7ebbd5581fd9032d801b99d0257c7bb"
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
