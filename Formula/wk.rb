class Wk < Formula
  desc "Workato CLI — workspace operations, recipe management, and plugin system"
  homepage "https://github.com/workato-devs/wk"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Darwin_arm64.tar.gz"
      sha256 "e4536d65214d69c68570f38d4d5adc75c1b0b4babe36df57227e4a9301e1b47e"
    else
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Darwin_x86_64.tar.gz"
      sha256 "588ca104df40bf74c8b668a7bed9942e6fd8b41301b35091ce8ca0e77263a664"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Linux_arm64.tar.gz"
      sha256 "c2b17da81cf9ae07994eca28ef1d2fce96fb14ae81e673ec022071a72bd0b38f"
    else
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Linux_x86_64.tar.gz"
      sha256 "b62392dfb6c923214d9dc9dcd418b399d4697abdd0d874da2a55344afccfc5e6"
    end
  end

  def install
    bin.install "wk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wk version")
  end
end
