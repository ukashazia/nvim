FROM alpine:latest

RUN apk update && apk upgrade

RUN apk update && apk upgrade && \
  apk add --no-cache \
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
  g++ \
  make \
  nodejs \
  npm \
  python3

WORKDIR /workdir

COPY . /root/.config/nvim

RUN nvim --headless '+Lazy! sync' +TSUpdateSync +qall

CMD [ "nvim", "/workdir" ]

