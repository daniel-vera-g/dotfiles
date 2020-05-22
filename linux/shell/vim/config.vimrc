" General configs

if exists('$SHELL')
    set shell =$SHELL
else
    set shell=/bin/sh
endif

" ---
" Different settings
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
set si "Smart indent
set wrap "Wrap lines
" ---

" ---
" Linebreak on 500 characters
set lbr
set tw=500
" ---

" ---
" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Clear search highlight
set hlsearch!
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
" Position of the split panes
set splitbelow
set splitright
" ---

" ---
" Highlight matching brace
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" ---

" ---
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" ---

" ---
" Spell checking
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
" Spelling & Grammar
set nospell
setlocal spell
set spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/de.utf-8.add
set spelllang=de,en_gb
highlight SpellBad guifg=#ff0000
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" LanguageTool
let g:languagetool_jar = '~/LanguageTool-4.6/languagetool-commandline.jar'
" Set vim-lexical file types
augroup lexical
autocmd!
autocmd FileType markdown,mkd call lexical#init()
autocmd FileType textile call lexical#init()
autocmd FileType latex call lexical#init()
autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
let g:lexical#spell = 1
let g:lexical#spelllang = ['en_gb', 'de']
let g:lexical#thesaurus = ['~/.vim/thesaurus/moby_thesaurus.txt',]
let g:lexical#spellfile = ['~/.vim/spell/en.utf-8.add','~/.vim/spell/de.utf-8.add',]
" ---
