
" change Leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\\"

"使用空格会在正常输入时, 会增加延迟
"let mapleader = "\<Space>"
"nnoremap <SPACE> <Nop>

"delete without copy
"v/V with x is for cut
"nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d


"EasyAlign
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1


"for fzf and ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! s:ag_to_qf(line)
"  let parts = split(a:line, ':')
"  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
"        \ 'text': join(parts[3:], ':')}
"endfunction
"
"function! s:ag_handler(lines)
"  if len(a:lines) < 2 | return | endif
"
"  let cmd = get({'ctrl-x': 'split',
"               \ 'ctrl-v': 'vertical split',
"               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
"  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')
"
"  let first = list[0]
"  execute cmd escape(first.filename, ' %#\')
"  execute first.lnum
"  execute 'normal!' first.col.'|zz'
"
"  if len(list) > 1
"    call setqflist(list)
"    copen
"    wincmd p
"  endif
"endfunction
"
"" using ctrl-a ctrl-d to keep the ag results
"command! -nargs=* Ag call fzf#run({
"\ 'source':  printf('ag --nogroup --column --color "%s"',
"\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
"\ 'sink*':    function('<sid>ag_handler'),
"\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
"\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
"\            '--color hl:68,hl+:110',
"\ 'down':    '30%'
"\ })
"
"" Enable per-command history.
"" CTRL-N and CTRL-P will be automatically bound to next-history and
"" previous-history instead of down and up. If you don't like the change,
"" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
"let g:fzf_history_dir = '~/data/fzf_history/'
"
"
"nnoremap <silent> <Leader>f :Files<CR>
"
"let g:ag_prg="ag --vimgrep --ignore=tags --ignore=compile_commands.json"
"
""directly search the word under cursor
"nmap <Leader>ag <Plug>AgActionWord
"vmap <Leader>ag <Plug>AgActionVisual
""search the word manual
"nnoremap <Leader>mag :Ag<Space>


":tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" display current members on the right windows
nmap <Leader>t :TagbarToggle<CR>


" personal 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change win size
nmap w=  :resize +10<CR>
nmap w-  :resize -10<CR>
nmap w,  :vertical resize -20<CR>
nmap w.  :vertical resize +20<CR>

" ^M change \r\n
nmap <Leader>clr :%s/\r\n/\r/gi<CR>

nmap <Leader>q :q!<CR>
nmap <Leader>oq :only<CR>
nmap <Leader>w :w!<CR>

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
func NoShowExtra()
    set nolist
    set nonu
	set signcolumn=no
endfunc

func ShowExtra()
    set list
    set nu
	"set signcolumn=yes
endfunc


nmap <Leader>ys :call ShowExtra()<CR>
nmap <Leader>ns :call NoShowExtra()<CR>


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
set signcolumn=yes
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
"inoremap <silent><expr> <C-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
"To make <CR> auto-select the first completion item and notify coc.nvim to
"  format on enter, use:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"Map <tab> for trigger completion, completion confirm, snippet expand and jump
"  like VSCode.
inoremap <silent><expr> <TAB>
\ pumvisible() ? coc#_select_confirm() :
\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
"  Note: the coc-snippets extension is required for this to work.



" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" TODO 这里加上转码
function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

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

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

set updatetime=300
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

