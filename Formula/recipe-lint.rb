class RecipeLint < Formula
  desc "Workato recipe linter — deterministic validation for wk lint"
  homepage "https://github.com/workato-devs/wk-lint-beta"
  version "1.0.5-beta"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Darwin_arm64.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    else
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Linux_arm64.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    else
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Linux_amd64.tar.gz"
      sha256 "PLACEHOLDER"
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
