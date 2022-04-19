" $VIM/.vimrc
" my vim compile option:
" enable python3 support for ycm unicode

"./configure --with-features=huge \
"            --enable-multibyte \
"            --enable-rubyinterp=yes \
"            --enable-python3interp=yes \
"            --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu \
"            --enable-perlinterp=yes \
"            --enable-luainterp=yes \
"            --enable-cscope \
"            --prefix=/usr \
"            --enable-gui=gtk2 


" thisfile@github
" git clone https://github.com/lostsummer/myvimrc.git ~/.vim


scriptencoding utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 " support for open multi-byte encoded file
set encoding=utf-8

color desert
filetype plugin indent on
syntax on
set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline\ Regular\ 14

" Toogle Menu and Toolbar
set guioptions-=t
set guioptions-=L
set guioptions-=r
set guioptions-=B
set guioptions-=e
set guioptions+=c
set guioptions-=m
set guioptions-=T

set mouse=v
set mousehide


if has('clipboard')
	if has('unnamedplus')
		set clipboard=unnamed,unnamedplus
	else
		set clipboard=unnamed
	endif
endif

set laststatus=2




set backspace=indent,eol,start 					" allow backspacing over everything in insert mode
set shortmess+=filmnrxoOtT                      "  Abbrev. of messages (avoids 'hit enter')"

set linespace=2
set smarttab
set history=1000        						" lines of Ex commands, search history ...
set autoread            						" auto read when a file is changed outside
set isk+=$,%,#          						" none of these should be word dividers
set wildmenu            						" :h and press <Tab> to see what happens
set wig=*.o,*.pyc       						" type of file that will not in wildmenu
set nowrap              						" don't break line
"set cursorline          " show current line
set virtualedit=onemore                      	"  Allow for cursor beyond last character"
"set relativenumber      " show relaive line number
set autoindent          " always set autoindenting on
set report=0            " tell us when anything is changed via :...
set nobackup            " do not keep backup file.
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set backspace=2         " make backspace work normal
set whichwrap+=<,>,h,l  " allow backspace and cursor keys to wrap
"set completeopt=menu    " use popup menu to show possible completions
set foldenable          " enable folding, I find it very useful
set foldmethod=syntax   " manual, marker, syntax, try set foldcolumn=2
" DO NOT BELL!
set novisualbell        " use visual bell instead of beeping
set noerrorbells        " do not make noise
set ignorecase smartcase

set hlsearch

set t_Co=256
set iskeyword-=.                                "  '.' is an end of word designator
set iskeyword-=# 
set iskeyword-=-

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
"set backup
"if has('persistent_undo')
"	set undofile
"	set undolevels=1000
"	set undoreload=10000
"endif

" Set mapleader
let mapleader = ","
let g:mapleader = ","

" Show TAB char and end space
"set list
set listchars=tab:>-,trail:~
"syntax match Trail " +$"

" For all text files set 'textwidth' to 71 characters.
autocmd FileType text setlocal textwidth=81

" zope dtml
autocmd BufNewFile,BufRead *.dtml setf dtml

" shell script
autocmd fileType sh setlocal sw=4 | setlocal sta

" RedHat spec file
autocmd BufNewFile,BufReadPost *.spec setf spec

" python, not use <tab>
autocmd FileType python setlocal et | setlocal sta | setlocal sw=4 | setlocal st=4 | setlocal fdm=indent
" make set with pyunit
autocmd BufRead *.py setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Auto using the skeleton python template file
autocmd BufNewFile test*.py 0r $HOME/.vim/skeleton/test.py
autocmd BufNewFile alltests.py 0r $HOME/.vim/skeleton/alltests.py
autocmd BufNewFile *.py 0r $HOME/.vim/skeleton/skeleton.py
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


let g:Tlist_Use_Right_Window=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Sort_Type=1
let g:Tlist_Enable_Fold_Colum=0
let g:Tlist_WinWidth=30
let g:Tlist_Show_One_File=1
let g:Tlist_Process_File_Always=1
let g:Tlist_File_Fold_Auto_Close=1

nnoremap <F4> :UndotreeToggle<cr>
" NERDTree Open

nnoremap <F3> :NERDTreeToggle<CR>

" visible mode use ,t to open Tlist
nmap <leader>t :TlistToggle<CR>

" be able to move between the tabs with ALT+LeftArrow and ALT+RightArrow
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left>  :tabprevious<CR>


" {{{ Quickfix part
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
map  <leader>q :copen<CR>
nmap <leader>c :cclose<CR>


""""""""""""""""""""""""""""""
"indent
""""""""""""""""""""""""""""""
set expandtab
set tabstop=4
set shiftwidth=4


""""""""""""""""""""""""""""""
" project tags file
""""""""""""""""""""""""""""""
set tags=tags;
set autochdir


"set noendofline binary

"""""""""""""""""""""""""""""""""""""""""
" vim-plug Management
" First get vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
" original repos on github
Plug 'kopischke/vim-stay'
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'
Plug 'scrooloose/syntastic'
"Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-scripts/taglist.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/EasyGrep'
Plug 'jiangmiao/auto-pairs'
Plug 'nvie/vim-flake8'
Plug 'hdima/python-syntax'
Plug 'vim-scripts/nginx.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'terryma/vim-multiple-cursors'
Plug 'SirVer/ultisnips'
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""
"
"           CtrlP
"
"""""""""""""""""""""""""""""""""""""""""""
let g:ctrl_open_multiple_files = 'v'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
    \ 'dir':    '\v[\/]\.(git)$',
    \ 'file':   '\v\.(log|jpg|png|jpeg)$',
    \ }

"""""""""""""""""""""""""""""""""""""""""""
"
"           EasyGrep
"
"""""""""""""""""""""""""""""""""""""""""""
" ag is faster than grep and has nicer output
" apt-get install silversearcher-ag
set grepprg=ag\ --nogroup\ --nocolor
let g:EasyGrepMode = 0     " All:0, Open Buffers:1, TrackExt:2, 
let g:EasyGrepCommand = 1  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 1 " Recursive searching
let g:EasyGrepIgnoreCase = 1 " not ignorecase:0
let g:EasyGrepFilesToExclude = "*.bak,*~,cscope.*,*.a,*.o,*.pyc,*.bak,*.git,*.svn"



"""""""""""""""""""""""""""""""""""""""""""
"         vim-markdown 
"""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1

"""""""""""""""""""""""""""""""""""""""""""
"         vim-go 
"""""""""""""""""""""""""""""""""""""""""""
" Use goimports instead of gofmt.
let g:go_fmt_command = "goimports"
let g:go_fmt_autofmt = 1

au FileType go nmap <Leader>i <Plug>(go-import)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

"""""""""""""""""""""""""""""""""""""""""""
"         ultisnips 
"""""""""""""""""""""""""""""""""""""""""""
" avoid confilct with ycm complete
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"""""""""""""""""""""""""""""""""""""""""""
"      tmhedberg/SimpylFold   
"""""""""""""""""""""""""""""""""""""""""""
let g:SimpylFold_docstring_preview = 1

"""""""""""""""""""""""""""""""""""""""""""
"     
"
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1
let g:php_folding = 1
let g:perl_fold = 1

""""""""""""""""""""""""""""""""""""""""""
" coc.nvim
""""""""""""""""""""""""""""""""""""""""""
nmap <leader>j <Plug>(coc-declaration)
nmap <leader>jd <Plug>(coc-definition)
nmap <leader>rn <Plug>(coc-rename)

""""""""""""""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""""""""""""""
" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'angr'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap <leader>- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap <leader>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>
" 修改了一些个人不喜欢的字符
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"let g:airline_symbols.linenr = "CL" " current line
"let g:airline_symbols.whitespace = '|'
"let g:airline_symbols.maxlinenr = 'Ml' "maxline
"let g:airline_symbols.branch = 'BR'
"let g:airline_symbols.readonly = "RO"
"let g:airline_symbols.dirty = "DT"
"let g:airline_symbols.crypt = "CR"

