local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- Lsp
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'kabouzeid/nvim-lspinstall'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use "nvim-telescope/telescope-media-files.nvim"

    -- Debugging
    use 'mfussenegger/nvim-dap'

    -- Autocomplete
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'
    use 'nvim-lua/completion-nvim'

    -- Editing
    use 'lewis6991/gitsigns.nvim'
    use 'windwp/nvim-autopairs'
    use 'terrortylor/nvim-comment'
    use "907th/vim-auto-save"
    use 'kevinhwang91/nvim-bqf'
    use "sbdchd/neoformat"
    use "norcalli/nvim-colorizer.lua"
    use "lukas-reineke/indent-blankline.nvim"
    use "alvan/vim-closetag"                        -- CloseTag exm. <html>

    -- UI
    use "dracula/vim"                               -- Colorscheme
    use 'kyazdani42/nvim-web-devicons'              -- Need https://www.nerdfonts.com/font-downloads
    use "glepnir/dashboard-nvim"                    -- Dashboard
    use 'nvim-treesitter/nvim-treesitter'           -- TreeSitter

    use 'kyazdani42/nvim-tree.lua'                  -- NvimTree
    use "preservim/tagbar"                          -- Tagbar (need ctags)
    use "mbbill/undotree"                           -- UndoTree

    -- Status Line and Bufferline
    use 'glepnir/galaxyline.nvim'                   -- Status Line
    use 'akinsho/nvim-bufferline.lua'               -- Buffer Line
end)
