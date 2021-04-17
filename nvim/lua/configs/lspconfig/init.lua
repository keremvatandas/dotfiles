local nvim_lsp = require('lspconfig')
local lsp_status = require('lsp-status')
local completion = require('completion')

local map = function(type, key, value)
	vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end


local custom_attach = function(client)
    print("LSP started.");
    completion.on_attach(client)
    lsp_status.on_attach(client)

    map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
    map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
    map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
    map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
    map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
    map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
    map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
    map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
    map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
    map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
    map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
    map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
    map('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
    map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
    map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end


-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "python", "go", "lua", "yaml", "bash", "dockerfile",
                  "html", "vim", "json", "typescript", "cpp", "cmake", "css" }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
      on_attach = custom_attach,
      capabilities = lsp_status.capabilities
  }
end

require'lspconfig'.python.setup{
    on_attach=custom_attach,
    capabilities = lsp_status.capabilities,
    settings = {
        python = {
            pythonPath = "/Users/keremv/.pyenv/versions/logsign/bin/python3.6",
            venvPath = "/Users/keremv/.pyenv/"
        },
    }
}
