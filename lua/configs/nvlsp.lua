local M = {}
local map = vim.keymap.set

-- export on_attach & capabilities
M.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = 'LSP ' .. desc, noremap = true }
  end

  map('n', 'gD', vim.lsp.buf.declaration, opts 'Go to declaration')
  map('n', 'gd', vim.lsp.buf.definition, opts 'Go to definition')
  map('n', 'gi', vim.lsp.buf.implementation, opts 'Go to implementation')
  -- map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts 'Add workspace folder')
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts 'Remove workspace folder')
  map('n', '<leader>rn', vim.lsp.buf.rename, opts 'Rename stuff')
  map('n', 'H', vim.diagnostic.open_float, opts 'Open diagnostic float')

  map('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts 'List workspace folders')

  map('n', '<leader>D', vim.lsp.buf.type_definition, opts 'Go to type definition')

  map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts 'Code action')
  map('n', 'gr', vim.lsp.buf.references, opts 'Show references')

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded', width = 80 })
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

  -- vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end

-- disable semanticTokens
M.on_init = function(client, _)
  if client.supports_method 'textDocument/semanticTokens' then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

-- M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capailities = require('blink.cmp').get_lsp_capabilities()

return M
