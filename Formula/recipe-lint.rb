class RecipeLint < Formula
  desc "Workato recipe linter — deterministic validation for wk lint"
  homepage "https://github.com/workato-devs/wk-lint-beta"
  version "1.0.1-beta"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Darwin_arm64.tar.gz"
      sha256 "02785f6552ad224da894e954c7ed4fa8c5445e116a8757e0884fe50385d01f1c"
    else
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Linux_arm64.tar.gz"
      sha256 "ef5e170bc620b4f2c05ae70b8e4e7eec490563b3f20a6466f856431d91f19367"
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
