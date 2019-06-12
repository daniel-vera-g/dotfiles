" ----------------------------------------------------------
" --------------------- Plug ---------------------
" ----------------------------------------------------------

"Specify a directory for plugins
"- For Neovim: ~/.local/share/nvim/plugged
"- Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

"++++++++++
" Nerdtree
"++++++++++
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Nerdtree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

"++++++++++
" Comment schortcuts(Alternative: https://github.com/tpope/vim-commentary)
"++++++++++
Plug 'scrooloose/nerdcommenter'

"++++++++++
" Git
"++++++++++
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

"++++++++++
" Airline Theme
"++++++++++
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"++++++++++
" Rg Search(Better than grep. https://github.com/vim-scripts/grep.vim)
"++++++++++
Plug 'jremmen/vim-ripgrep'

"++++++++++
" Other
"++++++++++
" Colorscheme
Plug 'vim-scripts/CSApprox'
" Closing quotes
Plug 'Raimondi/delimitMate'

" TODO
" Plug 'majutsushi/tagbar'

" Ale for syntastic(Syntax checking through LSP)
Plug 'w0rp/ale'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
" Language packs
Plug 'sheerun/vim-polyglot'

" Async tasks in vim
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

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
" Better navigation through project
Plug 'ctrlpvim/ctrlp.vim'
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
" Markdown
Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
" Bullets
Plug 'dkarter/bullets.vim'
" Vimtex
Plug 'lervag/vimtex'
" Latex conceal improvements
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
" Colour Themes
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-theme'
Plug 'drewtempelmeyer/palenight.vim'
" Nice icons
Plug 'ryanoasis/vim-devicons'

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

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" go
"" Go Lang Bundle
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'neoclide/coc.nvim', {'do': 'npm install --frozen-lockfile'}

" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'

" python
"" Python Bundle
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" typescript
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

" Flutter/Dart
Plug 'dart-lang/dart-vim-plugin'

" Initialize plugin system
call plug#end()

" Source External configuration
source ~/.vim/general.vimrc
source ~/.vim/keys.vimrc
source ~/.vim/styles.vimrc
