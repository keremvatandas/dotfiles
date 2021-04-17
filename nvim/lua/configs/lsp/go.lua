require'lsp_config'.gopls.setup{
    filetypes = {'go'},
    cmd = {DATA_PATH .. "/lspinstall/go/gopls"},
    on_attach = require'lsp'.common_on_attach
}

