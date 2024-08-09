-- gruber.lua
-- Neovim color scheme based on the Gruber Dark theme

vim.cmd('highlight clear')
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd('syntax reset')
end

vim.o.background = "dark"
vim.g.colors_name = "gruber"

local colors = {
    black =     {"#161616", 234},
    offwhite =  {"#e4e4e4", 110},
    brown =     {"#af875f", 137},
    cyan =      {"#afd7af", 151},
    gray =      {"#94a5c7", 235},
    kamoni =    {"#87d75f", 113},
    red =       {"#ff5f5f", 203},
    white =     {"#FFFFFF", 254},
    green =     {"#0adb61", 220},
}

local function hl(group, attrs)
    local command = {"highlight", group}
    if attrs.fg then
        table.insert(command, "guifg=" .. attrs.fg[1])
        table.insert(command, "ctermfg=" .. attrs.fg[2])
    end
    if attrs.bg then
        table.insert(command, "guibg=" .. attrs.bg[1])
        table.insert(command, "ctermbg=" .. attrs.bg[2])
    end
    if attrs.style then
        table.insert(command, "gui=" .. attrs.style)
        table.insert(command, "cterm=" .. attrs.style)
    end
    vim.cmd(table.concat(command, " "))
end

hl("ColorColumn",   {bg = colors.gray})
hl("Comment",       {fg = colors.brown})
hl("Constant",      {fg = colors.white})
-- hl("CursorLine",     {bg = colors.gray})
hl("DiffAdd",       {fg = colors.kamoni})
hl("DiffChange",    {fg = colors.offwhite})
hl("DiffDelete",    {fg = colors.red})
hl("DiffText",      {fg = colors.offwhite, style = "underline"})
hl("Directory",     {fg = colors.offwhite})
hl("EndOfBuffer",   {fg = colors.black})
hl("Error",         {fg = colors.red})
hl("ErrorMsg",      {fg = colors.red})
hl("FoldColumn",    {fg = colors.brown, bg = colors.gray})
hl("Folded",        {fg = colors.brown, bg = colors.gray, style = "italic"})
hl("Function",      {fg = colors.offwhite})
hl("Identifier",    {fg = colors.white})
hl("Ignore",        {fg = colors.black})
hl("MatchParen",    {fg = colors.green, style = "bold"})
hl("MoreMsg",       {fg = colors.kamoni})
hl("NonText",       {fg = colors.offwhite})
hl("Normal",        {fg = colors.white, bg = colors.black})
hl("Pmenu",         {fg = colors.white, bg = colors.black})
hl("PmenuSbar",     {bg = colors.gray})
hl("PmenuSel",      {fg = colors.black, bg = colors.green, style = "bold"})
hl("PmenuThumb",    {bg = colors.black})
hl("PreProc",       {fg = colors.gray})
hl("Question",      {fg = colors.offwhite})
hl("Special",       {fg = colors.white})
hl("SpecialChar",   {fg = colors.gray})
hl("SpecialComment",{fg = colors.brown})
hl("SpecialKey",    {fg = colors.offwhite})
hl("SpellBad",      {fg = colors.red, style = "underline"})
hl("SpellCap",      {fg = colors.offwhite, style = "underline"})
hl("SpellLocal",    {fg = colors.green, style = "underline"})
hl("SpellRare",     {style = "underline"})
hl("Statement",     {fg = colors.green, style = "bold"})
hl("StatusLine",    {fg = colors.white, bg = colors.black, style = "bold"})
hl("StatusLineNC",  {fg = colors.white, bg = colors.black})
hl("String",        {fg = colors.kamoni})
hl("Title",         {fg = colors.white})
hl("Todo",          {fg = colors.brown, style = "italic"})
hl("Type",          {fg = colors.gray, style = "bold"})
hl("Typedef",       {fg = colors.green, style = "bold"})
hl("StorageClass",  {fg = colors.green, style = "bold"})
hl("Structure",     {fg = colors.green, style = "bold"})
hl("CursorLineNr",  {fg = colors.green})
hl("Underlined",    {style = "underline"})
hl("VertSplit",     {fg = colors.gray})
hl("WarningMsg",    {fg = colors.green})
hl("WildMenu",      {fg = colors.black, bg = colors.green, style = "bold"})
hl("diffAdded",     {fg = colors.kamoni})
hl("diffRemoved",   {fg = colors.red})
hl("diffSubname",   {fg = colors.offwhite})

