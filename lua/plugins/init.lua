return {

    --=============================================================================================
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },
    --=============================================================================================
    {
        -- switch between header file and source file
        "jakemason/ouroboros",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require('ouroboros').setup({
                extension_preferences_table = {
                    cc  = {h   = 2, hpp = 1},
                    cpp = {hpp = 2, h   = 1},
                    c   = {h   = 2, hpp = 1},
                    h   = {cc  = 3, cpp = 2, c = 1},
                    hpp = {cpp = 2, c   = 1},
                }
            })
        end
    },
    --=============================================================================================
    {
        -- generate dummy text :Loremipsum or :Loremipsum 1000
        "vim-scripts/loremipsum",
        ft = {'markdown', 'text', 'tex', 'plaintex'}
    },
    --=============================================================================================
    {
        -- move between vim windows and tmux windows seemlessly (same command)
        "alexghergh/nvim-tmux-navigation",
        lazy = false,
        config = function()
            local nvim_tmux_nav = require('nvim-tmux-navigation')
            nvim_tmux_nav.setup {
                disable_when_zoomed = true -- defaults to false
            }
        end
    },
    --=============================================================================================
    {
        -- make the scrolling (like page up) slower so that we don't lose our place visually
        "karb94/neoscroll.nvim",
        lazy = false,
        config = function()
            require("neoscroll").setup({})

            local t = {}
            t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
            t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}
            t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
            t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}}
            t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
            t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
            t['zt']    = {'zt', {'250'}}
            t['zz']    = {'zz', {'250'}}
            t['zb']    = {'zb', {'250'}}
            require("neoscroll.config").set_mappings(t)
        end,
    },
    --=============================================================================================
    {
        -- with multiple windows, allows toggling the current window to full size
        "szw/vim-maximizer",
        lazy = false,
    },
    --=============================================================================================
    {
        -- easily open and close terminal
        "kassio/neoterm",
        lazy = false,
        config = function()
            vim.g.neoterm_default_mod = 'botright'
            vim.g.neoterm_autoinsert = 1
            vim.g.neoterm_size = 20
        end,
    },

    --=============================================================================================
    {
        -- compile/view markdown in a browser while editing code in vim
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    --=============================================================================================
    {
        -- latex tools
        "lervag/vimtex",
        ft = { 'tex', 'plaintex' },
        config = function()
            vim.g.vimtex_view_method = 'skim'
            vim.g.tex_flavor = 'latex'
            vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
            vim.g.vimtex_compiler_progname = 'nvr'
        end
    },

    --=============================================================================================
    --=============================================================================================
    --=============================================================================================
    --------- Disable NvChad installed plugins

    { "folke/which-key.nvim",                enabled = false, },
    { "lukas-reineke/indent-blankline.nvim", enabled = false, },



  --{
  --  "stevearc/conform.nvim",
  --  -- event = 'BufWritePre', -- uncomment for format on save
  --  config = function()
  --    require "configs.conform"
  --  end,
  --},
  --
  -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end,
  -- },
  --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
