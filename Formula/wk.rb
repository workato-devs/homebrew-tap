class Wk < Formula
  desc "Workato CLI — workspace operations, recipe management, and plugin system"
  homepage "https://github.com/workato-devs/wk-cli-beta"
  version "1.0.3-beta"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-cli-beta/releases/download/v#{version}/wk_#{version}_Darwin_arm64.tar.gz"
      sha256 "abc066f4803f57a6ccb19c29630116a1b28c094b75fc0dbb3eb3b57fdb6c8136"
    else
      url "https://github.com/workato-devs/wk-cli-beta/releases/download/v#{version}/wk_#{version}_Darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-cli-beta/releases/download/v#{version}/wk_#{version}_Linux_arm64.tar.gz"
      sha256 "0d3a181b1be72cdc485eaeb48dfeac043df802c7b363a961a43851684b40c87e"
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
