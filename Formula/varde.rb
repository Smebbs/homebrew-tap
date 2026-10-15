class Varde < Formula
  desc "Task management and memory for AI coding agents"
  homepage "https://github.com/Smebbs/varde"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.2.0/varde-v1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "91d6db8bfa3e6a76d73e6dd1b2aab7e856b737ca94c7c977dae0a4ce08fc0502"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.2.0/varde-v1.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "a742796eabc447531c3b72e009833929b054f85deb735cdee8c7f71ff63e3fe3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.2.0/varde-v1.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "758b1b1d50c7da02752fa8737003b669a29b1e41b5a0af88058c93530639c638"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.2.0/varde-v1.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1682292ad8cbb1f2a21a5180e800627de0ff98a8bafdd79f97c2257d6a03cec9"
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
