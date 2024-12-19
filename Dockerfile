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
RUN nvim --headless -c "lua \
      local mason_registry = require('mason-registry'); \
      local lspconfig = require('mason-lspconfig') \
      local mappings = lspconfig.get_mappings() \
      mason_registry.refresh(); \
      package.path = '~/.config/nvim/lua/configs/lsp.lua' .. package.path; \
      local servers = require('configs.lsp').servers; \
      for _, server in ipairs(servers) do \
        local mason_package = mappings.lspconfig_to_mason[server]; \
        local pkg = mason_registry.get_package(mason_package); \
        if not pkg:is_installed() then \
          pkg:install():on('closed', function() \
            print(mason_package .. ' installed'); \
          end); \
        end \
      end; \
      vim.cmd('qall');"

CMD [ "nvim", "/workdir" ]

