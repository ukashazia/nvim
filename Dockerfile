FROM debian:sid-slim

RUN apt update && apt install -y \
  bash \
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

RUN nvim --headless '+Lazy sync' +qall
RUN nvim --headless '+TSInstall all' +qall
RUN nvim --headless -c 'lua require("configs.lsp").InstallLsps()' +qall || true

CMD [ "nvim", "/workdir" ]

