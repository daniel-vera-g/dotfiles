" Fix Vimtex starting error
filetype plugin indent on
syntax on

"" Plugins & loading of custom configuration
"Specify a directory for plugins
"- For Neovim: ~/.local/share/nvim/plugged
"- Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

"-----

"" Nerdtree
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Nerdtree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

"-----

"" Comment schortcuts(Alternative: https://github.com/tpope/vim-commentary)
Plug 'tpope/vim-commentary'

"-----

"" Languages Server(LSP)
" TODO fix deoplete/coc compatibility(See old vimrc config)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

"-----

"" Git
" Show changes in vim gutter
Plug 'airblade/vim-gitgutter'
" Vim wrapper
Plug 'tpope/vim-fugitive'
" To open files in gitlab
Plug 'shumphrey/fugitive-gitlab.vim'
" To open files in github
Plug 'tpope/vim-rhubarb'

"" Snippets
" TODO use actively
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"" Colour Themes
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-theme'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-scripts/CSApprox'
" Airline Theme(Status bar)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Nice icons
Plug 'ryanoasis/vim-devicons'

"-----

"" Language specific plugins

"" Markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" Focus work session
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

" Syntax & co for all languages
Plug 'sheerun/vim-polyglot'

"" html
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
" Match tags
Plug 'valloric/MatchTagAlways'
" Close tags
Plug 'alvan/vim-closetag'

Plug 'elzr/vim-json'
" Syntax for js libraries
Plug 'othree/javascript-libraries-syntax.vim'

"" Docker
Plug 'ekalinin/Dockerfile.vim'
Plug 'kevinhui/vim-docker-tools'

" YAML
Plug 'stephpy/vim-yaml'

" Env files
Plug 'tpope/vim-dotenv'

"" Flutter/Dart
" TODO learn
Plug 'dart-lang/dart-vim-plugin'

"-----

"" Different other plugins
"" Fuzzy search
" Better navigation through project
" Only use FZF
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Rg Search(Better than grep. https://github.com/vim-scripts/grep.vim)
Plug 'jremmen/vim-ripgrep'
" Automatic closing quotes
Plug 'Raimondi/delimitMate'
" Indent the lines better
Plug 'Yggdroot/indentLine'
" Fancy starter page
Plug 'mhinz/vim-startify'
" Autosave toggle with :AutoSaveToggle
Plug 'vim-scripts/vim-auto-save'
" Close brackets
Plug 'tpope/vim-surround'
" Show whitespace
Plug 'ntpeters/vim-better-whitespace'
" Fix capitalized commands
Plug 'takac/vim-commandcaps'
" Align stuff better
Plug 'junegunn/vim-easy-align'
" Auto pair braces
Plug 'jiangmiao/auto-pairs'
" Show registers
Plug 'https://github.com/junegunn/vim-peekaboo'
" Terminal
" TODO learn
Plug 'vimlab/split-term.vim'
" Alternative terminal using tmux
Plug 'benmills/vimux'

" Bullets
Plug 'dkarter/bullets.vim'
" Vimtex
Plug 'lervag/vimtex'

" Initialize plugin system
call plug#end()

" Source External configuration
source ~/.vim/config.vimrc
source ~/.vim/plugin-config.vimrc
source ~/.vim/keys.vimrc
source ~/.vim/plugin-keys.vimrc
source ~/.vim/keys.vimrc
source ~/.vim/styles.vimrc
