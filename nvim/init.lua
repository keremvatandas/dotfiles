-- load all plugins
require("plugins")
require("configs.file-icons")
require("configs.bufferline")
require("configs.statusline")
require("colorizer").setup()
require("lspinstall").setup()
require("configs.compe")
require("configs.lspconfig")
require("settings")                     -- Nvim Global Settings
require("keymappings")                  -- All Shortcuts
require('nvim_comment').setup()
require("configs.treesitter")
require("configs.dashboard")
require("configs.telescope")
require("configs.nvimTree")
require("configs.gitsigns")
require("nvim-autopairs").setup()

-- symbols for autocomplete
require('lspkind').init({
    with_text = true,
    symbol_map = {
      Text = '  ',
      Method = '  ',
      Function = '  ',
      Constructor = '  ',
      Variable = '[]',
      Class = '  ',
      Interface = ' 蘒',
      Module = '  ',
      Property = '  ',
      Unit = ' 塞 ',
      Value = '  ',
      Enum = ' 練',
      Keyword = '  ',
      Snippet = '  ',
      Color = '',
      File = '',
      Folder = ' ﱮ ',
      EnumMember = '  ',
      Constant = '  ',
      Struct = '  '
    },
})



-- Which Key (Hope to replace with Lua plugin someday)
-- vim.cmd('source ~/.config/nvim/vimscript/lv-whichkey/init.vim')
-- vim.cmd('source ~/.config/nvim/vimscript/functions.vim')
