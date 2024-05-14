-----------------------------------------------------------------------------------------
-- DOL: Settings for UI: tabufline, statusline, highlights, themes
-----------------------------------------------------------------------------------------

-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig

local M = {}

local utils = require "nvchad.stl.utils"
local sep_r = ""
local sep_l = ""

M.ui = {

    -----------------------------------------------------------------------------------------

	theme = "repent",
    theme_toggle = { "repent", "forsake" },

    hl_override = {
        Comment    = {italic=true},
        CursorLine = {bg="none",                     bold=true},
        Search     = {bg="grey_fg2", fg="folder_bg", bold=true},
        IncSearch  = {bg="grey_fg2", fg="folder_bg", bold=true},
        NvimTreeOpenedFolderName = {bold=true},
    },

    -----------------------------------------------------------------------------------------
    -- the "order" refers to the sections of the status line; add or remove items;
    -- can override existing items in the modules definition below, and add new ones.
    -- see files: ~/.local/share/nvim/lazy/ui/lua/nvchad/stl/default.lua and utils.lua
    -- color code options: see file: St_*: ~/.local/share/nvim/lazy/base46/lua/base46/integrations/statusline/default.lua

    statusline = {

        order = { "mode", "file", "git", "%=", "%=", "cursor" },

        modules = {

            mode = function()
                if not utils.is_activewin() then
                  return ""
                end
                local modes = utils.modes
                local m = vim.api.nvim_get_mode().mode       -- replace modes["n"] with modes[m] below
                local current_mode = "%#St_" .. modes["n"][2] .. "Mode# " .. modes[m][1] .. " "
                local mode_sep1 = "%#St_" .. modes["n"][2] .. "ModeSep#" .. sep_r
                return current_mode .. mode_sep1 .. "%#ST_EmptySpace#" .. sep_r
            end,

            file = function()
                local x = utils.file()
                local name = " " .. x[2] .. " "
                --return "%#St_file# " .. x[1] .. name .. "%#St_file_sep#" .. sep_r   -- with file icon
                return "%#St_file# " .. name .. "%#St_file_sep#" .. sep_r           -- without file icon
            end,

            cursor = function()
                local fn = vim.fn
                local left_sep1 = "%#St_Lsp#" .. sep_l
                local left_sep2 = "%#St_NormalMode#  "
                local current_line = fn.line(".", vim.g.statusline_winid)
                local total_line = fn.line("$", vim.g.statusline_winid)
                local column = vim.api.nvim_win_get_cursor(0)[2]
                local text = current_line .. "/" .. total_line .. " 〣 " .. column
                return left_sep1 .. left_sep2 .. " " .. text .. " "

            end,
        }
    },

    -----------------------------------------------------------------------------------------
    -- see file ~/.local/share/nvim/lazy/NvChad/lua/nvconfig.lua for order variable
    -- see files: ~/.local/share/nvim/lazy/ui/lua/nvchad/tabufline/modules.lua
    -- colors for buttons: see file: ~/.local/share/nvim/lazy/base46/lua/base46/integrations/tbline.lua
    --     that is, TabCloseBtn is a color code for the fg and bg...

    tabufline = {

        order = { "treeOffset", "buffers", "tabs", "btns" },

        modules = {

            btns = function()
                local toggle_theme = "%@Tb" .. "Toggle_theme" .. "@%#Tb" .. "TabCloseBtn" .. "#" .. vim.g.toggle_theme_icon .. "%X"
                local closeAllBufs = "%@Tb" .. "CloseAllBufs" .. "@%#Tb" .. "TabCloseBtn" .. "#" .. " 󰅖 %X"
                return toggle_theme .. closeAllBufs
            end,
        }
    },

    -----------------------------------------------------------------------------------------

}

return M
