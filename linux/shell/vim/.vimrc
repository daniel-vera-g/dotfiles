"" Plugins & loading of custom configuration
" TODO ctags in general tags
" Plug 'majutsushi/tagbar'

"Specify a directory for plugins
"- For Neovim: ~/.local/share/nvim/plugged
"- Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

"" Nerdtree
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Nerdtree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

"" Comment schortcuts(Alternative: https://github.com/tpope/vim-commentary)
Plug 'scrooloose/nerdcommenter'

"" Git
" Show changes in vim gutter
Plug 'airblade/vim-gitgutter'
" Vim wrapper
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

"" Essential programming(Syntax check, Language server & Autocompletion)
" Ale for syntastic(Syntax checking through LSP)
Plug 'w0rp/ale'
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

" Async tasks in vim
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}
" Run asynchronous shell commands
Plug 'skywind3000/asyncrun.vim'

"" Other
" Closing quotes
Plug 'Raimondi/delimitMate'
" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Better navigation through project
" Only use FZF
" Plug 'ctrlpvim/ctrlp.vim'
" Rg Search(Better than grep. https://github.com/vim-scripts/grep.vim)
Plug 'jremmen/vim-ripgrep'
Plug 'Yggdroot/indentLine'
" Language packs
Plug 'sheerun/vim-polyglot'
"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Fancy starter page
Plug 'mhinz/vim-startify'
" Autosave toggle with :AutoSaveToggle
Plug 'vim-scripts/vim-auto-save'
" Close brackets
Plug 'tpope/vim-surround'
" Extend text object
Plug 'wellle/targets.vim'
" Change position of words
Plug 'AndrewRadev/sideways.vim'
" Show whitespace
Plug 'ntpeters/vim-better-whitespace'
" Fix capitalized commands
Plug 'takac/vim-commandcaps'
" Faster code navigation
Plug 'justinmk/vim-sneak'
" Enhance buffer experience
Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-easy-align'
" Auto pair braces
Plug 'jiangmiao/auto-pairs'
" Show registers
Plug 'https://github.com/junegunn/vim-peekaboo'
" Show buffers on the top
Plug 'bagrat/vim-buffet'
" Terminal
Plug 'vimlab/split-term.vim'
" Alternative terminal
Plug 'kassio/neoterm'
Plug 'benmills/vimux'
" Formatter
Plug 'Chiel92/vim-autoformat'
" Bullets
Plug 'dkarter/bullets.vim'
" Vimtex
Plug 'lervag/vimtex'
" Latex conceal improvements
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

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

"" Markdown
Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

"" go
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

"" html
" html Syntax highlighting
Plug 'othree/html5-syntax.vim'
" html5 autocomplete
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

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

"" Flutter/Dart
Plug 'dart-lang/dart-vim-plugin'

" Initialize plugin system
call plug#end()

" Source External configuration
source ~/.vim/general.vimrc
source ~/.vim/keys.vimrc
source ~/.vim/styles.vimrc
