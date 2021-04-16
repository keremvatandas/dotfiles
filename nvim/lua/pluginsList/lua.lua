-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

-- using { } when using a different branch of the plugin or loading the plugin with certain commands
return require("packer").startup(
    function()
        use {"wbthomason/packer.nvim", opt = true}
        use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}

        use "kyazdani42/nvim-web-devicons"
        use "kyazdani42/nvim-tree.lua"
        use "lewis6991/gitsigns.nvim"
        use "akinsho/nvim-bufferline.lua"
        use "glepnir/galaxyline.nvim"
        use "907th/vim-auto-save"
        use "norcalli/nvim-colorizer.lua"
        use "ryanoasis/vim-devicons"
        use "sbdchd/neoformat"
        use "hrsh7th/nvim-compe"
        use "windwp/nvim-autopairs"
        use "alvan/vim-closetag"
        use "tweekmonster/startuptime.vim"
        use "onsails/lspkind-nvim"

        use "nvim-lua/plenary.nvim"
        use "nvim-treesitter/nvim-treesitter"
        use "nvim-telescope/telescope.nvim"
        use "nvim-telescope/telescope-media-files.nvim"
        use "nvim-lua/popup.nvim"
        use "nvim-lua/lsp-status.nvim"
        use "nvim-lua/diagnostic-nvim"
        use "nvim-lua/completion-nvim"
        use "neovim/nvim-lspconfig"
        use "kabouzeid/nvim-lspinstall"
        use "karb94/neoscroll.nvim"
        use "terrortylor/nvim-comment"
        use "nekonako/xresources-nvim"
        use "glepnir/dashboard-nvim"
        use "dracula/vim"
        use "preservim/tagbar"
        use "mbbill/undotree"
    end
)
