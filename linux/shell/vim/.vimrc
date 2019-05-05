" ----------------------------------------------------------
" --------------------- Custom Settings---------------------
" ----------------------------------------------------------

"Set better leader
let mapleader = ","

" +++++++++++++++++++++ Splits, tabs & windows +++++++++++++++++++++

"More natural vim spliting
"Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" CTRL-Tab is next tab
noremap <C-Tab> :<C-U>tabnext<CR>
inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
cnoremap <C-Tab> <C-C>:tabnext<CR>
" CTRL-SHIFT-Tab is previous tab
noremap <C-S-Tab> :<C-U>tabprevious<CR>
inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
cnoremap <C-S-Tab> <C-C>:tabprevious<CR>

"Position of the split panes
set splitbelow
set splitright

" +++++++++++++++++++++ general config +++++++++++++++++++++

" leader + s to save
noremap <Leader>s :update<CR>

" Indenting
filetype plugin indent on
set tabstop=8     " tabs are at proper location
set expandtab     " don't use actual tab character (ctrl-v)
set shiftwidth=2  " indenting is 4 spaces
set autoindent    " turns it on
set smartindent   " does the right thing (mostly) in programs
set cindent       " stricter rules for C programs

" Cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Optional reset cursor on start:
augroup myCmds
	au!
	autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" ----------------------------------------------------------
" --------------------- Plug ---------------------
" ----------------------------------------------------------

"Specify a directory for plugins
"- For Neovim: ~/.local/share/nvim/plugged
"- Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')


" +++++++++++++++++++++ General Plugins +++++++++++++++++++++

"Fancy starter page
Plug 'mhinz/vim-startify'

" Autosave toggle with :AutoSaveToggle
Plug 'vim-scripts/vim-auto-save'

" Better navigation through project
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_show_hidden = 1

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
noremap <Leader>fz :FZF<CR>
noremap <leader>bf :Buffers<CR>

" Close brackets
Plug 'tpope/vim-surround'

" Extend text object
Plug 'wellle/targets.vim'

" Change position of words
Plug 'AndrewRadev/sideways.vim'

" sideways
nnoremap <a-h> :SidewaysLeft<cr>
nnoremap <a-l> :SidewaysRight<cr>

Plug 'ntpeters/vim-better-whitespace'

" Fix capitalized commands
Plug 'takac/vim-commandcaps'

" Faster code navigation
Plug 'justinmk/vim-sneak'

" Enhance buffer experience
Plug 'junegunn/vim-slash'
noremap <Leader>bn :bNext<CR>
noremap <Leader>bp :bprevious<CR>


" Auto pair braces
Plug 'jiangmiao/auto-pairs'

" Check for errors
Plug 'vim-syntastic/syntastic'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Autocomplete
Plug 'Valloric/YouCompleteMe'
"Autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Show registers TODO fix error with YCM
" Plug 'https://github.com/junegunn/vim-peekaboo'

" Show buffers on the top
Plug 'bagrat/vim-buffet'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Nerdtree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
" Schortcut for NERDTree toggle
map <C-n> :NERDTreeToggle<CR>
" Open nerd tree when opening folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Show hidden files
let NERDTreeShowHidden=1

" Terminal
Plug 'vimlab/split-term.vim'

" Alternative terminal
Plug 'kassio/neoterm'

"Better commenting(Alternative: https://github.com/tpope/vim-commentary)
Plug 'scrooloose/nerdcommenter'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" +++++++++++++++++++++ Search +++++++++++++++++++++

Plug 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase"
set incsearch
set hlsearch

" Clear search highlight
set hlsearch!
nnoremap <F3> :set hlsearch!<CR>

" +++++++++++++++++++++ Autocomplete on tab +++++++++++++++++++++

"https://news.ycombinator.com/item?id=13960147
"https://medium.com/@sszreter/vim-tab-autocomplete-in-insert-mode-and-fuzzy-search-for-opening-files-484260f52618
"https://vim.fandom.com/wiki/Autocomplete_with_TAB_when_typing_words
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction inoremap <tab> <c-r>=InsertTabWrapper()<cr> 
" +++++++++++++++++++++ TMUX commands in vim +++++++++++++++++++++

Plug 'benmills/vimux'
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" +++++++++++++++++++++ Javascript +++++++++++++++++++++

Plug 'https://github.com/pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1

Plug 'ternjs/tern_for_vim'              " JavaScript auto-completer

" syntax check
Plug 'w0rp/ale'
" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}

" Formater
Plug 'Chiel92/vim-autoformat'
" vim-autoformat
noremap <F4> :Autoformat<CR>

" +++++++++++++++++++++ Git +++++++++++++++++++++

" Show changes in vim gutter
Plug 'airblade/vim-gitgutter'

" Vim wrapper
" http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/
" https://blog.kitware.com/fugitive-a-git-plugin-for-vim/Additional
Plug 'tpope/vim-fugitive'
" To open files in gitlab
Plug 'shumphrey/fugitive-gitlab.vim'
" To open files in github
Plug 'tpope/vim-rhubarb'
" Git commit browser
Plug 'junegunn/gv.vim'
" Git workflow tool
Plug 'jreybert/vimagit'
" Git branching
Plug 'sodapopcan/vim-twiggy'

" +++++++++++++++++++++ Markdown +++++++++++++++++++++

"https://www.swamphogg.com/2015/vim-setup/
"https://news.ycombinator.com/item?id=10271028

" tabular plugin is used to format tables
Plug 'godlygeek/tabular'
" JSON front matter highlight plugin
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'

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

"https://github.com/vim-pandoc/vim-pandoc
Plug 'vim-pandoc/vim-pandoc'

"https://github.com/vim-pandoc/vim-pandoc-syntax
Plug 'vim-pandoc/vim-pandoc-syntax'
set nofoldenable    " disable folding

"More focused working
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Source: https://jdhao.github.io/2019/01/15/markdown_edit_preview_nvim/

" +++++++++++++++++++++ Bullets +++++++++++++++++++++
Plug 'dkarter/bullets.vim'

let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'md'
			\]

" +++++++++++++++++++++ Vimtext setup +++++++++++++++++++++
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
" let g:vimtex_view_method='okular'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Latex conceal improvements
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

" +++++++++++++++++++++ Snippets +++++++++++++++++++++
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir = "~/.vim/plugged/ultisnips/UltiSnips"

" vertically split ultisnips edit window
let g:UltiSnipsEditSplit="vertical"
"Open UltiSnips edit function
nmap <leader>ue :UltiSnipsEdit<cr>


" ----------------------------------------------------------
" --------------------- Color theme & UI ---------------------
" ----------------------------------------------------------

" +++++++++++++++++++++ Color Themes +++++++++++++++++++++

"Color Theme 1
Plug 'morhetz/gruvbox'

"Color Theme 2
Plug 'altercation/vim-colors-solarized'

"Color Theme 3
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

"Color Theme 3
Plug 'liuchengxu/space-vim-theme'

" Nice icons
Plug 'ryanoasis/vim-devicons'

" +++++++++++++++++++++ UI config +++++++++++++++++++++

" UI configuration
syntax enable
syntax on

" True Color Support if it's avalaible in terminal
if has("termguicolors")
	set termguicolors
endif

if has("gui_running")
	set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

" Numbering
set number
set relativenumber
highlight LineNr ctermfg=red

"Initialize plugin system
call plug#end()

" Colorsheme(At the end because not loaded)
colorscheme gruvbox
set background=dark

" Spelling
setlocal spell
set spelllang=de,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
highlight SpellBad guifg=#ff0000
