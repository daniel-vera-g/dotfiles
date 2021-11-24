" TODO use when using plain neovim with vim config
" Currently migrating to lunarvim
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" Use "hybrid" (both absolute and relative) line numbers
set number relativenumber

" Use the system clipboard
set clipboard=unnamedplus

" Better escape
imap jk <Esc>

let mapleader = ","
nnoremap <leader>w :update<cr>
