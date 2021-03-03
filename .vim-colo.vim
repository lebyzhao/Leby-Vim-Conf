set t_Co=256
set background=dark

if (has("termguicolors") && !&diff)
"  set termguicolors
endif
 
"let g:airline_theme='onedark'
"
let g:onedark_termcolors=256
let g:onedark_terminal_italic = 1
let g:onedark_terminal_bold = 1
let g:onedark_italic = 1
let g:onedark_bold = 1

let g:neosolarized_vertSplitBgTrans = 0
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
 
let g:molokai_original=1
 
"soft, medium and hard
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_bold=1
let g:gruvbox_italic=1
 
"for colo
"colo onedark
"colo zenburn
"colo gruvbox
"colo hybrid
"colo dracula
colo molokai
"
 
" for personal  
"hi link StructDecl Type
"hi link UnionDecl Type
"hi link ClassDecl Type
"hi link EnumDecl Type
" 
hi Comment guifg=#767676 ctermfg=242

"hi Comment guifg=#767676 ctermfg=105 cterm=italic
"hi Comment cterm=italic guifg=#767676 ctermfg=243 
"hi Comment guifg=#767676 ctermfg=243 
"hi Comment guifg=#767676 ctermfg=243 cterm=bold
 
" for some colo to redefine
"hi Member ctermfg=109 guifg=#83a598 cterm=italic
"hi Member ctermfg=109 guifg=#83a598

hi Member cterm=italic
hi Include cterm=italic 
hi Type cterm=italic 
hi Keyword cterm=italic 
hi Typedef cterm=italic 
hi Structure cterm=italic 
hi Typedef cterm=italic 
hi Function cterm=italic
hi Conditional cterm=italic 
":hi Macro cterm=italic 
":hi Label cterm=italic 
": 
hi Variable ctermfg=109 cterm=bold
"hi SpecialKey guifg=#5b605e ctermfg=235
"for list char
"hi SpecialKey guifg=#5b605e guibg=NONE ctermfg=244 ctermbg=NONE cterm=italic
 
" change the color for select
hi Visual cterm=NONE ctermbg=27 ctermfg=NONE guibg=#005fff
 
" for markdown colo
au BufRead,BufNewFile *.{md,txt} colo PaperColor
set conceallevel=0
let g:vim_markdown_math = 1
" for markdown colo, MUST put these after colo settings
let g:vim_markdown_auto_extension_ext='txt'
au BufNewFile,BufFilePre,BufRead *.{md,txt} set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.{md,txt} set syntax=markdown
 
"for syntax check sign
au BufRead,BufNewFile *.{cpp,c,h,cc} set signcolumn=yes
"au BufRead,BufNewFile *.{cpp,c,h} set list
 
" 优化窗口边框展示
hi VertSplit guibg=#31312D guifg=#526A83 ctermfg=White ctermbg=Black term=none cterm=none gui=none
hi FoldColumn guibg=#31312D guifg=#526A83 ctermfg=White ctermbg=Black term=none cterm=none gui=none
hi StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none
"hi Pmenu ctermbg=93 guibg=gray
hi Pmenu ctermbg=18 guibg=gray

"hi Normal ctermbg=233

" Dim inactive windows using 'colorcolumn' setting
" This tends to slow down redrawing, but is very useful.
" Based on https://groups.google.com/d/msg/vim_use/IJU-Vk-QLJE/xz4hjPjCRBUJ
" XXX: this will only work with lines containing text (i.e. not '~')
" from 
"if exists('+colorcolumn')
"  function! s:DimInactiveWindows()
"    for i in range(1, tabpagewinnr(tabpagenr(), '$'))
"      let l:range = ""
"      if i != winnr()
"        if &wrap
"         " HACK: when wrapping lines is enabled, we use the maximum number
"         " of columns getting highlighted. This might get calculated by
"         " looking for the longest visible line and using a multiple of
"         " winwidth().
"         let l:width=80 " max
"        else
"         let l:width=winwidth(i)
"        endif
"        let l:range = join(range(1, l:width), ',')
"      endif
"      call setwinvar(i, '&colorcolumn', l:range)
"    endfor
"  endfunction
"  augroup DimInactiveWindows
"    au!
"    au WinEnter * call s:DimInactiveWindows()
"    au WinEnter * set cursorline
"    au WinLeave * set nocursorline
"  augroup END
"endif
"
""""""""""""""""""""Its slow for enable cursorline
hi CursorLine   cterm=NONE ctermbg=53 guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=53 guibg=darkred guifg=white
"nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
"augroup CursorLine
"	au!
"	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
"	au WinLeave * setlocal cursorline! cursorcolumn!
"augroup END
"set cursorline! cursorcolumn!

"function s:SetCursorLine()                                       
"        set cursorline                                           
"        "hi cursorline cterm=none ctermbg=darkblue ctermfg=white 
"        "hi CursorLine ctermbg=20                                 
"endfunction                                                      
"autocmd VimEnter * call s:SetCursorLine()                        
