" Plugin specific configs

"Snippets engine
let g:go_snippet_engine = "ultisnips"

" ---
" Markdown Config
" Sources:
" https://jdhao.github.io/2019/01/15/markdown_edit_preview_nvim/
" https://www.swamphogg.com/2015/vim-setup/
" https://news.ycombinator.com/item?id=10271028
" disable header folding
let g:vim_markdown_folding_disabled = 1
" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0
" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format
set nofoldenable    " disable folding
" Remove conceal feature for pandoc markdown
let g:pandoc#syntax#conceal#use = 0
" ---

" ---
" Ultisnips
" vertically split ultisnips edit window
let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-s>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetsDir = "~/.vim/plugged/ultisnips/UltiSnips"
" ---

" HIGHLIGHTEDYANK PLUGIN
let g:highlightedyank_highlight_duration = 250

" ---
" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
" ---

" Bullets
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'md'
			\]

" ---
" Vimtex
" Fix conceal conflict with identline plugin(https://tex.stackexchange.com/questions/252218/strange-vim-latex-behaviour)
autocmd BufNewFile,BufRead *.tex IndentLinesDisable
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" Vimtex TOC settings
let g:vimtex_toc_config = {
      \ 'name' : 'TOC',
      \ 'layers' : ['content', 'todo', 'include'],
      \ 'resize' : 1,
      \ 'split_width' : 50,
      \ 'todo_sorted' : 0,
      \ 'show_help' : 1,
      \ 'show_numbers' : 1,
      \ 'mode' : 2,
      \}
" ---

" ---
" Nerdtree
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
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

" Autosave
let g:auto_save = 1  " enable AutoSave on Vim startup

" ---
" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
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
" coc.nvim default settings
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
" set cmdheight=2 -> Fix for big command bar
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" ---

" ---
" Ale
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
" Ale fix
let g:ale_fix_on_save = 0
"
" \   'javascript': ['prettier', 'eslint'],
let g:ale_linters = {
 \   'latex': ['lacheck', 'chktex', 'Proselint'],
 \   'javascript': ['standard']
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'standard'],
\   'css': ['prettier'],
\   'latex': ['lacheck', 'chktex', 'Proselint'],
\}
" ---

" ---
" TODO as collides with coc nvim
" Deoplete
" This is new style
" call deoplete#custom#var('omni', 'input_patterns', {
"       \ 'tex': g:vimtex#re#deoplete
"       \})
" ---

" javascript
let g:javascript_enable_domhtmlcss = 1
let g:javascript_plugin_flow = 1

" ---
" Golang
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
" Colors
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
" Highlight same variables
let g:go_auto_sameids = 0
" Auto import dependencies
let g:go_fmt_command = "goimports"
" Show types
let g:go_auto_type_info = 1
" Better json handline
let g:go_addtags_transform = "snakecase"
" ---
