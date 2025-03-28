FROM archlinux:latest

RUN pacman -Syu --noconfirm \
  bash \
  curl \
  git \
  jq \
  tmux \
  zsh \
  ripgrep \
  fzf \
  fd \
  clang \
  gcc \
  make \
  nodejs \
  npm \
  python3 \
  luarocks \
  lua \
  go \
  cargo

WORKDIR /workdir

RUN mkdir -p /tmp/nvim && \
  curl -sSL https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz -o /tmp/nvim/nvim-nightly.tar.gz && \
  tar -xzf /tmp/nvim/nvim-nightly.tar.gz -C /tmp/nvim && \
  rm /usr/local/share/man && \
  cp -r /tmp/nvim/nvim-linux-x86_64/* /usr/local/

COPY . /root/.config/nvim

RUN nvim --headless '+Lazy sync' +qall
RUN nvim --headless -c 'lua print("installing treesitter grammars")' +qall
RUN nvim --headless -c 'lua require("configs.lsp").InstallLsps()' +qall || true

CMD [ "nvim", "/workdir" ]

