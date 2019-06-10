"*****************************************************************************
"" basic Setup
"*****************************************************************************"

"" Map leader to ,
let mapleader=','

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Clear search highlight
set hlsearch!
nnoremap <F3> :set hlsearch!<CR>

if exists('$SHELL')
    set shell =$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"Position of the split panes
set splitbelow
set splitright

" Spelling
setlocal spell
set spelllang=de,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
highlight SpellBad guifg=#ff0000

" Highlight matching brace
set showmatch

"*****************************************************************************
"" Visual Settings
"*****************************************************************************

syntax on
set ruler
set number
set relativenumber
highlight LineNr ctermfg=red

let no_buffers_menu=1
silent! colorscheme gruvbox
set background=dark

set laststatus=2

set mousemodel=popup

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" Golang
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
augroup END

" typescript
let g:yats_host_keyword = 1

" ---------------------------
" coc.nvim default settings
" ---------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
" set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" ---------------------------
" Markdown Config
" ---------------------------
" Sources:
" https://jdhao.github.io/2019/01/15/markdown_edit_preview_nvim/
" https://www.swamphogg.com/2015/vim-setup/
" https://news.ycombinator.com/item?id=10271028

" disable header folding
let g:vim_markdown_folding_disabled = 1
" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0
" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

set nofoldenable    " disable folding

" ---------------------------
" Ultisnips
" ---------------------------
" vertically split ultisnips edit window
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" ---------------------------
" CtrlP
" ---------------------------
let g:ctrlp_show_hidden = 1

" ---------------------------
" Syntastic
" ---------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ---------------------------
" Goyo markdown
" ---------------------------
autocmd! User GoyoLeave Limelight!

" ---------------------------
" Bullets
" ---------------------------
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'md'
			\]

" ---------------------------
" Vimtex
" ---------------------------
let g:tex_flavor='latex'
let g:vimtex_view_method='okular'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" ---------------------------
" Nerdtree
" ---------------------------

" NERDTree configuration
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
 " Open nerd tree when opening folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
 " Show hidden files
let NERDTreeShowHidden=1

" ---------------------------
" Nerdtree commenter
" ---------------------------
"Add spaces after comment delimiters by default
 let g:NERDSpaceDelims = 1
"Use compact syntax for prettified multi-line comments
 let g:NERDCompactSexyComs = 1

" ---------------------------
" Statusline + Airline
" ---------------------------

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'