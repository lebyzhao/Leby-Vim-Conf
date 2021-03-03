"Default vim plugin map
"          Current Split VSplit
"NERDTree  o       i      s->v  ;support g
"Coc.nvim  o       -      v     ;support g
"fzf       o       C-x    C-V
"
"
"Use a command like :verbose imap <tab> to make sure that your keymap has taken effect.
"
"to set caplock to esc
"https://vim.fandom.com/wiki/Map_caps_lock_to_escape_in_Windows
"
"删除多余空行
":g/^$/d
":g/^\s*$/d
"
"可以删除行尾多余的空格和tab符号。
"%s/\s\+$//g
"/和*中间有空格，只能删除行尾空格，对于tab不能删除
"%s/ *$//g
"
"scriptencoding utf-8
"
" change Leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\\"
"nmap <F1> strftime("%Y-%m-%d %H:%M:%S")<cr>
nnoremap <Leader>d "=strftime("[%Y-%m-%d %H:%M:%S]")<CR>P
inoremap <Leader>d <C-R>=strftime("[%Y-%m-%d %H:%M:%S]")<CR>

"使用空格会在正常输入时, 会增加延迟
"let mapleader = "\<Space>"
"nnoremap <SPACE> <Nop>

"delete without copy
"v/V with x is for cut
"nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

"not support mouse
set mouse-=a

" die F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"EasyAlign
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
xmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap f <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)

" JK motions: Line motions
map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)
"s is bidirectional find motion, you can move to anywhere with it.
"<Leader>j & <Leader>k make it easy to move to the lines.
"

"for easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1


"for nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" add g cursor don't leave for read
" i/s o t
" if no file input,then open tree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeWinSize=25
let NERDTreeMapOpenVSplit='v'

" for vim-fswitch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au! BufEnter *.cpp,*.cc let b:fswitchdst = 'h' | let b:fswitchlocs = './,reg:/src/include/,../include'
au! BufEnter *.h let b:fswitchdst = 'cc,cpp' | let b:fswitchlocs = './,reg:/include/src/,../src'
nmap <silent> <Leader>g :FSHere<cr>
nmap <silent> <Leader>s :FSSplitRight<cr>

"for fzf and ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
"
function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

" using ctrl-a ctrl-d to keep the ag results
command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '30%'
\ })

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/data/fzf_history/'


nnoremap <silent> <Leader>f :Files<CR>

let g:ag_prg="ag --vimgrep --ignore=tags --ignore=compile_commands.json"

"directly search the word under cursor
nmap <Leader>ag <Plug>AgActionWord
vmap <Leader>ag <Plug>AgActionVisual
"search the word manual
nnoremap <Leader>mag :Ag<Space>


":tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" display current members on the right windows
let g:tagbar_sort = 0
nmap <Leader>t :TagbarToggle<CR>


" personal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change win size
nmap w=  :resize +10<CR>
nmap w-  :resize -10<CR>
nmap w,  :vertical resize -3<CR>
nmap w.  :vertical resize +3<CR>

" ^M change \r\n
nmap <Leader>clr :%s/\r\n/\r/gi<CR>
" del line backend line
nmap <Leader>clb :%s/\s\+$//cg<CR>

nmap <Leader>q :q!<CR>
nmap <Leader>w :w!<CR>
nmap <Leader>qq :confirm qall<CR>
nmap <Leader>ww :wq<CR>

nmap <Leader>oq :only<CR>


" 参数按照空格排列
nmap <Leader>pb :s/ /\r/gc<CR>
" 参数按照,号列表
nmap <Leader>pd :s/,/,\r/gc<CR>

" http://vim.wikia.com/wiki/Avoid_the_escape_key
" Can be typed even faster than jj, and if you are already in
"    normal mode, you (usually) don't accidentally move:
":imap jk <Esc>
":imap kj <Esc>
"
"窗口跳转
"Ctrl+W l h L H


"terryma/vim-expand-region
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" press v will expand the region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


"查找替换
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"对于关键字，可视化替换, 比替换命令方便些
"!!! pressing n. to repeat the change for each subsequent match
"using cgn,
"http://vimcasts.org/episodes/operating-on-search-matches-using-gn/
"
"cgn will do the same then switch to Insert mode,
"gn command especially useful in Operator-pending mode. 也就是本身没多少用
"dgn will delete the next match,
"gUgn will convert the next match to uppercase characters.
"
"
"preview, 这个已经不使用了
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 不能跳转到预览窗口, 用这个在当前窗口编辑
":PreviewGoto edit
"
" PreviewGoto action
" The action can be either edit, split, vsplit or tabe.
"autocmd FileType c,cc,cpp,cxx,h,hpp nnoremap gl :PreviewTag <CR>
"autocmd FileType c,cc,cpp,cxx,h,hpp nnoremap gw :PreviewClose<CR>
"
""defautl will open the win above
""autocmd FileType c,cc,cpp,cxx,h,hpp nnoremap gl :ptag <CR>
"
""print the function declare at the status line, the same as gh, but simple
"autocmd FileType c,cc,cpp,cxx,h,hpp nnoremap gn :PreviewSignature<CR>


" my functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"disable show extra for mouse config
let g:leby_no_show = 0
func LebyNoShowExtra()

  IndentLinesToggle

if g:leby_no_show == 0
  let g:leby_no_show = 1

  set nonu
  set signcolumn=no

else
  let g:leby_no_show = 0
  set nu

endif
endfunc

nmap <Leader>ns :call LebyNoShowExtra()<CR>


"for ccls
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_node_path = "/usr/local/bin/node"

" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c

"" always show signcolumns
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
"To make <CR> auto-select the first completion item and notify coc.nvim to
"  format on enter, use:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"let g:coc_snippet_next = '<tab>'
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" will open sub window
nnoremap <silent><nowait> <space>d :call CocAction('jumpDefinition', v:false)<CR>
nmap <silent> gd <Plug>(coc-definition)


let g:coc_enable_locationlist = 0
autocmd User CocLocationsChange CocList --normal location

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


"nmap <leader>rn <Plug>(coc-rename)

"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"au CursorHold * sil call CocActionAsync('highlight')
"au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

 "Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let i = 1
while i <= 9
   execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
   let i = i + 1
endwhile

"range
vmap <Leader>b <Plug>SortFolds

"set mouse+=a
"set ttymouse=xterm2

"Ctrl + w + h：向左移动窗口
"Ctrl + w + j：向下移动窗口
"Ctrl + w + k：向上移动窗口                                                                                                          Ctrl + w + l： 向右移动窗口
"
"Ctrl + w + t：移动到最左上角的窗口
"Ctrl + w + b：移动到最右下角的窗口
"Ctrl + w + p：移动到前一个访问的窗口

"nnoremap <C-J> <C-W>j
"nnoremap <C-K> <C-W>k
"nnoremap <C-L> <C-W>l
"nnoremap <C-H> <C-W>h
"nnoremap <C-T> <C-W>h
"nnoremap <C-B> <C-W>h

