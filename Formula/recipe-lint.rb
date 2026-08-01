class RecipeLint < Formula
  desc "Workato recipe linter — deterministic validation for wk lint"
  homepage "https://github.com/workato-devs/recipe-lint"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/recipe-lint/releases/download/v#{version}/recipe-lint_#{version}_Darwin_arm64.tar.gz"
      sha256 "ea3065c319f11901e41ab53c21dbf40b8ce8ebdf2b54c84419fee6167c3f7ee4"
    else
      url "https://github.com/workato-devs/recipe-lint/releases/download/v#{version}/recipe-lint_#{version}_Darwin_x86_64.tar.gz"
      sha256 "cb045e9d952f55bc5d4ea6b55ba42cc210603f656e51320c54d252ed6c133faa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/workato-devs/recipe-lint/releases/download/v#{version}/recipe-lint_#{version}_Linux_arm64.tar.gz"
      sha256 "a15fcb43947a5c3bfca0be78e47950e6bd1a290de0389855028e809f30d875e1"
    else
      url "https://github.com/workato-devs/recipe-lint/releases/download/v#{version}/recipe-lint_#{version}_Linux_x86_64.tar.gz"
      sha256 "0235f16a999c24ed889c3c086715e676ea0106a92cfd6b54885b716be84175d7"
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
