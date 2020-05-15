" General configs

if exists('$SHELL')
    set shell =$SHELL
else
    set shell=/bin/sh
endif

" Automatically wrap text that extends beyond the screen length.
set wrap
"
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

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Clear search highlight
set hlsearch!

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

"" Visual Settings
set ruler
set number
set relativenumber
highlight LineNr ctermfg=red
let no_buffers_menu=1
silent! colorscheme gruvbox
set background=dark
" True colors
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
set laststatus=2
set mousemodel=popup

" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

" Status line
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set title
set titleold="Terminal"
set titlestring=%F

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
