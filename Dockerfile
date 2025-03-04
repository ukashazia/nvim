FROM archlinux:latest

RUN pacman -Syu --noconfirm \
  bash \
  curl \
  git \
  jq \
  neovim \
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
  go

WORKDIR /workdir

COPY . /root/.config/nvim

RUN nvim --headless '+Lazy sync' +qall
RUN nvim --headless -c 'lua print("installing treesitter grammars")' +qall
RUN nvim --headless -c 'lua require("configs.lsp").InstallLsps()' +qall || true

CMD [ "nvim", "/workdir" ]

