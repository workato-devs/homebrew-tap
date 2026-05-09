class Wk < Formula
  desc "Workato CLI — workspace operations, recipe management, and plugin system"
  homepage "https://github.com/workato-devs/wk-cli-beta"
  version "1.0.4-beta"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-cli-beta/releases/download/v#{version}/wk_#{version}_Darwin_arm64.tar.gz"
      sha256 "1af9b581554dc63060d5d3b84aa7ae9b7f21b7db7db0d29d2d5c37657aa4ab1b"
    else
      url "https://github.com/workato-devs/wk-cli-beta/releases/download/v#{version}/wk_#{version}_Darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-cli-beta/releases/download/v#{version}/wk_#{version}_Linux_arm64.tar.gz"
      sha256 "240c3d8aa4699aadfa4359297863f03973e324a11052e3d55dde1378c76824c0"
    else
      url "https://github.com/workato-devs/wk-cli-beta/releases/download/v#{version}/wk_#{version}_Linux_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "wk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wk version")
  end
end
