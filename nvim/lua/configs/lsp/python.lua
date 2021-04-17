-- DATA_PATH = vim.fn.stdpath('data')
-- CACHE_PATH = vim.fn.stdpath('cache')

require'lspconfig'.python.setup{
    on_attach=require'completion'.on_attach,
    settings = {
        python = {
            pythonPath = "/Users/keremv/.pyenv/versions/logsign/bin/python3.6",
            venvPath = "/Users/keremv/.pyenv/"
        },
    }
}
