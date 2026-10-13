class Varde < Formula
  desc "Task management and memory for AI coding agents"
  homepage "https://github.com/Smebbs/varde"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.1.1/varde-v1.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "2c927ec0c7b1aa8731e3dc424a1a12f43c1a58367f2c3374167d8f91c0c7c25a"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.1.1/varde-v1.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "4bf7d2f6e70568850b7dac9ddf708fd2580c4c07b8fdad1206ac7ce18a5095a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.1.1/varde-v1.1.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bd51e907c1ff4b1606aa9a090f3f019123faff80f42898aa6999bf1588aefefe"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.1.1/varde-v1.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "75c9e414452c48ff05ea8413094579340cbe579619a5c9359dcd578efc75ad3d"
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
