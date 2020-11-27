" Fix Vimtex starting error
filetype plugin indent on
syntax on

" Plugins & loading of custom configuration
"Specify a directory for plugins
"- For Neovim: ~/.local/share/nvim/plugged
"- Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" ---
" Essential programming tools(Syntax check, Language server & Auto completion)
" Ale for syntastic(Syntax checking through LSP)
Plug 'w0rp/ale'
" Languages Server(LSP & Autocompletion)
" Alternative to deoplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ---

" ---
" Git
" Vim wrapper
Plug 'tpope/vim-fugitive'
" To open files in gitlab
Plug 'shumphrey/fugitive-gitlab.vim'
" To open files in github
Plug 'tpope/vim-rhubarb'
" Show changes in vim gutter
Plug 'airblade/vim-gitgutter'
" ---

" ---
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'
" ---

" ---
" Some styles:
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
" Language specific plugins
" Syntax & co for all languages
Plug 'sheerun/vim-polyglot'
" Markdown
" Optional markdown:
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Focus work session
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Docker
Plug 'kevinhui/vim-docker-tools'
" Env files
Plug 'tpope/vim-dotenv'
" Vimtex/latex
Plug 'lervag/vimtex'
" Latex conceal improvements
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
" --

"---
" Different other plugins
" Fuzzy search -> Better navigation through project
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Match tags
Plug 'valloric/MatchTagAlways'
" Close tags
Plug 'alvan/vim-closetag'
" Auto pair braces
Plug 'jiangmiao/auto-pairs'
" Align stuff better
Plug 'junegunn/vim-easy-align'
" Show registers
Plug 'https://github.com/junegunn/vim-peekaboo'
" Change surrounding brackets, ... easily with movements
Plug 'tpope/vim-surround'
" Comments
Plug 'tpope/vim-commentary'
" Rg Search
Plug 'jremmen/vim-ripgrep'
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
" Bullets
Plug 'dkarter/bullets.vim'
" Nerdtree
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Nerdtree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"---

" Initialize plugin system
call plug#end()

" Source External configuration
source ~/.vim/plugin-config.vimrc
source ~/.vim/plugin-keys.vimrc
source ~/.vim/config.vimrc
source ~/.vim/styles.vimrc
source ~/.vim/keys.vimrc
