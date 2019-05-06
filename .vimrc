
"vundle
set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"-------------------=== Code/Project navigation ===-------------
    Plugin 'scrooloose/nerdtree'                " Project and file navigation
    Plugin 'majutsushi/tagbar'                  " Class/module browser
    Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files

"colors:
color molokai

"Powerline:
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"html
"  isnowfy only compatible with python not python3
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'

"python syntax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

"auto-completion stuff
Plugin 'Valloric/YouCompleteMe'

"Typechecker for Python
Plugin 'integralist/vim-mypy'



call vundle#end()

filetype plugin  on 
filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1

"""""""""""" Start Powerline Settings """"""""""""""""
"/home/fs/.local/lib/python3.6/site-packages/powerline/config_files
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set laststatus=2
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=Source\ Code\ Pro\ for\ Powerline:h15
        colorscheme PaperColor              " set color scheme
    endif
endif
""""""""""" END of PowerLine Settings  """""""""""""""

syntax enable                               " syntax highlight

set t_Co=256                                " set 256 colors

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

"custom keys
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
"colorscheme zenburn
"set guifont=Monaco:h14
let g:molokai_original = 1

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}

set enc=utf-8	                            " utf-8 by default

set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files


let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"turn on numbering
set nu

"have nice tab feature:
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start

"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap " :NERDTreeToggle<CR>


"Folding based on indentation:
"autocmd FileType python set foldmethod=indent
"use space to open folds
"nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
