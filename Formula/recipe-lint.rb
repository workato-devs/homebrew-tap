class RecipeLint < Formula
  desc "Workato recipe linter — deterministic validation for wk lint"
  homepage "https://github.com/workato-devs/wk-lint-beta"
  version "1.0.1-beta"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Darwin_arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Linux_arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/workato-devs/wk-lint-beta/releases/download/v#{version}/recipe-lint_#{version}_Linux_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"recipe-lint"
  end

  def post_install
    system bin/"recipe-lint", "--version" rescue nil
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/recipe-lint --version")
  end
end
