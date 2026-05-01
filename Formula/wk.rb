class Wk < Formula
  desc "Workato CLI — workspace operations, recipe management, and plugin system"
  homepage "https://github.com/workato-devs/wk-cli-beta"
  version "1.0.2-beta"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-cli-beta/releases/download/v#{version}/wk_#{version}_Darwin_arm64.tar.gz"
      sha256 "710686a04bfea4518f588b859272c9e8fd75afa5677c2a3e7e2b60c769103d75"
    else
      url "https://github.com/workato-devs/wk-cli-beta/releases/download/v#{version}/wk_#{version}_Darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-cli-beta/releases/download/v#{version}/wk_#{version}_Linux_arm64.tar.gz"
      sha256 "29d8f4bb469bb6f00d2b3be842484cc295f362f94397d8f7e95e4e148bad3769"
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
