class RecipeLint < Formula
  desc "Workato recipe linter — deterministic validation for wk lint"
  homepage "https://github.com/workato-devs/wk-lint-beta"
  version "1.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Darwin_arm64.tar.gz"
      sha256 "d6bfafbb5d46577985f80ed4e2598e940ec503a82f79a6cba2e174dadd80e6ff"
    else
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Linux_arm64.tar.gz"
      sha256 "57baefa05d244a239bdc76459bf895fe4692d34994809e285d43800b1b58d500"
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
