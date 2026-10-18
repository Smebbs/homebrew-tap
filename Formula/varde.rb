class Varde < Formula
  desc "Task management and memory for AI coding agents"
  homepage "https://github.com/Smebbs/varde"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.5.0/varde-v1.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "c517eda20fb83129a7392236c96b2906c202f503864f03f7c829ed1270629ca1"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.5.0/varde-v1.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "4a51ef98f9721c5e9b0c2a02d029e64f24196422239c35269784426c6f09cb56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Smebbs/varde/releases/download/v1.5.0/varde-v1.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4ee257bfb04e143388bcd6090ce45ca1f30e47ddca73baf2fbd0e4403211b330"
    end
    on_intel do
      url "https://github.com/Smebbs/varde/releases/download/v1.5.0/varde-v1.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "81fa1ab551f71339796e63c2bc7bd7e76490371543afb996d5d99ad29559548b"
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
