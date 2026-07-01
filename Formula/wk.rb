class Wk < Formula
  desc "Workato CLI — workspace operations, recipe management, and plugin system"
  homepage "https://github.com/workato-devs/wk"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Darwin_arm64.tar.gz"
      sha256 "c69a0a2d66c26d4ae4fbcf32ebb61e05dc593d8fa924666510f4d78b45ec91c8"
    else
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Darwin_x86_64.tar.gz"
      sha256 "211494b35ea39fb8eb72129657dbff25366a04cc4a6cd9c92f2db5449c4f4789"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Linux_arm64.tar.gz"
      sha256 "75f65c2088765e8e7f09700a2971b35d69cc6bf19c2fa1043a6a626488ca0e3e"
    else
      url "https://github.com/workato-devs/wk/releases/download/v#{version}/wk_#{version}_Linux_x86_64.tar.gz"
      sha256 "2aff334e0b59fb56869aef14a8494ede7e3f2bcbad4647f13747152e8c9cda58"
    end
  end

  def install
    bin.install "wk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wk version")
  end
end
