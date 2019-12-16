" Fix Vimtex starting error
filetype plugin indent on
syntax on

"" Plugins & loading of custom configuration
"Specify a directory for plugins
"- For Neovim: ~/.local/share/nvim/plugged
"- Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

"" ctags
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

"-----

"" Nerdtree
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Nerdtree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

"-----

"" Comment schortcuts(Alternative: https://github.com/tpope/vim-commentary)
Plug 'scrooloose/nerdcommenter'

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

"-----

"" Essential programming tools(Syntax check, Language server & Auto completion)

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

"-----

"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"-----

"" Colour Themes
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-theme'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-scripts/CSApprox'
" Airline Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Nice icons
Plug 'ryanoasis/vim-devicons'

"-----

"" Language specific plugins

"" Markdown
Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

"" go
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'fvictorio/vim-extract-variable'
"POLYGOT HERE TO FIX VIM-GO BUG
Plug 'sheerun/vim-polyglot'

"" html
" html Syntax highlighting
Plug 'othree/html5-syntax.vim'
" html5 autocomplete
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'
" Match tags
Plug 'valloric/MatchTagAlways'
" Close tags
Plug 'alvan/vim-closetag'

"" javascript
" Jump between CommonJS modules
Plug 'moll/vim-node'
" Basic refactoring
Plug 'ternjs/tern_for_vim', { 'do': 'npm install'  }
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern'  }
Plug 'carlitux/deoplete-ternjs',
Plug 'elzr/vim-json'
Plug 'othree/jsdoc-syntax.vim'
" Generate JSdoc
Plug 'heavenshell/vim-jsdoc'
" Syntax for js libraries
Plug 'othree/javascript-libraries-syntax.vim'
" Function parameter completion
Plug 'othree/jspc.vim'

"" python
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

"" typescript
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

"" Docker
Plug 'ekalinin/Dockerfile.vim'
Plug 'kevinhui/vim-docker-tools'

" YAML
Plug 'stephpy/vim-yaml'

" Env files
Plug 'tpope/vim-dotenv'

"" Flutter/Dart
Plug 'dart-lang/dart-vim-plugin'

"-----

""Different other plugins
"" Fuzzy search
" Better navigation through project
" Only use FZF
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Rg Search(Better than grep. https://github.com/vim-scripts/grep.vim)
Plug 'jremmen/vim-ripgrep'
" Closing quotes
Plug 'Raimondi/delimitMate'
" Indent the lines better
Plug 'Yggdroot/indentLine'
"" Language packs
"Fancy starter page
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
" Show buffers on the top
" Plug 'bagrat/vim-buffet'
" Terminal
Plug 'vimlab/split-term.vim'
" Alternative terminal
Plug 'benmills/vimux'
" Grammer check
" Plug 'rhysd/vim-grammarous'
Plug 'vim-scripts/LanguageTool'
Plug 'reedes/vim-lexical'
" Formatter
Plug 'Chiel92/vim-autoformat'
" Bullets
Plug 'dkarter/bullets.vim'
" Vimtex
Plug 'lervag/vimtex'
" TODO
" Latex conceal improvements
" Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

" Initialize plugin system
call plug#end()

" Source External configuration
source ~/.vim/general.vimrc
source ~/.vim/keys.vimrc
source ~/.vim/styles.vimrc
