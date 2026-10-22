class Varde < Formula
  desc "Task management and memory for AI coding agents"
  homepage "https://github.com/Smebbs/varde"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.5.2/varde-v1.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "4c7d794dc5edc8a6f09d4aba80cbe14c48c468733fef4da47beef3aa585ecd50"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.5.2/varde-v1.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "b59c49c9c454e0a957cb1ad7f047a495f8f3f173c3bca787c3f5d88d23b64105"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.5.2/varde-v1.5.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8c9cf38795ed4d030720c3bc760e0e672b87532c9fb0c4210dcf088f89dbf533"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.5.2/varde-v1.5.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fc2dbdb2fe5ced747bbc6350437779a64a156596604fe9aa277b163ef5df09ee"
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
