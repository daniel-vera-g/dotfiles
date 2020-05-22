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
" Languages Server(LSP)
Plug 'neoclide/coc.nvim', {'do': 'npm install --frozen-lockfile'}
" Async completion
if has('nvim')
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	" Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
else
 Plug 'Shougo/deoplete.nvim'
 Plug 'roxma/nvim-yarp'
 Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
" ---

" ---
" Git
" Show changes in vim gutter
Plug 'airblade/vim-gitgutter'
" Vim wrapper
Plug 'tpope/vim-fugitive'
" To open files in gitlab
Plug 'shumphrey/fugitive-gitlab.vim'
" To open files in github
Plug 'tpope/vim-rhubarb'
" ---

" ---
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" ---

" ---
" Colour Themes
Plug 'morhetz/gruvbox'
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
" Markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" Focus work session
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
" go
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'fvictorio/vim-extract-variable'
" Syntax & co for all languages
Plug 'sheerun/vim-polyglot'
" --
" html
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
" Match tags
Plug 'valloric/MatchTagAlways'
" Close tags
Plug 'alvan/vim-closetag'
" --
" json
Plug 'elzr/vim-json'
" Syntax for js libraries
Plug 'othree/javascript-libraries-syntax.vim'
" python
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
" typescript
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
" Docker
Plug 'ekalinin/Dockerfile.vim'
Plug 'kevinhui/vim-docker-tools'
" YAML
Plug 'stephpy/vim-yaml'
" Env files
Plug 'tpope/vim-dotenv'
" Flutter/Dart
Plug 'dart-lang/dart-vim-plugin'
" Vimtex
Plug 'lervag/vimtex'
" Latex conceal improvements
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
" ---
" Different other plugins

"---
" Fuzzy search
" Better navigation through project
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Align stuff better
Plug 'junegunn/vim-easy-align'
" Show registers
Plug 'https://github.com/junegunn/vim-peekaboo'
" Close brackets
Plug 'tpope/vim-surround'
" Comment schortcuts(Alternative: https://github.com/tpope/vim-commentary)
Plug 'tpope/vim-commentary'
" Rg Search(Better than grep. https://github.com/vim-scripts/grep.vim)
Plug 'jremmen/vim-ripgrep'
" Automatic closing quotes
Plug 'Raimondi/delimitMate'
" highlighted yank
Plug 'machakann/vim-highlightedyank'
" select text, then press * or # to search for it
Plug 'bronson/vim-visual-star-search'
" Indent the lines better
Plug 'Yggdroot/indentLine'
" Fancy starter page
Plug 'mhinz/vim-startify'
" Autosave toggle with :AutoSaveToggle
Plug 'vim-scripts/vim-auto-save'
" Show whitespace
Plug 'ntpeters/vim-better-whitespace'
" Fix capitalized commands
Plug 'takac/vim-commandcaps'
" Auto pair braces
Plug 'jiangmiao/auto-pairs'
" Terminal
Plug 'vimlab/split-term.vim'
" Alternative terminal using tmux
Plug 'benmills/vimux'
" Bullets
Plug 'dkarter/bullets.vim'
" Grammer check
Plug 'rhysd/vim-grammarous'
Plug 'vim-scripts/LanguageTool'
Plug 'reedes/vim-lexical'
" ctags
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
" Nerdtree
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Nerdtree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
" Formatter
Plug 'Chiel92/vim-autoformat'
"---

" Initialize plugin system
call plug#end()

" Source External configuration
source ~/.vim/plugin-config.vimrc
source ~/.vim/plugin-keys.vimrc
source ~/.vim/keys.vimrc
source ~/.vim/styles.vimrc
source ~/.vim/config.vimrc
