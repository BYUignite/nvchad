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
  white         = "#11364d",  -- fg colors: active tabline buffer; statusline file info
  darker_black  = "#ecf0f2",  -- nvim tree background
  black         = "#b9c7cf",  -- active tabline buffer; statusline mode fg, popup bg
  black2        = "#eff2f4",  -- inactive tabline buffers; folded bg; nvim tree selection
  one_bg        = "#b9c7cf",  -- statusline cwd; telescope selection   ",
  one_bg2       = "#e8ecef",  -- highlight function
  one_bg3       = "#5b7b90",  -- toggle button (theme)
  grey          = "#b9c7cf",  -- line numbers; St_EmptySpace (tabline); match (); search fg
  grey_fg       = "#738ea0",   -- code comments
  grey_fg2      = "#d0d9df",  -- unused
  light_grey    = "#11364d",  -- fg color: inactive tabline buffer; folded fg
  red           = "#5b7b90",  -- errors, close icons
  baby_pink     = "#F5B7B1",
  pink          = "#F1948A",
  line          = "#11364d",  -- #a1b4bf",  -- window split lines
  green         = "#229954",
  vibrant_green = "#58D68D",
  nord_blue     = "#154360",  -- statusline mode; statusline cursor loc
  blue          = "#11364d",  -- icons
  yellow        = "#F39C12",  -- warnings
  sun           = "#f4d03f",
  purple        = "#8E44AD",
  dark_purple   = "#5B2C6F",
  teal          = "#AED6F1",
  orange        = "#D68910",
  cyan          = "#2E86C1",
  statusline_bg = "#eff2f4",  -- statusline bg
  lightbg       = "#b9c7cf",  -- statusline file info
  pmenu_bg      = "#154360",  -- popup menu selected item
  folder_bg     = "#0b2230",  -- arrows on open files in nvim tree
}

M.base_16 = {
  base00 = "#ffffff",  -- BACKGROUND
  base01 = "#f4f4f4",
  base02 = "#d0d9df",  -- visual mode selection
  base03 = "#446980",  -- sign column fg
  base04 = "#8aa1b0",
  base05 = "#081b26",  -- FOREGOUND #0b2230
  base06 = "#081b26",  -- unused
  base07 = "#02070a",
  base08 = "#C0392B",  -- code: character; statement (return)
  base09 = "#2E86C1",  -- code: numbers, boolean
  base0A = "#229954",  -- code: types, #ifdef
  base0B = "#C0392B",  -- code: string
  base0C = "#2E86C1",  -- (code: special (?))
  base0D = "#5B2C6F",  -- code: #include
  base0E = "#5B2C6F",  -- code: conditional; class; 
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

M = require("base46").override_theme(M, "forsake")

return M
