" Plugin specific configs

" ---
" Ultisnips
" Snippets engine
let g:go_snippet_engine = "ultisnips"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-s>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetsDir = "~/.vim/plugged/ultisnips/UltiSnips"
let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit="~/.vim/plugged/ultisnips/UltiSnips"

" ---

" highlighted-yank plugin
let g:highlightedyank_highlight_duration = 250

" ---
" fzf.vim
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
" let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
let $FZF_DEFAULT_COMMAND =  "fd --hidden -E .git"
" ---

" Bullets
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'md'
			\]

" ---
" Markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
" ---

" ---
" Nerdtree
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeWinPos = "right"
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Show hidden files
let NERDTreeShowHidden=1
" Close Nerdtree when opening a file
let NERDTreeQuitOnOpen = 1
" Close Nerdtree if it's the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open nerd tree when opening folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" ---

" ---
" Autosave
let g:auto_save = 0  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
" ---

" ---
" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#ignore_bufadd_pat =
  \ 'gundo|undotree|vimfiler|tagbar|nerd_tree|startify|!'
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
" Statusline + Airline
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif
" ---

" ---
" coc.nvim

" coc extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-prettier', 'coc-eslint', 'coc-snippets', 'coc-json', 'coc-yank', 'coc-go', 'coc-markdownlint', 'coc-vimtex']
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
" set cmdheight=2 -> Fix for big command bar
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c

" TODO this does not work. Probably due to relative numbers or so.
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
" set signcolumn=number
" else
" set signcolumn=yes
" endif
set signcolumn=yes
" ---

" ---
" Terminal configs
set splitbelow
" ---

" ---
" Commentary
" Use right comments markdown(neovim related?: https://github.com/tpope/vim-commentary/issues/90)
autocmd FileType markdown setlocal commentstring=<!--\ %s\ -->
" ---

" ---
" Set js syntax for ts as it works better
" au BufReadPost *.ts set syntax=javascript
" ---

" ---
" Markdown preview
let g:instant_markdown_autostart = 0
" ---

" ---
"  Golang config
" go-vim plugin specific commands
" Also run `goimports` on your current file on every save
" Might be be slow on large codebases, if so, just comment it out
let g:go_fmt_command = "goimports"

" Status line types/signatures.
let g:go_auto_type_info = 1
" ---

" ---
"  Focused work
let g:goyo_linenr=1
let g:goyo_height='95%'
let g:goyo_width='120px'
autocmd! User GoyoEnter Limelight!
" ---

" ---
"  Misc
let g:asyncrun_open = 6
"  ---
