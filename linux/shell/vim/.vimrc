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
" Language specific plugins:

" Syntax & co for all languages
"  Polygplot when using custom language packs
let g:polyglot_disabled = ['typescript']
Plug 'sheerun/vim-polyglot'

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
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
" --

" WIP to get Foam alternative working.
" See:
" https://github.com/vimwiki/vimwiki/issues/892
" https://github.com/ericboehs/dotfiles/blob/b47547f757fc31ed5f4241874982541ba7d6cf0a/.vim/minpac.vim
" https://github.com/vimwiki/vimwiki
" Plug 'vimwiki/vimwiki', {'branch': 'dev'}
" let g:vimwiki_list = [
"       \{
"       \ 'index': 'inbox/inbox',
"       \ 'syntax': 'markdown',
"       \ 'ext': '.md' },
"       \]
" let g:vimwiki_global_ext = 0
" autocmd VimEnter * let g:vimwiki_syntaxlocal_vars['markdown']['Link1'] = g:vimwiki_syntaxlocal_vars['default']['Link1']

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
Plug 'https://github.com/junegunn/vim-peekaboo'
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

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
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
