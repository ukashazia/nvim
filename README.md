## Neovim configuration & container image

### Usage

``` bash
docker run -d --name nvim -v /your_project_path:/workdir ghcr.io/ukashazia/nvim:main
```
and then 
``` bash
docker exec -it nvim nvim
```

### Languages in the container
- golang
- rust (cargo)
- clang
- javascript (node)
- lua

### Lsps in the container
- 'ansiblels'
- 'arduino_language_server'
- 'jinja_lsp'
- 'lexical'
- 'cssls'
- 'docker_compose_language_service'
- 'dockerls'
- 'pyright'
- 'lua_ls'
- 'ts_ls'
- 'jsonls'
- 'jdtls'
- 'tailwindcss'
- 'clangd'
- 'yamlls'
- 'helm_ls'
- 'bashls'
- 'eslint'
- 'rust_analyzer'
- 'gopls'
- 'cmake'
- 'ember'
- 'gradle_ls'
- 'html'
- 'biome'
- 'taplo'
- 'zls'

### Language syntax parsers
All of the treesitter parsers are available in the container
