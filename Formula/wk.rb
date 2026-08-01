class Wk < Formula
  desc "Workato CLI — workspace operations, recipe management, and plugin system"
  homepage "https://github.com/workato-devs/wk"
  version "1.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Darwin_arm64.tar.gz"
      sha256 "7f0cb8cfed38945deef3b9ffd6bb56521b1e4301c0313519a9359b2d1e4277f7"
    else
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Darwin_x86_64.tar.gz"
      sha256 "08e55245dca195be59791789063ea73f1c84f7673f87779484f567c6289410cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Linux_arm64.tar.gz"
      sha256 "cf5a980170b2f9776615d9bfbb6e30e113858a51dfa338983dfaaed4b4fa8597"
    else
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Linux_x86_64.tar.gz"
      sha256 "3b0b904512051a9ec390173552b540a74669b2003f5ec953b8e2987abdfe835c"
    end
  end

  def install
    bin.install "wk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wk version")
  end
end
