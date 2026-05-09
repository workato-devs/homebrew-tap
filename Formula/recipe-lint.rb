class RecipeLint < Formula
  desc "Workato recipe linter — deterministic validation for wk lint"
  homepage "https://github.com/workato-devs/wk-lint-beta"
  version "1.0.6-beta"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Darwin_arm64.tar.gz"
      sha256 "978e55ead5f8f206b7771609b8c931b7032e195e690c212877c8fa5461aecd9f"
    else
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Linux_arm64.tar.gz"
      sha256 "e1d8694b5332207821c3187b895d327b14c2958c9fac7b8ce6965d8a6707a247"
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
