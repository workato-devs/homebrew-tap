class RecipeLint < Formula
  desc "Workato recipe linter — deterministic validation for wk lint"
  homepage "https://github.com/workato-devs/recipe-lint"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/recipe-lint/releases/download/v#{version}/recipe-lint_#{version}_Darwin_arm64.tar.gz"
      sha256 "b6f9ff852833517a331ad1b2ccb879b3a2d86454eecdf4088cad5787c6574cb1"
    else
      url "https://github.com/workato-devs/recipe-lint/releases/download/v#{version}/recipe-lint_#{version}_Darwin_x86_64.tar.gz"
      sha256 "bad82e23c68c811fb68f89535c61057dbbfe0af0f5f9b126cb46d70965f56934"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/recipe-lint/releases/download/v#{version}/recipe-lint_#{version}_Linux_arm64.tar.gz"
      sha256 "5da53b2f171dac37fb1197af08fea66b0fd101bf0e1cc512866395b2c261788c"
    else
      url "https://github.com/workato-devs/recipe-lint/releases/download/v#{version}/recipe-lint_#{version}_Linux_x86_64.tar.gz"
      sha256 "118dfca28797eccdbf26c57a4b92e924d69ec4daed3733147b15b6311b975b95"
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
