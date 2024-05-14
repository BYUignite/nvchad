-- David Lignell, November 12, 2023

-- Started with one_light, changed every color

-- Colors from the "flat design" chart at https://htmlcolorcodes.com/color-chart/
-- Many colors are "variations" of #154360, (which is one of the "flat design" colors)
-- Variations are "shades" and "tints" https://imagecolorpicker.com/color-code/154360

-- Note, the search bg wants base0A, which "conflicts" with code types
-- Override in highlights.lua: IncSearch = {bg="grey_fg",  fg="folder_bg", bold=true}
-- Override in highlights.lua: Search    = {bg="grey_fg2", fg="folder_bg", bold=true}

local M = {}

M.base_30 = {
  white         = "#a1b4bf",  -- fg colors: active tabline buffer; statusline file info
  darker_black  = "#0b2230",  -- nvim tree background
  black         = "#154360", --#2c5670",  -- active tabline buffer; statusline mode fg
  black2        = "#0d283a",  -- inactive tabline buffers; folded bg; nvim tree selection
  one_bg        = "#133c56",  -- statusline cwd; telescope selection   ",
  one_bg2       = "#e8ecef",  -- highlight function
  one_bg3       = "#5b7b90",  -- toggle button (theme)
  grey          = "#2c5670",  -- line numbers; St_EmptySpace (tabline); match (); search fg
  grey_fg       = "#2c5670",  -- code comments
  grey_fg2      = "#446980",  -- unused
  light_grey    = "#a1b4bf",  -- fg color: inactive tabline buffer; folded fg
  red           = "#5b7b90",  -- errors, close icons
  baby_pink     = "#F5B7B1",
  pink          = "#F1948A",
  line          = "#2c5670",  -- window split lines
  green         = "#229954",
  vibrant_green = "#58D68D",
  nord_blue     = "#a1b4bf",  -- statusline mode; statusline cursor loc
  blue          = "#a1b4bf",  -- icons
  yellow        = "#B9770E",  -- warnings
  sun           = "#f4d03f",
  purple        = "#8E44AD",
  dark_purple   = "#5B2C6F",
  teal          = "#AED6F1",
  orange        = "#D68910",
  cyan          = "#2E86C1",
  statusline_bg = "#0b2230",  -- statusline bg
  lightbg       = "#2c5670",  -- statusline file info
  pmenu_bg      = "#5b7b90",  -- popup menu selected item
  folder_bg     = "#e8ecef",  -- arrows on open files in nvim tree
}

M.base_16 = {
  --base00 = "#081b26",  -- BACKGROUND
  base00 = "#06141b",  -- BACKGROUND
  --base00 = "#040d13",  -- BACKGROUND
  base01 = "#f4f4f4",
  base02 = "#5b7b90",  -- visual mode selection
  base03 = "#446980",  -- sign column fg
  base04 = "#8aa1b0",
  base05 = "#a1b4bf",  -- FOREGOUND
  base06 = "#081b26",  -- unused
  base07 = "#02070a",
  base08 = "#EC7063",  -- code: character; statement (return)
  base09 = "#85C1E9",  -- code: numbers, boolean
  base0A = "#7DCEA0",  -- code: types, #ifdef
  base0B = "#EC7063",  -- code: string
  base0C = "#85C1E9",  -- (code: special (?))
  base0D = "#D2B4DE",  -- code: #include
  base0E = "#D2B4DE",  -- code: conditional; class; 
  base0F = "#D68910",  -- code: delimiter
}

M.type = "light"

M.polish_hl = {
  TelescopePromptPrefix = { fg = M.base_30.white },
  TelescopeSelection = { bg = M.base_30.one_bg, fg = M.base_30.white },
  ["@punctuation.bracket"] = { fg = M.base_30.nord_blue },
  FloatBorder = { fg = M.base_16.base05 },
  DiffAdd = { fg = M.base_16.base05 },
  TbLineThemeToggleBtn = { bg = M.base_30.one_bg3 },
  WhichKeyDesc = { fg = M.base_30.white },
  Pmenu = { bg = M.base_30.black2 },
  St_pos_text = { fg = M.base_30.white },
}

M = require("base46").override_theme(M, "repent")

return M
