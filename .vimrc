"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"for plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
"set runtimepath^=/data/home/lebyzhao/.vim/plugged/coc.nvim
"
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}

Plug 'https://github.com/Shougo/echodoc.vim'

" for vim markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'skywind3000/vim-preview'

" for code to mark, using: m
Plug 'https://github.com/kshenoy/vim-signature'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'https://github.com/rking/ag.vim'
"Plug 'https://github.com/Chun-Yang/vim-action-ag'

" for smart select
Plug 'https://github.com/terryma/vim-expand-region'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'https://github.com/majutsushi/tagbar'

" colo
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'https://github.com/tomasr/molokai'
Plug 'https://github.com/NLKNguyen/papercolor-theme'
Plug 'https://github.com/w0ng/vim-hybrid'
Plug 'https://github.com/nielsmadan/harlequin'
Plug 'https://github.com/jnurmine/Zenburn'

Plug 'kien/rainbow_parentheses.vim'

"feel really bad
"Plug 'jackguo380/vim-lsp-cxx-highlight'
"Plug 'octol/vim-cpp-enhanced-highlight'
Plug '~/.vim/my-plugins/semantic-highlight.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"for other main config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"
"set cindent
set wrap
"
set cursorline
set nu
set hls
syntax on
"!!!never set this
"set paste

"using: zM  zR  za zA
set foldmethod=indent
set foldlevelstart=99
set fileencoding=gb2312
set fileencodings=gb2312,ucs-bom,utf-8,cp936,gbk,gb18030,big5,iso-8859-1,latin1
set enc=gb2312
set tenc=gb2312

set nocompatible
syntax on
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"for markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for markdown colo
au BufRead,BufNewFile *.{md,txt} colo PaperColor
set conceallevel=2
let g:vim_markdown_math = 1
" for markdown colo, MUST put these after colo settings
let g:vim_markdown_auto_extension_ext='txt'
au BufNewFile,BufFilePre,BufRead *.{md,txt} set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.{md,txt} set syntax=markdown


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"for semantic-highlight.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>s :SemanticHighlightToggle<cr>
"original:
"default as
"let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]
let g:semanticTermColors = [42,1,214,190,4,5,6,7,48,9,3,34,12,13,14,15,81,126,108,154]
"""保存时触发更新
au BufWritePost <buffer> :SemanticHighlight
au BufRead,BufNewFile *.{cpp,c,h} :SemanticHighlight
"hi Member cterm=italic


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"## more personal key bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim-bindings.vim
