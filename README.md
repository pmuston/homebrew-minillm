# homebrew-minillm

Homebrew tap for **minillm**: a private LLM server for an Apple Silicon Mac, and
the clients for using it.

```bash
brew tap pmuston/minillm
brew trust pmuston/minillm     # required for third-party taps
```

| Formula | Install on | Provides |
| --- | --- | --- |
| `minillm-server` | the Apple Silicon Mac (macOS 14+) | vllm-mlx as a Homebrew service with a built-in watchdog; `minillm-server setup / status / test / logs / key` |
| `minillm` | every client (macOS, Linux) | `ask`, `llmbatch` and `agent` |

```bash
# on the server
brew install minillm-server
minillm-server setup
brew services start minillm-server

# on each client
brew install minillm
```

Linux clients without Homebrew:

```bash
curl -fsSL https://pmuston.github.io/install.sh | sh -s minillm
```

## Guides

- [Server: getting started](https://pmuston.github.io/minillm/server/)
- [Clients: getting started](https://pmuston.github.io/minillm/clients/)

Release binaries are attached to this repo's [Releases](https://github.com/pmuston/homebrew-minillm/releases).
