class Varde < Formula
  desc "Task management and memory for AI coding agents"
  homepage "https://github.com/Smebbs/varde"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.4.1/varde-v1.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "90e73c4adfde9506956714580c89aed85c878881308114fe9293d7c0f1cdcf10"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.4.1/varde-v1.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "2ca8c34e5edd84fb7db8cc6c42a1b147a041777b2be47eef79d6c865993f6cc9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.4.1/varde-v1.4.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "29a9bf4561f68d24c480975208410a528e28dd89de881350a36e24d4915b838d"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.4.1/varde-v1.4.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d494f959248eb8a0ad80550dec3a9c5da945ecbcd48ac8794a38efde0d594ff7"
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
