FROM debian:experimental

ARG TARGETPLATFORM

RUN apt update && apt install -y \
  bash \
  fish \
  curl \
  git \
  jq \
  neovim \
  tmux \
  zsh \
  ripgrep \
  fzf \
  fd-find \
  clang \
  gcc \
  make \
  nodejs \
  npm \
  python3 \
  luarocks \
  lua5.3 \
  golang-go \
  cargo

WORKDIR /workdir

COPY . /root/.config/nvim

RUN case "$TARGETPLATFORM" in \
  "linux/arm64") \
  wget -O /opt/nvim https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-arm64.tar.gz && \
  tar -xzf /opt/nvim -C /opt && \
  cp -r /opt/nvim-linux-arm64/* /usr ;; \
  "linux/amd64") \
  wget -O /opt/nvim https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz && \
  tar -xzf /opt/nvim -C /opt && \
  cp -r /opt/nvim-linux-x86_64/* /usr ;; \
  *) echo "Unsupported platform: $TARGETPLATFORM" && exit 1 ;; \
  esac

RUN nvim --headless '+Lazy sync' +qall
RUN nvim --headless '+TSInstall all' '+sleep 600' +qall
RUN nvim --headless -c 'lua require("configs.lsp").InstallLsps()' +qall || true

ENTRYPOINT [ "fish" ]

