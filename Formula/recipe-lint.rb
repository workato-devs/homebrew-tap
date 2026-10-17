class RecipeLint < Formula
  desc "Workato recipe linter — deterministic validation for wk lint"
  homepage "https://github.com/workato-devs/recipe-lint"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/recipe-lint/releases/download/v#{version}/recipe-lint_#{version}_Darwin_arm64.tar.gz"
      sha256 "4f8dd09e9ef530518ea63fc137da95426a5685e32c136ccfafdeea08001abcf0"
    else
      url "https://github.com/workato-devs/recipe-lint/releases/download/v#{version}/recipe-lint_#{version}_Darwin_x86_64.tar.gz"
      sha256 "f36584f198b39cf7f1d1a7be7d9547126e8fea78f7b74a71817261d51d3a065e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/recipe-lint/releases/download/v#{version}/recipe-lint_#{version}_Linux_arm64.tar.gz"
      sha256 "56768e565ca8b05f78081be9e8a9abc415f10237caf0876f019ea1aea8ea2e7a"
    else
      url "https://github.com/workato-devs/recipe-lint/releases/download/v#{version}/recipe-lint_#{version}_Linux_x86_64.tar.gz"
      sha256 "33c3488e6d459f3cc582cd6c6de424d25fe6cef7bbb8a741818a893fc76fc263"
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
