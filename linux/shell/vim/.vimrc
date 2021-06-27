" Plugins & loading of custom configuration
"Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" ---
" DevTools:

" Linting & Languages Server(LSP & Autocompletion)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ---

" ---
" Git:

" Vim wrapper
Plug 'tpope/vim-fugitive'
" Show changes in vim gutter
Plug 'airblade/vim-gitgutter'
" ---

" ---
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" ---

" ---
" Styles:

" Colour Themes
Plug 'gruvbox-community/gruvbox'
Plug 'liuchengxu/space-vim-theme'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-scripts/CSApprox'

" Airline Theme(Status bar)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Nice icons
Plug 'ryanoasis/vim-devicons'
" ----

" ---
" Programming language specific plugins:

" Syntax & co for all languages

" Alignement of code(Before markdown plugin in polyglot)
Plug 'godlygeek/tabular'

"  Polygplot when using custom language packs
let g:polyglot_disabled = ['typescript']
Plug 'sheerun/vim-polyglot'

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Handle renumbering of lists f.ex in markdown
Plug 'clarke/vim-renumber',  { 'for': 'markdown' }
" Docker
Plug 'kevinhui/vim-docker-tools'
" Env files
Plug 'tpope/vim-dotenv'
" Github actions
Plug 'yasuhiroki/github-actions-yaml.vim'

" Vimtex/latex
Plug 'lervag/vimtex'
" Latex conceal improvements
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Javascript
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
" --

"---
" Misc:

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Match tags
Plug 'valloric/MatchTagAlways'
" Bullets
Plug 'dkarter/bullets.vim'
" Close tags
Plug 'alvan/vim-closetag'
" Auto pair braces
Plug 'jiangmiao/auto-pairs'
" Change surrounding brackets, ... easily with movements
Plug 'tpope/vim-surround'
" Align stuff better
Plug 'junegunn/vim-easy-align'
" Show registers
Plug 'junegunn/vim-peekaboo'
" Comments
Plug 'tpope/vim-commentary'
" highlighted yank
Plug 'machakann/vim-highlightedyank'
" select text, then press * or # to search for it
Plug 'bronson/vim-visual-star-search'
" Display vertical lines to show indentation
Plug 'Yggdroot/indentLine'
" Fancy starter page
Plug 'mhinz/vim-startify'
" Autosave toggle with :AutoSaveToggle
Plug '907th/vim-auto-save'
" Show whitespace
Plug 'ntpeters/vim-better-whitespace'
" Fix capitalized commands in normal mode
Plug 'takac/vim-commandcaps'
" Terminal
Plug 'vimlab/split-term.vim'
" Alternative terminal using tmux
Plug 'benmills/vimux'
" For focused work
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"---

" Initialize plugin system
call plug#end()

" Source External configuration
source ~/.vim/config.vimrc
source ~/.vim/styles.vimrc
source ~/.vim/keys.vimrc
source ~/.vim/plugin-config.vimrc
source ~/.vim/plugin-keys.vimrc
