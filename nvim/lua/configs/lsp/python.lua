-- DATA_PATH = vim.fn.stdpath('data')
-- CACHE_PATH = vim.fn.stdpath('cache')

require'lspconfig'.python.setup{
    on_attach=require'completion'.on_attach
}

