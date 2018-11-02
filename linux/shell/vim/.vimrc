"Editor custom settings

set number
set paste

"Italics
let g:gruvbox_italic=1
" --- Vim plug --- " 

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Specify a directory for plugins
"- For Neovim: ~/.local/share/nvim/plugged
"- Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"Make sure you use single quotes

"Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

"Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

"Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

"On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

"Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

"Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

"Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

"Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" --- markdown --- "

"https://www.swamphogg.com/2015/vim-setup/
"https://news.ycombinator.com/item?id=10271028


"https://github.com/gabrielelana/vim-markdown
"Plug 'gabrielelana/vim-markdown'

"https://github.com/junegunn/goyo.vim
Plug 'junegunn/goyo.vim'

"Color Theme 1 
"https://github.com/morhetz/gruvbox/wiki/Terminal-specific
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

"Color Theme
colorscheme gruvbox
set background=dark " Setting dark mode
