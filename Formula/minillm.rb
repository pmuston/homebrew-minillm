class Minillm < Formula
  desc "Clients for a private LLM server: ask for one prompt, llmbatch for many"
  homepage "https://github.com/pmuston/homebrew-minillm"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.0/minillm-v0.1.0-darwin-arm64.tar.gz"
      sha256 "c814abe761267d2bf76fc51796ea23195600e61d6c48a59c216d6f690ff1c187"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.0/minillm-v0.1.0-darwin-amd64.tar.gz"
      sha256 "99a5d12baa90a1d7e7ac8bd230022f31a842c3d9b14c23cb806b8191dbb25099"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.0/minillm-v0.1.0-linux-arm64.tar.gz"
      sha256 "394f0221a207c50f0ff6ec8abb7e5cad30aac28ffd75012d8ae5b747d7c2a864"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.0/minillm-v0.1.0-linux-amd64.tar.gz"
      sha256 "e2b49deccb54302874ffa73b5c02accf37e84ff20f4a36a6130d209d2f71e2a6"
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
