" General configs

" Set shell
if exists('$SHELL')
    set shell =$SHELL
else
    set shell=/bin/sh
endif
" We're powerful enough. Load the syntax highlighting right away
autocmd BufEnter *.{js,jsx,ts,tsx,md} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx,md} :syntax sync clear

" ---
" Different settings
" Automatically wrap text that extends beyond the screen length.
set wrap
" Turn on the Wild menu
" That's the thing, that autocompletes in the tab bar :D
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
  endif
" Swap files are annoying
set noswapfile
" Enable scrolling in vim using tmux
set mouse=a
" Speed up scrolling in Vim
set ttyfast
" Map leader to ,
let mapleader=','
" Fix backspace indent
set backspace=indent,eol,start
" For regular expressions turn magic on
set magic
" ---

" ---
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
" ---

" ---
" Spaces for tabs
set tabstop=2                         " number of spaces used as tab for file(Number of visual spaces per TAB)
set softtabstop=2                     " number of spaces used as tab for editing(Number of spaces in TAB when editing)
set shiftwidth=2                      " number of spaces used to autoindent(Number of spaces indented when reindent operations (>> and <<) are used)
set expandtab                         " expand tabs into spaces(Convert TABs to spaces)
set smarttab                          " smart tabulation and backspace(Enable intelligent tabbing and spacing for indentation and alignment)
set bs=indent,eol,start               " allow backspacing over everything

set ai "Auto indent
set wrap "Wrap lines
" ---

" ---
" Linebreak on 120 characters
set lbr
set tw=120
" ---

" ---
" Searching
set hlsearch " When there is a previous search pattern, highlight all its matches.
set incsearch " While typing a search command, show where the pattern, as it was typed
set ignorecase
set smartcase " Override the 'ignorecase' option if the search pattern contains upper case characters
set hlsearch! " Clear search highlight
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
" ---

" ---
" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
" ---

" ---
" Position of the split panes set splitbelow
set splitright
" ---

" ---
" Highlight matching brace
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>
" ---

" ---
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" ---
