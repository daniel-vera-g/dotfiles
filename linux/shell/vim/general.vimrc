if exists('$SHELL')
    set shell =$SHELL
else
    set shell=/bin/sh
endif

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

" Tabs. May be overridden by autocmd rules
" TODO
" set tabstop=4
" set shiftwidth=4
" set softtabstop=0
" set expandtab
" filetype plugin indent on
" On pressing tab, insert 2 spaces
" set expandtab
" " show existing tab with 2 spaces width
" set tabstop=2
" set softtabstop=2
" when indenting with '>', use 2 spaces width
" set shiftwidth=2

set tabstop=2                         " number of spaces used as tab for file
set softtabstop=2                     " number of spaces used as tab for editing
set shiftwidth=2                      " number of spaces used to autoindent
set expandtab                         " expand tabs into spaces
set smarttab                          " smart tabulation and backspace
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

" TODO set right german & english grammar & co
"" Spelling & Grammar
" TODO set nospell
" set nospell
" set spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/de.utf-8.add
" setlocal spell
" set spelllang=de,en_gb
" highlight SpellBad guifg=#ff0000
" inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" LanguageTool
" let g:languagetool_jar = '~/LanguageTool-4.6/languagetool-commandline.jar'
" Set vim-lexical file types
" augroup lexical
" autocmd!
" autocmd FileType markdown,mkd call lexical#init()
" autocmd FileType textile call lexical#init()
" autocmd FileType latex call lexical#init()
" autocmd FileType text call lexical#init({ 'spell': 0 })
" augroup END
" let g:lexical#spell = 1
" let g:lexical#spelllang = ['en_gb', 'de']
" let g:lexical#thesaurus = ['~/.vim/thesaurus/moby_thesaurus.txt',]
" let g:lexical#spellfile = ['~/.vim/spell/en.utf-8.add','~/.vim/spell/de.utf-8.add',]

" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

" Status line
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set title
set titleold="Terminal"
set titlestring=%F

" TODO needed?
" Use modeline overrides(For preconfiguration at beginning or end of file)
" set modeline
" set modelines=10

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"-----
""" Plugin specific configs

" TODO golang stuff if needed
"" Golang
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
" let g:go_def_mapping_enabled = 0
" Go specific tabs
" TODO tabs to spaces
" au FileType go set noexpandtab
" au FileType go set shiftwidth=4
" au FileType go set softtabstop=4
" au FileType go set tabstop=4
" Colors
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_types = 1
" Highlight same variables
" let g:go_auto_sameids = 0
" Auto import dependencies
" let g:go_fmt_command = "goimports"

"" Ale TODO ale config & use actively
" Error and warning signs.
" let g:ale_sign_error = '⤫'
" let g:ale_sign_warning = '⚠'
" Ale lint
" let g:ale_linters = {
" \   'latex': ['lacheck', 'chktex', 'Proselint'],
" \   'javascript': ['standard']
" \}
" let g:ale_linters_explicit = 1
" TODO
" let g:ale_lint_on_text_changed = 0
" TODO
" let g:ale_lint_on_save = 1
" Ale fix
" let g:ale_fix_on_save = 1
"
" SHOULD come at ale fixers and removed for standard
" TODO formatt with prettier and fix with standard
" \   'javascript': ['prettier', 'eslint'],
" TODO
" let g:ale_fixers = {
" \   'javascript': ['prettier', 'standard'],
" \   'css': ['prettier'],
" \   'latex': ['lacheck', 'chktex', 'Proselint'],
" \}

" Show types
" let g:go_auto_type_info = 1
" Better json handline
" let g:go_addtags_transform = "snakecase"
"Snippets engine
let g:go_snippet_engine = "ultisnips"

"" html
" for html files, 2 spaces
" autocmd Filetype html setlocal ts=2 sw=2 expandtab

"" javascript
" let g:javascript_enable_domhtmlcss = 1
" let g:javascript_plugin_flow = 1
" vim-javascript
" TODO tabs to spaces
" augroup vimrc-javascript
  " autocmd!
  " autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
" augroup END

" TODO
"" typescript
" let g:yats_host_keyword = 1

" TODO tern
"" Tern
"enable keyboard shortcuts
" let g:tern_map_keys=1
"show argument hints
" let g:tern_show_argument_hints='on_hold'
"JS libraries
" let g:used_javascript_libs = 'jquery, react, chai, handlebars, vue'

" TODO coc vim
"" coc.nvim default settings
" if hidden is not set, TextEdit might fail.
" set hidden
" Better display for messages
" set cmdheight=2 -> Fix for big command bar
" Smaller updatetime for CursorHold & CursorHoldI
" set updatetime=300
" don't give |ins-completion-menu| messages.
" set shortmess+=c
" always show signcolumns
" set signcolumn=yes

"" Markdown Config
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
" Remove conceal feature for pandoc markdown
let g:pandoc#syntax#conceal#use = 0

"" Ultisnips
" vertically split ultisnips edit window
let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-s>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetsDir = "~/.vim/plugged/ultisnips/UltiSnips"

"" CtrlP -> ONLY USE FZF
" let g:ctrlp_show_hidden = 1

" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" Bullets
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'md'
			\]

"" Vimtex
" Fix conceal conflict with identline plugin(https://tex.stackexchange.com/questions/252218/strange-vim-latex-behaviour)
autocmd BufNewFile,BufRead *.tex IndentLinesDisable
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" Vimtex TOC settings
let g:vimtex_toc_config = {
      \ 'name' : 'TOC',
      \ 'layers' : ['content', 'todo', 'include'],
      \ 'resize' : 1,
      \ 'split_width' : 50,
      \ 'todo_sorted' : 0,
      \ 'show_help' : 1,
      \ 'show_numbers' : 1,
      \ 'mode' : 2,
      \}

" TODO deoplete
" Deoplete
" This is new style
" call deoplete#custom#var('omni', 'input_patterns', {
"       \ 'tex': g:vimtex#re#deoplete
"       \})


"" Nerdtree
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Show hidden files
let NERDTreeShowHidden=1
" Close Nerdtree when opening a file
let NERDTreeQuitOnOpen = 1
" Close Nerdtree if it's the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open nerd tree when opening folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" TODO no more needed
"" Nerdtree commenter
"Add spaces after comment delimiters by default
 " let g:NERDSpaceDelims = 1
"Use compact syntax for prettified multi-line comments
 " let g:NERDCompactSexyComs = 1

"" Statusline + Airline
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

"" Autosave
let g:auto_save = 1  " enable AutoSave on Vim startup

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
" TODO ale
" let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#ignore_bufadd_pat =
  \ 'gundo|undotree|vimfiler|tagbar|nerd_tree|startify|!'
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
" TODO ale
" let airline#extensions#ale#error_symbol = 'E:'
" let airline#extensions#ale#warning_symbol = 'W:'

" TODO fix because of Error closing buffers
" Save folding on exit
" augroup remember_folds
  " autocmd!
  " autocmd BufWinLeave * mkview
  " autocmd BufWinEnter * silent! loadview
  " augroup END
