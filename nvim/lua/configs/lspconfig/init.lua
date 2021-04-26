local nvim_lsp = require('lspconfig')
local lsp_status = require('lsp-status')
local completion = require('completion')

local saga = require 'lspsaga'
saga.init_lsp_saga()


local map = function(type, key, value)
	vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end


local custom_attach = function(client)
    print("LSP started.");
    completion.on_attach(client)
    lsp_status.on_attach(client)

    --map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
    map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
    map('n','gp','<cmd>:Lspsaga preview_defination<CR>')

    map('n','K','<cmd>:Lspsaga hover_doc<CR>')
    map('n','gf','<cmd>:Lspsaga lsp_finder<CR>')
    map('n','gs','<cmd>:Lspsaga signature_help<CR>')
    map('n','gr','<cmd>:Lspsaga rename<CR>')

    map('n','<leader>ca','<cmd>:Lspsaga code_action<CR>')
    map('n','<leader>ca','<cmd>:Lspsaga range_code_action<CR>')

    map('n','<leader>ee','<cmd>:Lspsaga show_line_diagnostics<CR>')
    map('n','<leader>ec','<cmd>:Lspsaga show_cursor_diagnostics<CR>')
    map('n','[e','<cmd>:Lspsaga diagnostic_jump_next<CR>')
    map('n',']e','<cmd>:Lspsaga diagnostic_jump_prev<CR>')

  -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=DarkRed
        hi LspReferenceText cterm=bold ctermbg=red guibg=DarkRed
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=DarkRed
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
    ]], false)
    end

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

nvim_lsp.python.setup{
    on_attach=custom_attach,
    capabilities = lsp_status.capabilities,
    settings = {
        python = {
            pythonPath = "/Users/keremv/.pyenv/versions/logsign/bin/python3.6",
            venvPath = "/Users/keremv/.pyenv/"
        },
    }
}
