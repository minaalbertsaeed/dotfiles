highlight clear

if exists("syntax_on")
    syntax reset
endif

set background="#1c1c1c"
let g:colors_name = "gruber"

let s:black  = ["#1c1c1c", "234"]
let s:offwhite   = ["#e4e4e4", "110"]
let s:brown  = ["#af875f", "137"]
let s:cyan   = ["#afd7af", "151"]
let s:gray   = ["#9ba29f", "235"]
let s:kamoni  = ["#87d75f", "113"]
let s:red    = ["#ff5f5f", "203"]
let s:white  = ["#FFFFFF", "254"]
let s:green = ["#0adb61" , "220"]

let s:bold      = "bold"
let s:italic    = "italic"
let s:underline = "underline"

function! s:hl(group, attrs) abort
    if has_key(a:attrs, "fg")
        let a:attrs["guifg"] = a:attrs["fg"][0]
        let a:attrs["ctermfg"] = a:attrs["fg"][1]
        unlet a:attrs["fg"]
    endif

    if has_key(a:attrs, "bg")
        let a:attrs["guibg"] = a:attrs["bg"][0]
        let a:attrs["ctermbg"] = a:attrs["bg"][1]
        unlet a:attrs["bg"]
    endif

    if has_key(a:attrs, "style")
        let a:attrs["gui"] = a:attrs["style"]
        let a:attrs["cterm"] = a:attrs["style"]
        unlet a:attrs["style"]
    endif

    let l:defaults = { "guifg": "NONE", "guibg": "NONE", "gui": "NONE", "guisp": "NONE",
                     \ "ctermfg": "NONE", "ctermbg": "NONE", "cterm": "NONE" }
    call extend(l:defaults, a:attrs)

    let l:command = "highlight" . " " . a:group
    for name in keys(l:defaults)
        let l:command .= " " . name . "=" . l:defaults[name]
    endfor

    execute l:command
endfunction

" :source $VIMRUNTIME/syntax/hitest.vim
" :help group-name
" :help highlight-default

call s:hl("ColorColumn",    { "bg": s:gray })
call s:hl("Comment",        { "fg": s:brown })
call s:hl("Constant",       { "fg": s:gray })
" call s:hl("CursorLine",     { "bg": s:gray })
call s:hl("DiffAdd",        { "fg": s:kamoni })
call s:hl("DiffChange",     { "fg": s:offwhite })
call s:hl("DiffDelete",     { "fg": s:red })
call s:hl("DiffText",       { "fg": s:offwhite, "style": s:underline })
call s:hl("Directory",      { "fg": s:offwhite })
call s:hl("EndOfBuffer",    { "fg": s:black })
call s:hl("Error",          { "fg": s:red })
call s:hl("ErrorMsg",       { "fg": s:red })
call s:hl("FoldColumn",     { "fg": s:brown, "bg": s:gray })
call s:hl("Folded",         { "fg": s:brown, "bg": s:gray, "style": s:italic })
call s:hl("Function",       { "fg": s:offwhite })
call s:hl("Identifier",     { "fg": s:white })
call s:hl("Ignore",         { "fg": s:black })
call s:hl("MatchParen",     { "fg": s:green, "style": s:bold })
call s:hl("MoreMsg",        { "fg": s:kamoni })
call s:hl("NonText",        { "fg": s:offwhite })
call s:hl("Normal",         { "fg": s:white, "bg": s:black })
call s:hl("Pmenu",          { "fg": s:white, "bg": s:black })
call s:hl("PmenuSbar",      { "bg": s:gray })
call s:hl("PmenuSel",       { "fg": s:black, "bg": s:green, "style": s:bold })
call s:hl("PmenuThumb",     { "bg": s:black })
call s:hl("PreProc",        { "fg": s:cyan })
call s:hl("Question",       { "fg": s:offwhite })
call s:hl("Special",        { "fg": s:white })
call s:hl("SpecialChar",    { "fg": s:cyan })
call s:hl("SpecialComment", { "fg": s:brown })
call s:hl("SpecialKey",     { "fg": s:offwhite })
call s:hl("SpellBad",       { "fg": s:red, "style": s:underline })
call s:hl("SpellCap",       { "fg": s:offwhite, "style": s:underline })
call s:hl("SpellLocal",     { "fg": s:green, "style": s:underline })
call s:hl("SpellRare",      { "style": s:underline })
call s:hl("Statement",      { "fg": s:green, "style": s:bold })
call s:hl("StatusLine",     { "fg": s:white, "bg": s:black, "style": s:bold })
call s:hl("StatusLineNC",   { "fg": s:white, "bg": s:black })
call s:hl("String",         { "fg": s:kamoni })
call s:hl("Title",          { "fg": s:white })
call s:hl("Todo",           { "fg": s:brown, "style": s:italic })
call s:hl("Type",           { "fg": s:gray, "style": s:bold })
call s:hl("Underlined",     { "style": s:underline })
call s:hl("VertSplit",      { "fg": s:gray })
call s:hl("WarningMsg",     { "fg": s:green })
call s:hl("WildMenu",       { "fg": s:black, "bg": s:green, "style": s:bold })
call s:hl("diffAdded",      { "fg": s:kamoni })
call s:hl("diffRemoved",    { "fg": s:red })
call s:hl("diffSubname",    { "fg": s:offwhite })
