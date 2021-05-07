-- load all plugins
require("plugins")
require("configs.file-icons")
require("configs.bufferline")
require("configs.statusline")

require("settings")                     -- Nvim Global Settings
require("keymappings")                  -- All Shortcuts
require("configs.treesitter")
require("configs.dashboard")
require("configs.telescope")
require("configs.nvimTree")
require("configs.gitsigns")
require("configs.betterWhitespace")

require('configs.lspkind')              -- symbols for autocomplete

require("nvim-autopairs").setup()
require("colorizer").setup()
require('nvim_comment').setup()

require("configs.lspconfig")            -- Lsp All Configs (Langs)


-- Which Key (Hope to replace with Lua plugin someday)
-- vim.cmd('source ~/.config/nvim/vimscript/lv-whichkey/init.vim')
-- vim.cmd('source ~/.config/nvim/vimscript/functions.vim')
