-- load all plugins
require("plugins")
require("configs.file-icons")
require("configs.bufferline")
require("configs.statusline")
require("configs.compe")
require("settings")                     -- Nvim Global Settings
require("keymappings")                  -- All Shortcuts
require("configs.treesitter")
require("configs.dashboard")
require("configs.telescope")
require("configs.nvimTree")
require("configs.gitsigns")

require('configs.lspkind')              -- symbols for autocomplete

require("lspinstall").setup()
require("nvim-autopairs").setup()
require("colorizer").setup()
require('nvim_comment').setup()

require("configs.lspconfig")
-- Lsp
--require('configs.lsp')
require('configs.lsp.python')
require('configs.lsp.go')
require('configs.lsp.yaml')
require('configs.lsp.lua')
require('configs.lsp.bash')
require('configs.lsp.css')
require('configs.lsp.docker')
require('configs.lsp.html')
require('configs.lsp.js-ts')
require('configs.lsp.json')
require('configs.lsp.vim')

-- Which Key (Hope to replace with Lua plugin someday)
-- vim.cmd('source ~/.config/nvim/vimscript/lv-whichkey/init.vim')
-- vim.cmd('source ~/.config/nvim/vimscript/functions.vim')
