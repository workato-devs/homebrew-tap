class RecipeLint < Formula
  desc "Workato recipe linter — deterministic validation for wk lint"
  homepage "https://github.com/workato-devs/recipe-lint"
  version "1.0.7-beta"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/recipe-lint/releases/download/v#{version}/recipe-lint_#{version}_Darwin_arm64.tar.gz"
      sha256 "159bda84eba4a32e0e35d97e57b8e7c348cb6416f975165c0e3e50afac2c229e"
    else
      url "https://github.com/workato-devs/recipe-lint/releases/download/v#{version}/recipe-lint_#{version}_Darwin_x86_64.tar.gz"
      sha256 "1e8c60b9ebbca6057586fca9d997254f956d2e33d9927f01c8f351f4e3a5256d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/recipe-lint/releases/download/v#{version}/recipe-lint_#{version}_Linux_arm64.tar.gz"
      sha256 "447de08bcd456d42218602a94a2c9d3d2997acb4c28017947eeb9bd48fab0049"
    else
      url "https://github.com/workato-devs/recipe-lint/releases/download/v#{version}/recipe-lint_#{version}_Linux_x86_64.tar.gz"
      sha256 "11d5accbb6cbdca24e390b2141deeec01896a485b59fbcf6d8c1f4bf62411926"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"recipe-lint"
  end

  test do
    pipe_output(bin/"recipe-lint", '{"jsonrpc":"2.0","id":1,"method":"shutdown"}', 0)
  end
end
