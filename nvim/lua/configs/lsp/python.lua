DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

local lsp = require 'lspconfig'

-- npm i -g pyright
lsp.python.setup {
    cmd = {DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"},
    --on_attach = require'lsp'.common_on_attach,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = python.diagnostics.virtual_text,
            signs = python.diagnostics.signs,
            underline = python.diagnostics.underline,
            update_in_insert = true
        })
    }
}

