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

map("n",             "<leader><space>", ":noh<CR>",                   {desc = "Custom cancel the search highlight"})
map("n",             "<leader>w",       ":w<CR>",                     {desc = "Custom save buffer"})
map("n",             "<leader>rtw",     ":%s/\\s\\+$//e<CR>",         {desc = "Custom remove trailing whitespace"})
map("n",             "<leader>s",       "<cmd> Ouroboros<CR>",        {desc = "Custom switch between header and source file"})
map("n",             "<leader>e",       "<cmd> NvimTreeToggle <CR>",  {desc = "Custom toggle nvimtree file explorer"})
map("v",             ">",               ">gv",                        {desc = "Custom indent"})
map("t",             "<Esc>",           "<C-\\><C-n>",                {desc = "Custom terminal escape to normal mode"})
map("i",             "jj",              "<ESC>",                      {desc = "Custom another way to escape"})
map({"i", "n", "v"}, "<leader>wc",      "g<C-g>",                     {desc = "Custom word count"})
map({"i", "n"},      "<leader>w",       ":w<CR>",                     {desc = "Custom save buffer"})
map("n",             "<leader>zt",      ":<C-u>exec 'normal! ' . 15 . 'kzt' . 15 . 'j' <CR>", {desc = "Custom scroll so cursor is 15 lines from the top"})

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
end, {desc = "Custom run view commands: markdown, latex"})

--------------- text file: navigate up or down within a wrapped line

map("n", "j", function()
    if vim.bo.filetype == "markdown" or "text" or "tex" then
        vim.api.nvim_feedkeys('gj', 'n', false)
    end
end, {desc = "Specialized motion in markdown, text, latex"})

map("n", "k", function()
    if vim.bo.filetype == "markdown" or "text" or "tex" then
        vim.api.nvim_feedkeys('gk', 'n', false)
    end
end, {desc = "Specialized motion in markdown, text, latex"})

--============= maximizer plugin

map("n", "<leader>m", "<cmd> MaximizerToggle!<CR>", {desc = "Custom maximizer: toggle maximize window"})

--============= telescope plugin

map("n", "<leader>f", "<cmd> Telescope git_files <CR>", {desc = "Telescope find git project files"})
map("n", "<leader>gg", "<cmd>Telescope live_grep<CR>",  {desc = "telescope live grep" })
map("n", "<leader>gw", "<cmd>Telescope grep_string<CR>",{desc = "telescope grep word under cursor" })

--============= neoterm plugin

map({"i", "n", "t"}, "<leader>r", "<cmd> Ttoggle<CR>", {desc = "Custom toggle terminal"})

--============= nvim_tmux_navigation plugin

map("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>",  {desc = "Tmux go left"})
map("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>",  {desc = "Tmux go down"})
map("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>",    {desc = "Tmux go up"})
map("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>", {desc = "Tmux go right"})

--============= map_buffers plugin

map("n", "<leader>9","<cmd>b1<CR>", {desc = "Custom switch to buffer 9"})
map("n", "<leader>8","<cmd>b2<CR>", {desc = "Custom switch to buffer 8"})
map("n", "<leader>7","<cmd>b3<CR>", {desc = "Custom switch to buffer 7"})
map("n", "<leader>6","<cmd>b4<CR>", {desc = "Custom switch to buffer 6"})
map("n", "<leader>5","<cmd>b5<CR>", {desc = "Custom switch to buffer 5"})
map("n", "<leader>4","<cmd>b6<CR>", {desc = "Custom switch to buffer 4"})
map("n", "<leader>3","<cmd>b7<CR>", {desc = "Custom switch to buffer 3"})
map("n", "<leader>2","<cmd>b8<CR>", {desc = "Custom switch to buffer 2"})
map("n", "<leader>1","<cmd>b9<CR>", {desc = "Custom switch to buffer 1"})

--============= neoscroll plugin mappings are in the plugins/init.lua file
