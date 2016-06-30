" $VIM/.vimrc
" vim: set ts=4 sw=4 expandtab enc=utf-8: 

" my vim compile option:
" enable python3 support for ycm unicode

"./configure --with-features=huge \
"            --enable-multibyte \
"            --enable-rubyinterp \
"            --enable-pythoninterp \
"            --with-python-config-dir=/usr/lib/python2.7/config \
"            --enable-python3interp \
"            --with-python3-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu \
"            --enable-perlinterp \
"            --enable-luainterp \
"            --enable-gui=gtk2 --enable-cscope --prefix=/usr


" thisfile@github
" git clone https://github.com/lostsummer/myvimrc.git ~/.vim

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" {{{ Face theme part
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

" My best gui face
" FIXED: can running on gentoo now
color desert
if has("win32")
    set guifont=Consolas:h10.5
    "set guifont=Yahei_Mono:h11:cGB2312
else
    "set guifont=Monospace\ 11
    "set guifont=WenQuanYi\ Zen\ Hei\ Mono\ 12
    "set guifont=WenQuanYi\ Micro\ Hei\ Mono\ 11
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Regular\ 11
    set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline\ Regular\ 11
	"let g:Powerline_symbols = 'fancy'
endif

" FIXED: can running on gentoo now
if has("win32")
    language mes en
    lang english 
elseif has("mac")
    "language mes en_US.utf8
    "lang en_US.utf8
    language mes zh_CN.UTF-8
    lang zh_CN.UTF-8
else
    language mes zh_CN.utf8
    lang zh_CN.utf8
endif

set langmenu=en_US.UTF-8

if has("win32")
    winsize 100 50
    winpos  250 0
endif

" Toogle Menu and Toolbar
set guioptions-=t
set guioptions-=L
set guioptions-=r
set guioptions-=B
set guioptions-=e
set guioptions+=c
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
		\set guioptions-=T <Bar>
		\set guioptions-=m <Bar>
	\else <Bar>
		\set guioptions+=T <Bar>
		\set guioptions+=m <Bar>
	\endif<CR>

set laststatus=2

" utf-8 for cross platform
set bomb
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set fileformats=unix,dos


" {{{ Shell part
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

" Personal setting for working with Windows NT/2000/XP (requires tee in path)
if &shell =~? 'cmd'
    "set shellxquote=\"
    set shellpipe=2>&1\|\ tee
endif

" Quote shell if it contains space and is not quoted
if &shell =~? '^[^"].* .*[^"]'
    let &shell='"' . &shell . '"'
endif

" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" }}}


" {{{ Misc part
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

"
set whichwrap=h,l,~,b,s,<,>,[,]

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set linespace=2         " 
set smarttab            " 
set history=400         " lines of Ex commands, search history ...
set browsedir=buffer    " use the directory of the related buffer
set clipboard+=unnamed  " use register '*' for all y, d, c, p ops
set autoread            " auto read when a file is changed outside
set isk+=$,%,#          " none of these should be word dividers
set wildmenu            " :h and press <Tab> to see what happens
set wig=*.o,*.pyc       " type of file that will not in wildmenu
set nowrap              " don't break line
set cursorline          " show current line
set number              " show line number
set autoindent          " always set autoindenting on
set report=0            " tell us when anything is changed via :...
set nobackup            " do not keep backup file.
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set backspace=2         " make backspace work normal
set whichwrap+=<,>,h,l  " allow backspace and cursor keys to wrap
set shortmess=atI       " shorten to avoid 'press a key' prompt
set completeopt=menu    " use popup menu to show possible completions
set foldenable          " enable folding, I find it very useful
set foldmethod=manual   " manual, marker, syntax, try set foldcolumn=2
" DO NOT BELL!
set novisualbell        " use visual bell instead of beeping
set noerrorbells        " do not make noise
set ignorecase smartcase

" Don't use Ex mode, use Q for formatting
" map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

set t_Co=256

" Set mapleader
let mapleader = ","
let g:mapleader = ","

" save file
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

" Console window open in the current file's directory, by Tokigun
if has("win32")
    fu! s:Console()
        let l:path = iconv(expand("%:p:h"), &enc, &tenc)
        silent exe "! start /d \"" . l:path . "\""
    endf
    nmap <silent> <Leader>x :call <SID>Console()<CR>
endif

" floding key binding
if version >= 600
    " Reduce folding
    map <F2> zr
    map <S-F2> zR
    " Increase folding
    map <F3> zm
    map <S-F3> zM
endif


" Show TAB char and end space
"set list
set listchars=tab:>-,trail:~
syntax match Trail " +$"
highlight def link Trail Todo

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " For all text files set 'textwidth' to 71 characters.
    autocmd FileType text setlocal textwidth=71

    " zope dtml
    autocmd BufNewFile,BufRead *.dtml setf dtml

    " shell script
    autocmd fileType sh setlocal sw=4 | setlocal sta

    " RedHat spec file
    autocmd BufNewFile,BufReadPost *.spec setf spec

    " Brainfuck file
    autocmd BufNewFile,BufReadPost *.b setf brainfuck

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

endif " has("autocmd")


let g:Tlist_Use_Right_Window=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Sort_Type=1
let g:Tlist_Enable_Fold_Colum=0
let g:Tlist_WinWidth=30
let g:Tlist_Show_One_File=1
let g:Tlist_Process_File_Always=1
let g:Tlist_File_Fold_Auto_Close=1

" visible mode use ,t to open Tlist
nmap <leader>t :TlistToggle<CR>

" be able to move between the tabs with ALT+LeftArrow and ALT+RightArrow
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left>  :tabprevious<CR>

" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" }}}




" {{{ Python part
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " python, not use <tab>
    autocmd FileType python setlocal et | setlocal sta | setlocal sw=4 | setlocal st=4
    " python omnifunc
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    " make set with pyunit
    autocmd BufRead *.py setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
    autocmd BufRead *.py setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

    " FIXED: can running on gentoo now
    if has("win32")
        " :!ctags -R -f python.tags C:/Toolkit/Python26/include
        " Now set the python.tags to vim tags.
        autocmd FileType python set tags+=$VIM/python.tags

        " python auto-complete code(Ctrl-n or Ctrl-p)
        " Typing the following (in insert mode):
        "   os.lis<Ctrl-n>
        " will expand to:
        "   os.listdir(
        autocmd FileType python set complete+=k$VIM/vimfiles/tools/pydiction

        " Auto using the skeleton python template file
        autocmd BufNewFile test*.py 0r $VIM/vimfiles/skeleton/test.py
        autocmd BufNewFile alltests.py 0r $VIM/vimfiles/skeleton/alltests.py
        autocmd BufNewFile *.py 0r $VIM/vimfiles/skeleton/skeleton.py
    else
        " :!ctags -R -f python.tags /usr/include/python2.5/
        " Now set the python.tags to vim tags.
	autocmd FileType python set tags+=$HOME/.vim/tools/python.tags

        " python auto-complete code(Ctrl-n or Ctrl-p)
        " Typing the following (in insert mode):
        "   os.lis<Ctrl-n>
        " will expand to:
        "   os.listdir(
        autocmd FileType python set complete+=k$HOME/.vim/tools/pydiction

        " Auto using the skeleton python template file
        autocmd BufNewFile test*.py 0r $HOME/.vim/skeleton/test.py
        autocmd BufNewFile alltests.py 0r $HOME/.vim/skeleton/alltests.py
        autocmd BufNewFile *.py 0r $HOME/.vim/skeleton/skeleton.py
    endif
endif

" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" }}}



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
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=10    " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.

""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout='BufExplorer|FileExplorer|TagList'
"let g:winManagerWindowLayout='TagList|FileExplorer|BufExplorer'
let g:winManagerWindowLayout='FileExplorer|BufExplorer'
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWidth=30
let g:defaultExplorer=0
let g:bufExplorerResize=0 "close resize
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <C-W><C-T> :WMToggle<cr>

""""""""""""""""""""""""""""""
" project tags file
""""""""""""""""""""""""""""""
set tags=tags;
set autochdir


set noendofline binary

let g:doxygenToolkit_authorName="yushin.wang"
let g:doxygenToolkit_briefTag_funcName="yes"

map <F3>a :DoxAuthor
map <F3>f :Dox
map <F3>b :DoxBlock
map <F3>c o/** */<left><left>

"""""""""""""""""""""""""""""""""""""""""
" Vundle Management
" First get vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
"""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
" let Vundle manage Vundle
Plugin 'gmarik/vundle'
" my Plugin here:
"
" original repos on github
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/winmanager'
Plugin 'corntrace/bufexplorer'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'EasyGrep'
Plugin 'jiangmiao/auto-pairs'
Plugin 'nvie/vim-flake8'
Plugin 'hdima/python-syntax'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-scripts/nginx.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'mbbill/fencview'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
call vundle#end()

"""""""""""""""""""""""""""""""""""""""
" non github repos
" Plugin 'git://git.wincent.com/command-t.git'
"
"""""""""""""""""""""""""""""""""""""""
filetyp plugin indent on

"""""""""""""""""""""""""""""""""""""""
" get new vim source
" git clone https://github.com/b4winckler/vim.git ~/vim
"
"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"
"           CtrlP
"
"""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = ',,'
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
let g:EasyGrepMode = 2     " All:0, Open Buffers:1, TrackExt:2, 
let g:EasyGrepCommand = 1  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 1 " Recursive searching
let g:EasyGrepIgnoreCase = 1 " not ignorecase:0
let g:EasyGrepFilesToExclude = "*.bak, *~, cscope.*, *.a, *.o, *.pyc, *.bak"

"""""""""""""""""""""""""""""""""""""""""""
"          fencview
"""""""""""""""""""""""""""""""""""""""""""
let g:fencview_autodetect = 0
let g:fencview_checklines = 100
let g:fencview_auto_patterns='*'
map <F2> :FencView<cr>

"""""""""""""""""""""""""""""""""""""""""""
"
"           YouCompleteMe
"
"""""""""""""""""""""""""""""""""""""""""""
" ycm install command
" python3 install.py --clang-completer  --gocode-completer

nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>j :YcmCompleter GoTo<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
" Disabel ycm_simple_conf
"let g:ycm_simple_conf_active = 0
" let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
" let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:syntastic_always_populate_loc_list = 1

"""""""""""""""""""""""""""""""""""""""""""
"
"			vim-lua
"
"""""""""""""""""""""""""""""""""""""""""""
let g:lua_interpreter_path = '/usr/bin/lua'
let g:lua_compiler_name = '/usr/bin/luac'
let g:lua_complete_omni = 1
let g:lua_complete_dynamic = 0
let g:lua_omni_blacklist = ['pl\.strict', 'lgi\..']
let g:lua_safe_omni_modules = 1
"let g:lua_define_completefunc = 0
"let g:lua_define_omnifunc = 0

"""""""""""""""""""""""""""""""""""""""""""
"
"			Python Syntax
"
"""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1
let python_version_2 = 1

"""""""""""""""""""""""""""""""""""""""""""
"          Power line
"""""""""""""""""""""""""""""""""""""""""""
"set rtp+=/usr/lib/python2.7/dist-packages/powerline/bindings/vim

"""""""""""""""""""""""""""""""""""""""""""
"         vim-markdown 
"""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1
