class MinillmServer < Formula
  desc "Private LLM server for Apple Silicon: vllm-mlx as a service with a watchdog"
  homepage "https://github.com/pmuston/homebrew-minillm"
  url "https://github.com/pmuston/homebrew-minillm/releases/download/v0.1.4/minillm-server-v0.1.4.tar.gz"
  sha256 "f133df856f03f217e60cf89f1fdd4582a1f0462899e89f034f31a5cde4f8d8c4"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sonoma
  depends_on "uv"

  def install
    inreplace %w[minillm-server serve-llm.sh], "@@ETC_DIR@@", "#{etc}/minillm"
    inreplace "minillm-server", "@@LOG_FILE@@", "#{var}/log/minillm-server.log"
    inreplace "minillm-server", "@@LIBEXEC@@", opt_libexec.to_s
    bin.install "minillm-server"
    libexec.install "serve-llm.sh", "cache-test.py"
    doc.install "server.md"
  end

  def post_install
    (etc/"minillm").mkpath
    (var/"log").mkpath
  end

  def caveats
    <<~EOS
      Finish the install (vllm-mlx, config and API key), then start the server:
        minillm-server setup
        brew services start minillm-server

      Settings: #{etc}/minillm/config
      Log:      #{var}/log/minillm-server.log

      Getting started: https://pmuston.github.io/minillm/server/
    EOS
  end

  service do
    run opt_libexec/"serve-llm.sh"
    keep_alive true
    throttle_interval 30
    process_type :interactive
    log_path var/"log/minillm-server.log"
    error_log_path var/"log/minillm-server.log"
  end

  test do
    assert_match "minillm-server v#{version}", shell_output("#{bin}/minillm-server version")
  end
end
