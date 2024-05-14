--------------------------------------------------------------------------------------
-- DOL: "vimrc" options
--------------------------------------------------------------------------------------

require "nvchad.options"

local g   = vim.g
local opt = vim.opt
local o   = vim.o

o.cursorlineopt ='both' -- to enable cursorline!

opt.number     = false
opt.wrapscan   = false
opt.tabstop    = 4
opt.shiftwidth = 4
opt.wrap       = false
opt.showmatch  = true
opt.shada      = "!,%,'100,f1,<50,h,s10"
opt.timeoutlen = 300
opt.signcolumn = "no"
opt.shortmess:append "c"
opt.whichwrap  = "bs"                                    -- reset default (don't wrap on left right motion through lines)
-- opt.virtualedit="block"

opt.showtabline = 2                                      -- always show the tabline, and format it see  end of ~/.local/share/nvim/lazy/ui/lua/nvchad/tabufline/lazyload.lua
opt.tabline = "%!v:lua.require('nvchad.tabufline.modules')()"


vim.cmd([[autocmd FileType * set fo-=r fo-=c fo-=o]])    -- dont continue comments on enter, etc. see :h fo-table

vim.cmd([[au BufReadPost * if line("'\"") > 1 &&         
    \ line("'\"") <= line("$") |
    \ exe "normal! g`\"" | endif]])                      -- open file at previous cursor location

--======== Folding

opt.foldopen:remove({"search"})                          -- don't open folds when searching
opt.foldmethod = "marker"                                -- select then zf to fold; za, dz, zc, space: toggles, delete, close, open

--======== Autocommands

local autocmd = vim.api.nvim_create_autocmd

----- markdown, text, latex

autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.txt", "*.md", "*.tex"},
    callback = function()
        opt.wrap = true
        opt.linebreak = true
        opt.list = false
        opt.tw = 0
        opt.wm = 0
    end
})

--======== Snippets: user directory location, etc.

g.vscode_snippets_path = vim.fn.stdpath("config") .. "/lua/snippets"

--======== disable diagnostcs globally (diagnostics are a pain)

vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
