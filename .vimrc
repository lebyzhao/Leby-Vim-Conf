"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"for plug
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'https://github.com/Shougo/echodoc.vim'
Plug 'https://github.com/rickhowe/diffchar.vim'

" for vim markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'skywind3000/vim-preview'

"for vim start desk
Plug 'mhinz/vim-startify'

" switch between h and cpp
Plug 'https://github.com/derekwyatt/vim-fswitch'

" for code to mark, using: m
Plug 'https://github.com/kshenoy/vim-signature'

Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/rking/ag.vim'
Plug 'https://github.com/Chun-Yang/vim-action-ag'

" for smart select
Plug 'https://github.com/terryma/vim-expand-region'

Plug 'scrooloose/nerdtree'
Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/szw/vim-maximizer'
Plug 'will133/vim-dirdiff'

" show tab like
Plug 'Yggdroot/indentLine'

" format shell
"Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }

" colo
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'https://github.com/tomasr/molokai'
Plug 'https://github.com/NLKNguyen/papercolor-theme'
Plug 'https://github.com/w0ng/vim-hybrid'
Plug 'https://github.com/nielsmadan/harlequin'
Plug 'https://github.com/jnurmine/Zenburn'
Plug 'https://github.com/jnurmine/Zenburn'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sonph/onehalf', {'rtp': 'vim/'}

"Plug 'kien/rainbow_parentheses.vim'
Plug 'mtdl9/vim-log-highlighting'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

" for python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

"feel really bad
Plug 'https://github.com/inkarkat/vim-ingo-library'
Plug 'https://github.com/inkarkat/vim-mark'
Plug 'https://github.com/tpope/vim-fugitive'

Plug 'octol/vim-cpp-enhanced-highlight'
Plug '~/.vim/my-plugins/semantic-highlight.vim'
Plug '~/.vim/my-plugins/highlight.vim'

"Plug 'jackguo380/vim-lsp-cxx-highlight'
call plug#end()

" for codefmt
" the glaive#Install() should go after the "call plug#end()"
call glaive#Install()

" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"for other main config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set softtabstop=4
"set shiftwidth=2
"set tabstop=4 
"set shiftwidth=4
set nu
set hls
syntax on

"!!!!!!!!!!!!!!!!!never set this,will broken complete
"set paste

"using: zM  zR  za zA
set foldmethod=indent
set foldlevelstart=99

set nocompatible
filetype plugin indent on
set ttyfast
set wrap

"set list
"set listchars=tab:\|.,trail:.
"set listchars=tab:>-,trail:-

let g:lsp_cxx_hl_use_text_props = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"for semantic-highlight.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>s :SemanticHighlightToggle<cr>
let g:semanticTermColors = [42,33,225,190,169,164,6,7,48,172,3,34,75,105,14,15,81,141,108,154]
au BufWritePost <buffer> :SemanticHighlight
au BufRead,BufNewFile *.{cpp,c,cc,h,sh,vim} :SemanticHighlight

":
":"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":"##vim-cpp-enhanced-highlight
":"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"##vimdiff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":DirDiff <A:Src Directory> <B:Src Directory>
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,*.o,*.a,.git,.clang,.clangd,compile_commands.json,.cache,bazel-fit"
let g:DirDiffWindowSize = 18
let g:DirDiffSort = 1 

if &diff
  colors onedark
endif
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

"set diffopt+=iwhite
"set diffexpr=DiffW()
"function DiffW()
"  let opt = ""
"   if &diffopt =~ "icase"
"     let opt = opt . "-i "
"   endif
"   if &diffopt =~ "iwhite"
"     let opt = opt . "-w " " swapped vim's -b with -w
"   endif
"   silent execute "!diff -a --binary " . opt .
"     \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
"endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"## more personal key bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim-bindings.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"## colos
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim-colo.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"## for python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim-py.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"## for enc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType json syntax match Comment +\/\/.\+$+

set fileencodings=gb2312,ucs-bom,utf-8,cp936,gbk,gb18030,big5,iso-8859-1,latin1
let os_lang = $LANG
if os_lang == 'en_US.UTF-8' || os_lang == 'zh_CN.UTF-8'
	set fenc=utf-8
	set enc=utf-8
	set tenc=utf-8
else
	set fenc=gb2312
	set enc=gb2312
	set tenc=gb2312
	echo "Hi, leby, you are using GB2312 encoding..."
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"##  vim-indentguides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":IndentLinesToggle
let g:indentLine_enabled = 1
"let g:indentLine_char_list = ['|', '¦']
let g:indentLine_char_list = ['¦']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"## code format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:echodoc#enable_at_startup = 1


"let g:echodoc#type = 'popup'
"" To use a custom highlight for the popup window,
"" change Pmenu to your highlight group
"highlight link EchoDocPopup Pmenu
set cmdheight=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"## code format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cc=80
let g:formatter_yapf_style = 'google'
"disabel auto format
:"augroup autoformat_settings
:"  "autocmd FileType bzl AutoFormatBuffer buildifier
:"  "autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
:"  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
:"  "autocmd FileType dart AutoFormatBuffer dartfmt
:"  "autocmd FileType go AutoFormatBuffer gofmt
:"  "autocmd FileType gn AutoFormatBuffer gn
:"  "autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
:"  "autocmd FileType java AutoFormatBuffer google-java-format
:"  "autocmd FileType python AutoFormatBuffer yapf
:"  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
:"  autocmd FileType vue AutoFormatBuffer prettier
:"augroup END

function s:AddCodefmtEqualMapping() abort
  " Replace all the various ={motion} keys to codefmt
  nnoremap <buffer> = :set opfunc=codefmt#FormatMap<CR>g@
  nnoremap <buffer> == :FormatLines<CR>
  vnoremap <buffer> = :FormatLines<CR>
endfunction

au BufRead,BufNewFile CMakeLists.txt set ft=cmake
augroup codefmt_equal
  autocmd FileType h,cpp,proto,py,vim,sh call s:AddCodefmtEqualMapping()
augroup END

