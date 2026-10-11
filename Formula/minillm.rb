class Minillm < Formula
  desc "Clients for a private LLM server: ask, llmbatch and a tool-using agent"
  homepage "https://github.com/pmuston/homebrew-minillm"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.4/minillm-v0.1.4-darwin-arm64.tar.gz"
      sha256 "0109ef68b4551ed154c4cb7ef3b7d2fa90abf3fc8c0bd65d6e3ceb99dd23a870"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.4/minillm-v0.1.4-darwin-amd64.tar.gz"
      sha256 "41f8b22979b75747e974a21a95014f6468055b271b50fdb8ded0273db93e56c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.4/minillm-v0.1.4-linux-arm64.tar.gz"
      sha256 "f65e0cc54dbd02ad9a2620dcbb536b58025fc67626509c72e93c59f525ca6cc2"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.4/minillm-v0.1.4-linux-amd64.tar.gz"
      sha256 "7c798cd3eb215e96c22688361a477eb55f6a8b14fe0436a0651723e967ac74d1"
    end
  end

  def install
    bin.install "ask", "llmbatch", "agent"
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
    assert_match "agent v#{version}", shell_output("#{bin}/agent -version")
  end
end
