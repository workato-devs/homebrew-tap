class Wk < Formula
  desc "Workato CLI — workspace operations, recipe management, and plugin system"
  homepage "https://github.com/workato-devs/wk-cli-beta"
  version "1.0.5-beta"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-cli-beta/releases/download/v#{version}/wk_#{version}_Darwin_arm64.tar.gz"
      sha256 "a4cc60281232d2c0a143afdd6b6feea7d81e4d3ba646228a495d71502151f671"
    else
      url "https://github.com/workato-devs/wk-cli-beta/releases/download/v#{version}/wk_#{version}_Darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-cli-beta/releases/download/v#{version}/wk_#{version}_Linux_arm64.tar.gz"
      sha256 "a3b697e5e073a449e6e0fccb5fff6ea7a822111b56b2b9d8b40f2ff80412152c"
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
