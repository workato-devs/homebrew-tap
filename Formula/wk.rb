class Wk < Formula
  desc "Workato CLI — workspace operations, recipe management, and plugin system"
  homepage "https://github.com/workato-devs/wk-cli-beta"
  version "1.0.0-beta"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-cli-beta/releases/download/v#{version}/wk_#{version}_Darwin_arm64.tar.gz"
      sha256 "cdb456b190117ec9118f96cb90c7b512cd073b776592885fea71b545dee9a10d"
    else
      url "https://github.com/workato-devs/wk-cli-beta/releases/download/v#{version}/wk_#{version}_Darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-cli-beta/releases/download/v#{version}/wk_#{version}_Linux_arm64.tar.gz"
      sha256 "90a748e47add413888312e005886544ce6de8f1097ef9b2a11110422db21c020"
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
