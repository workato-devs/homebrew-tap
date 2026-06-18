class Wk < Formula
  desc "Workato CLI — workspace operations, recipe management, and plugin system"
  homepage "https://github.com/workato-devs/wk"
  version "1.0.6-beta"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Darwin_arm64.tar.gz"
      sha256 "4a0a15594cfb8dbe8bc7b7740c5b3c562f8a125b48f844d572c07e659fd0e320"
    else
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Darwin_x86_64.tar.gz"
      sha256 "d2743a6e211a9eaeef1b1e063f3de915ecbe637a6b05cdaf18dc1c23bc70e5a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Linux_arm64.tar.gz"
      sha256 "2d0320b7c8b8ab6ec8f5f37c210a2726f9c395d1f71b24cea6b1dd3b0340c34e"
    else
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Linux_x86_64.tar.gz"
      sha256 "d9d51beb2088a0e05d04610177087dae5d804a4478b3c0ccebb1f9e7833ca7fe"
    end
  end

  def install
    bin.install "wk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wk version")
  end
end
