class Minillm < Formula
  desc "Clients for a private LLM server: ask, llmbatch and a tool-using agent"
  homepage "https://github.com/pmuston/homebrew-minillm"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.5/minillm-v0.1.5-darwin-arm64.tar.gz"
      sha256 "bd6f6584e78ac58e502ad4ce9ddd17099e6c59aa1198b29baa8dd7dd17498876"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.5/minillm-v0.1.5-darwin-amd64.tar.gz"
      sha256 "a68f0c97cb7ed523de8ddaeb416b7c68ac013d848c3a2219b99442d2e4d0c893"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.5/minillm-v0.1.5-linux-arm64.tar.gz"
      sha256 "e7103a9d1771d9385e51bfba3c0292f1e09afea3ed1cb1edaeae13841e556261"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.5/minillm-v0.1.5-linux-amd64.tar.gz"
      sha256 "70b2a86e49f03acec3ed0bb5b9935d9fcf1ca0b7268cede4a5068ab497c9b89e"
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
