class Minillm < Formula
  desc "Clients for a private LLM server: ask, llmbatch and a tool-using agent"
  homepage "https://github.com/pmuston/homebrew-minillm"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.3/minillm-v0.1.3-darwin-arm64.tar.gz"
      sha256 "4ef130db128d5f5407c7cc4b2fdd870b89216c89553045378d5196ccd691aef5"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.3/minillm-v0.1.3-darwin-amd64.tar.gz"
      sha256 "df46ae56e0db309b6c2f6eb9e87d85000bfcc76b27b4abdc4d3163aef7c23a04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.3/minillm-v0.1.3-linux-arm64.tar.gz"
      sha256 "dfab609872bfff1d30de2724c75bd6d655ada331b0b2d45e79b7b5e1c96b339c"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.3/minillm-v0.1.3-linux-amd64.tar.gz"
      sha256 "3f07f4bf32bd49609788a692756c5e84140ac0400afbb08c213745c483c92fba"
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
