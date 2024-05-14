require "nvchad.mappings"

local map = vim.keymap.set

--============= disable nvchad mappings

local nomap = vim.keymap.del

nomap({"n", "t"}, "<A-i>")   -- term
nomap({"n", "t"}, "<A-h>")
nomap({"n", "t"}, "<A-v>")
nomap("n", "<leader>h")
nomap("n", "<leader>v")

nomap("n", "<leader>wK")     -- whichkey
nomap("n", "<leader>wk")

--============= General
-- nvim tree file expolorer, go up a directory with a dash -

map("n",             "<leader><space>", ":noh<CR>",                   {desc = "cancel the search highlight"})
map("n",             "<leader>w",       ":w<CR>",                     {desc = "save buffer"})
map("n",             "<leader>rtw",     ":%s/\\s\\+$//e<CR>",         {desc = "remove trailing whitespace"})
map("n",             "<leader>s",       "<cmd> Ouroboros<CR>",        {desc = "switch between header and source file"})
map("n",             "<leader>e",       "<cmd> NvimTreeToggle <CR>",  {desc = "toggle nvimtree file explorer"})
map("v",             ">",               ">gv",                        {desc = "indent"})
map("t",             "<Esc>",           "<C-\\><C-n>",                {desc = "terminal escape to normal mode"})
map("i",             "jj",              "<ESC>",                      {desc = "another way to escape"})
map({"i", "n", "v"}, "<leader>wc",      "g<C-g>",                     {desc = "word count"})
map({"i", "n"},      "<leader>w",       ":w<CR>",                     {desc = "save buffer"})
map("n",             "<leader>zt",      ":<C-u>exec 'normal! ' . 15 . 'kzt' . 15 . 'j' <CR>", {desc = "scroll so cursor is 15 lines from the top"})

--============= File specific mappings
-- map to function that executes commands


--------------- markdown preview and latex compile

map("n", "<leader>v", function()
    if vim.bo.filetype == "markdown" then
        vim.cmd("MarkdownPreview")
    elseif vim.bo.filetype == "tex" then
        vim.cmd("write")
        vim.cmd("VimtexCompile")
    end
end, {desc = "run view commands: e.g.,  markdown preview, or latex compile, ..."})

--------------- text file: navigate up or down within a wrapped line

map("n", "j", function()
    if vim.bo.filetype == "markdown" or "text" or "tex" then
        vim.api.nvim_feedkeys('gj', 'n', false)
    end
end, {desc = "motion in markdown, text, latex"})

map("n", "k", function()
    if vim.bo.filetype == "markdown" or "text" or "tex" then
        vim.api.nvim_feedkeys('gk', 'n', false)
    end
end, {desc = "motion in markdown, text, latex"})

--============= maximizer plugin

map("n", "<leader>m", "<cmd> MaximizerToggle!<CR>", {desc = "toggle maximize window"})

--============= telescope plugin

map("n", "<leader>f", "<cmd> Telescope git_files <CR>", {desc = "Find git project files"})

--============= neoterm plugin

map({"i", "n", "t"}, "<leader>r", "<cmd> Ttoggle<CR>", {desc = "toggle terminal"})

--============= nvim_tmux_navigation plugin

map("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>",  {desc = "go left"})
map("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>",  {desc = "go down"})
map("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>",    {desc = "go up"})
map("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>", {desc = "go right"})

--============= map_buffers plugin

map("n", "<leader>1","<cmd>b1<CR>", {desc = "switch to buffer 1"})
map("n", "<leader>2","<cmd>b2<CR>", {desc = "switch to buffer 2"})
map("n", "<leader>3","<cmd>b3<CR>", {desc = "switch to buffer 3"})
map("n", "<leader>4","<cmd>b4<CR>", {desc = "switch to buffer 4"})
map("n", "<leader>5","<cmd>b5<CR>", {desc = "switch to buffer 5"})
map("n", "<leader>6","<cmd>b6<CR>", {desc = "switch to buffer 6"})
map("n", "<leader>7","<cmd>b7<CR>", {desc = "switch to buffer 7"})
map("n", "<leader>8","<cmd>b8<CR>", {desc = "switch to buffer 8"})
map("n", "<leader>9","<cmd>b9<CR>", {desc = "switch to buffer 9"})

--============= neoscroll plugin mappings are in the plugins/init.lua file
