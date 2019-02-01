" ---------------------Editor custom Settings---------------------
set number
set paste

"Autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
    
"For TMUX color display
 if exists('$TMUX')
   set term=screen-256color
 endif

"Cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

"-------------Vim plug -------------

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

"On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"Plug outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"----- markdown ----

"https://www.swamphogg.com/2015/vim-setup/
"https://news.ycombinator.com/item?id=10271028

"https://github.com/plasticboy/vim-markdown
Plug 'plasticboy/vim-markdown'

"https://github.com/dkarter/bullets.vim
Plug 'dkarter/bullets.vim'

"https://github.com/junegunn/goyo.vim
Plug 'junegunn/goyo.vim'

"https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

"https://github.com/vim-syntastic/syntastic
Plug 'vim-syntastic/syntastic'

"Autocomplete
"https://github.com/ajh17/VimCompletesMe
Plug 'ajh17/VimCompletesMe'

"markdown config
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 1
let g:bullets_enabled_file_types = ['markdown', 'text', 'gitcommit']

"----- Color Themes ----

"Color Theme 1 
"https://github.com/morhetz/gruvbox/wiki/Terminal-specific
Plug 'morhetz/gruvbox'

"Color Theme 2
Plug 'altercation/vim-colors-solarized'

"Color Theme 3
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Initialize plugin system
call plug#end()

"-------------Color Theme customization-------------

" Colorsheme
syntax enable
colorscheme gruvbox

"Setting dark mode
set background=dark 

"----- syntastic config --

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

