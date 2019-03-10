" ---------------------Editor custom Settings---------------------

"More natural vim spliting
"Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"Position of the split panes
set splitbelow
set splitright
"Source: https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally#easier-split-navigations

"Own customisations
"Set line number
set number
" Paste with F2
set pastetoggle=<F2>
"<Leader> + s to save
noremap <Leader>s :update<CR>

"Searching settings
set incsearch
set hlsearch

"Indentation
set cindent

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

"----- General plugins ----

" Nerdtree TODO
"On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Nerdtree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
"Schortcut for NERDTree toggle
map <C-n> :NERDTreeToggle<CR>
"Open nerd tree when opening folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"Plug outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

"https://github.com/vim-syntastic/syntastic
Plug 'vim-syntastic/syntastic'

"Autocomplete
"Plug 'ajh17/VimCompletesMe' or muo-completesme
Plug 'Valloric/YouCompleteMe'

"Autocomplete on tab
"https://news.ycombinator.com/item?id=13960147
"https://medium.com/@sszreter/vim-tab-autocomplete-in-insert-mode-and-fuzzy-search-for-opening-files-484260f52618
"https://vim.fandom.com/wiki/Autocomplete_with_TAB_when_typing_words
 function! InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
      else
        return "\<c-p>"
      endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" Execute tmux commands in vim
Plug 'benmills/vimux'
"Set better leader
let mapleader = ","
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

"----- git ----

" Show changes in vim gutter(https://github.com/airblade/vim-gitgutter)
Plug 'airblade/vim-gitgutter'

" Vim wrapper
" https://github.com/tpope/vim-fugitive
" http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/
" https://blog.kitware.com/fugitive-a-git-plugin-for-vim/Additional 
Plug 'tpope/vim-fugitive'

"----- markdown & latex----

"https://www.swamphogg.com/2015/vim-setup/
"https://news.ycombinator.com/item?id=10271028

"https://github.com/vim-pandoc/vim-pandoc
Plug 'vim-pandoc/vim-pandoc'

"https://github.com/vim-pandoc/vim-pandoc-syntax
Plug 'vim-pandoc/vim-pandoc-syntax'
set nofoldenable    " disable folding

"https://github.com/gabrielelana/vim-markdown
"Plug 'gabrielelana/vim-markdown'

"https://github.com/plasticboy/vim-markdown
"Plug 'plasticboy/vim-markdown'

"https://github.com/dkarter/bullets.vim
Plug 'dkarter/bullets.vim'

" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'md'
    \]

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
