class Wk < Formula
  desc "Workato CLI — workspace operations, recipe management, and plugin system"
  homepage "https://github.com/workato-devs/wk"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Darwin_arm64.tar.gz"
      sha256 "f19dcc3e998a83ea79fdce93a28222fb624e0b1d7dab10c98e5f597dee24f5a1"
    else
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Darwin_x86_64.tar.gz"
      sha256 "a93045ee6ec77316aad1852f1d8e31e27c2c84ed4c62a07aef895eb0c5893a3a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Linux_arm64.tar.gz"
      sha256 "476ef3492cc5307c3d000e146ec7d31009cb91e8827e092eebe343706a12941f"
    else
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Linux_x86_64.tar.gz"
      sha256 "25520ea1630d19a31b535c5aa1477cc29b6a34e9e3f71c26cbe76f64ca681f30"
    end
  end

  def install
    bin.install "wk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wk version")
  end
end
