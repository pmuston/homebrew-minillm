class Minillm < Formula
  desc "Clients for a private LLM server: ask, llmbatch and a tool-using agent"
  homepage "https://github.com/pmuston/homebrew-minillm"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.2/minillm-v0.1.2-darwin-arm64.tar.gz"
      sha256 "78b06e2148b6176328650f7e009fabb70eb5160cd7517b4e2060fd36efcb522c"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.2/minillm-v0.1.2-darwin-amd64.tar.gz"
      sha256 "504cc1c65b8e6f728a4e02944d12dc0086658be60e1aaadf117116e97b6d707d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.2/minillm-v0.1.2-linux-arm64.tar.gz"
      sha256 "9810236a1db061a62aa7beb00ceef04fae2bf584d40f792a05e4d7f3cd33f570"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.2/minillm-v0.1.2-linux-amd64.tar.gz"
      sha256 "b62cd10967ac8858a399bddff8e8f8b148d471a5d3fca5ecc05d9197eccada8b"
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
