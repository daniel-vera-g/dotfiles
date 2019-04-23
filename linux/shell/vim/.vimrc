" ---------------------Editor custom Settings---------------------

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
"Source: https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally#easier-split-navigations

"Set better leader
let mapleader = ","

" + s to save
noremap s :update

filetype plugin indent on
"Autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"Cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
	au!
	autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

"-------------Vim plug -------------

"Specify a directory for plugins
"- For Neovim: ~/.local/share/nvim/plugged
"- Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

"----- General plugins ----

"Plug outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

"https://github.com/vim-syntastic/syntastic
Plug 'vim-syntastic/syntastic'

"Autocomplete
Plug 'Valloric/YouCompleteMe'

"https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'

"https://github.com/junegunn/vim-peekaboo
Plug 'https://github.com/junegunn/vim-peekaboo'

"https://github.com/haya14busa/incsearch.vim
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

"Autocomplete on tab
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
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" Execute tmux commands in vim
Plug 'benmills/vimux'
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

"----- Javascript ----

"https://github.com/pangloss/vim-javascript
Plug 'https://github.com/pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1

"----- Python ----

" UI related
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Better Visual Guide
Plug 'Yggdroot/indentLine'
" syntax check
Plug 'w0rp/ale'

" Formater
Plug 'Chiel92/vim-autoformat'
" vim-autoformat
noremap <F4> :Autoformat<CR>

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}

"----- git ----

" Show changes in vim gutter(https://github.com/airblade/vim-gitgutter)
Plug 'airblade/vim-gitgutter'

" Vim wrapper
" https://github.com/tpope/vim-fugitive
" http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/
" https://blog.kitware.com/fugitive-a-git-plugin-for-vim/Additional
Plug 'tpope/vim-fugitive'

"----- markdown & latex----

"https://www.swamphogg.com/2015/vim-setup/
"https://news.ycombinator.com/item?id=10271028

"https://github.com/vim-pandoc/vim-pandoc
Plug 'vim-pandoc/vim-pandoc'

"https://github.com/vim-pandoc/vim-pandoc-syntax
Plug 'vim-pandoc/vim-pandoc-syntax'
set nofoldenable    " disable folding

"https://github.com/gabrielelana/vim-markdown
"Plug 'gabrielelana/vim-markdown'

"https://github.com/plasticboy/vim-markdown
"Plug 'plasticboy/vim-markdown'

"https://github.com/dkarter/bullets.vim
Plug 'dkarter/bullets.vim'

" Bullets.vim
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'md'
			\]

"https://github.com/lervag/vimtex
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"Snippets
"https://yufanlu.net/2016/10/30/ultisnips/
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

"Spelling
setlocal spell
set spelllang=de,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"----- Color Themes ----

"Color Theme 1
"https://github.com/morhetz/gruvbox/wiki/Terminal-specific
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

"Initialize plugin system
call plug#end()

"-------------Color Theme customization-------------

" UI configuration
syntax enable
syntax on

" Colorsheme
colorscheme gruvbox
set background=dark

" True Color Support if it's avaiable in terminal
if has("termguicolors")
	set termguicolors
endif

if has("gui_running")
	set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

set number
set relativenumber




highlight LineNr ctermfg=red
