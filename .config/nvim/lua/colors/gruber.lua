-- gruber.lua
-- Neovim color scheme based on the Gruber Dark theme

vim.cmd('highlight clear')
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd('syntax reset')
end

vim.o.background = "dark"
vim.g.colors_name = "gruber"

local colors = {
    black =     {"#16181d", 234},
    brown =     {"#af875f", 137},
    cyan =      {"#afd7af", 151},
    blue =      {"#89B4FA", 235},
    yellow =    {"#afd7af", 113},
    red =       {"#F38BA8", 203},
    white =     {"#ffffff", 254},
    non =       {"#2E2E2E" , 100},
    comment =   {"#5e5f70", 201 },
    gray =      {"#8997b5", 241 }



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

hl("ColorColumn",   {bg = colors.blue})
hl("Comment",       {fg = colors.comment})
hl("Constant",      {fg = colors.white})
-- hl("CursorLine",     {bg = colors.blue})
hl("DiffAdd",       {fg = colors.yellow})
hl("DiffChange",    {fg = colors.white})
hl("DiffDelete",    {fg = colors.red})
hl("DiffText",      {fg = colors.white, style = "underline"})
hl("Directory",     {fg = colors.white})
hl("EndOfBuffer",   {fg = colors.black})
hl("Error",         {fg = colors.red})
hl("ErrorMsg",      {fg = colors.red})
hl("FoldColumn",    {fg = colors.brown, bg = colors.blue})
hl("Folded",        {fg = colors.brown, bg = colors.blue, style = "italic"})
hl("Function",      {fg = colors.gray })
hl("identifier",    {fg = colors.white})
hl("Ignore",        {fg = colors.black})
hl("MatchParen",    {fg = colors.blue, style = "bold"})
hl("MoreMsg",       {fg = colors.yellow})
hl("NonText",       {fg = colors.white})
hl("Normal",        {fg = colors.white, bg = colors.black})
hl("Pmenu",         {fg = colors.white, bg = colors.black})
hl("PmenuSbar",     {bg = colors.blue})
hl("PmenuSel",      {fg = colors.black, bg = colors.blue, style = "bold"})
hl("PmenuThumb",    {bg = colors.black})
hl("PreProc",       {fg = colors.blue})
hl("Question",      {fg = colors.white})
hl("Special",       {fg = colors.white})
hl("SpecialChar",   {fg = colors.blue})
hl("SpecialComment",{fg = colors.brown})
hl("SpecialKey",    {fg = colors.white})
hl("SpellBad",      {fg = colors.red, style = "underline"})
hl("SpellCap",      {fg = colors.white, style = "underline"})
hl("SpellLocal",    {fg = colors.blue, style = "underline"})
hl("SpellRare",     {style = "underline"})
hl("Statement",     {fg = colors.blue, style = "bold"})
hl("StatusLine",    {fg = colors.white, bg = colors.black, style = "bold"})
hl("StatusLineNC",  {fg = colors.white, bg = colors.black})
hl("String",        {fg = colors.yellow})
hl("Title",         {fg = colors.white})
hl("IncSearch",     {fg = colors.black , bg = colors.blue})
hl("Todo",          {fg = colors.brown, style = "italic"})
hl("Type",          {fg = colors.blue, style = "bold"})
hl("Typedef",       {fg = colors.blue, style = "bold"})
-- hl("Function",       {fg = colors.blue, style = "bold"})
hl("StorageClass",  {fg = colors.blue, style = "bold"})
hl("Structure",     {fg = colors.blue, style = "bold"})
hl("CursorLineNr",  {fg = colors.blue})
hl("Underlined",    {style = "underline"})
hl("VertSplit",     {fg = colors.blue})
hl("WarningMsg",    {fg = colors.red})
hl("WildMenu",      {fg = colors.black, bg = colors.blue, style = "bold"})
hl("diffAdded",     {fg = colors.yellow})
hl("diffRemoved",   {fg = colors.red})
hl("diffSubname",   {fg = colors.white})
hl("NonText",       { fg = colors.non})
