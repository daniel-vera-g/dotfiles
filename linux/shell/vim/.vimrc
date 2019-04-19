" ---------------------Editor custom Settings---------------------

"More natural vim spliting
"Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" CTRL-Tab is next tab
noremap <C-Tab> :<C-U>tabnext<CR>
inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
cnoremap <C-Tab> <C-C>:tabnext<CR>
" CTRL-SHIFT-Tab is previous tab
noremap <C-S-Tab> :<C-U>tabprevious<CR>
inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
cnoremap <C-S-Tab> <C-C>:tabprevious<CR>

"Position of the split panes
set splitbelow
set splitright
"Source: https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally#easier-split-navigations

"Set better leader
let mapleader = ","

" + s to save
noremap s :update

"Searching settings
set incsearch
set hlsearch

"Autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"Cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

"-------------Vim plug -------------

"Specify a directory for plugins
"- For Neovim: ~/.local/share/nvim/plugged
"- Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

"----- General plugins ----

"Plug outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

"https://github.com/vim-syntastic/syntastic
Plug 'vim-syntastic/syntastic'

"Autocomplete
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

"Color Theme 3
Plug 'liuchengxu/space-vim-theme'

"Initialize plugin system
call plug#end()

"-------------Color Theme customization-------------

"Setting dark mode
set background=dark 

" Colorsheme
syntax enable
colorscheme gruvbox

set number
highlight LineNr ctermfg=red
