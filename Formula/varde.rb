class Varde < Formula
  desc "Task management and memory for AI coding agents"
  homepage "https://github.com/Smebbs/varde"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.3.2/varde-v1.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "cffd56957f1dda330eb55b521b02d08be9825410337129cf4cd2e3984b73e9a5"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.3.2/varde-v1.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "1af6642ad635f313b1b064fef6a431a13f868508c53be60441f6295bd0105c65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.3.2/varde-v1.3.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2ca3c24163f11c1b3c1710f6e8e4d9dacf768dcbdbb2e681b9c70a954c07af44"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.3.2/varde-v1.3.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fd81658e086a91cc79b42288256b095737091835e58fbd6dbe1f85347400207c"
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
