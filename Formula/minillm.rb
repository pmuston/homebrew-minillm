class Minillm < Formula
  desc "Clients for a private LLM server: ask for one prompt, llmbatch for many"
  homepage "https://github.com/pmuston/homebrew-minillm"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.1/minillm-v0.1.1-darwin-arm64.tar.gz"
      sha256 "b787755fb84ded75045f23e6990159fd42f1903ee01faf6adb41d10f3e39ee0e"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.1/minillm-v0.1.1-darwin-amd64.tar.gz"
      sha256 "ffb4e15281d02e9ca809045687fb80f7427932be1850766a584d6cf9352be032"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.1/minillm-v0.1.1-linux-arm64.tar.gz"
      sha256 "1b180e97bee6cacfbecf9946a92fd2ff4b34211d0273246303d63e7cab07bd15"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.1/minillm-v0.1.1-linux-amd64.tar.gz"
      sha256 "2e1b667a31046d53790c4cb2ebe7608041916875f5ff03613e4ab913f45ee46c"
    end
  end

  def install
    bin.install "ask", "llmbatch"
    pkgshare.install "templates"
    doc.install "clients.md"
  end

  def caveats
    <<~EOS
      Point the clients at your server, e.g. in ~/.zshrc:
        export LLM_URL=http://macmini.local:8000/v1
        export LLM_KEY=<the output of 'minillm-server key' on the server>
        export LLM_MODEL=mlx-community/Qwen3.6-35B-A3B-4bit

      Example prompt templates are in:
        #{opt_pkgshare}/templates

      Getting started: https://pmuston.github.io/minillm/clients/
    EOS
  end

  test do
    assert_match "ask v#{version}", shell_output("#{bin}/ask -version")
    assert_match "llmbatch v#{version}", shell_output("#{bin}/llmbatch -version")
  end
end
