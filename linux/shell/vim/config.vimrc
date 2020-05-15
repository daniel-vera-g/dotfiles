" General configs

if exists('$SHELL')
    set shell =$SHELL
else
    set shell=/bin/sh
endif

" Automatically wrap text that extends beyond the screen length.
set wrap

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
  endif

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Enable scrolling in vim using tmux
set mouse=a
" Speed up scrolling in Vim
set ttyfast

" Set shell
set shell=/usr/bin/zsh

" Map leader to ,
let mapleader=','

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

" Fix backspace indent
set backspace=indent,eol,start

" Spaces for tabs
set tabstop=2                         " number of spaces used as tab for file(Number of visual spaces per TAB)
set softtabstop=2                     " number of spaces used as tab for editing(Number of spaces in TAB when editing)
set shiftwidth=2                      " number of spaces used to autoindent(Number of spaces indented when reindent operations (>> and <<) are used)
set expandtab                         " expand tabs into spaces(Convert TABs to spaces)
set smarttab                          " smart tabulation and backspace(Enable intelligent tabbing and spacing for indentation and alignment)
set bs=indent,eol,start               " allow backspacing over everything

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Clear search highlight
set hlsearch!

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" Position of the split panes
set splitbelow
set splitright

" Highlight matching brace
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Height of the command bar
set cmdheight=1

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
