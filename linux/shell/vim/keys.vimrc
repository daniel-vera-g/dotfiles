""" Abbreviations & Custom keys

" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Commands
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" Spell
noremap <leader>snp :set nospell<CR>
noremap <leader>sp :set spell<CR>

"" Functions
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

""" Autocmd Rules
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

" make/cmake
augroup vimrc-make-cmakej
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"" Mappings

" leader + s to save
noremap <Leader>s :update<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gaa :Gwrite<CR>:Gcommit<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
" noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Buffer nav
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
"" Close buffer
noremap <leader>c :bd<CR>
noremap <leader>cf :bd!<CR>

" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>
nnoremap <F3> :set hlsearch!<CR>

"" More natural vim spliting
" Use ctrl-[hjkl] to select the active split!
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

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" Error checking and linting
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

noremap <leader>lo :lopen<CR>
noremap <leader>lc :lclose<CR>

"-----
""" Plugin specific mappings

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <Leader>h :History<CR>

" NERDTree
nnoremap <silent> <F2> :NERDTreeFind<CR>
" Schortcut for NERDTree toggle
map <C-n> :NERDTreeToggle<CR>
" Fix Inconsistent buffer width when deleting a buffer
nnoremap <leader>cb :bp<cr>:bd #<cr>

" Sideways
nnoremap <a-h> :SidewaysLeft<cr>
nnoremap <a-l> :SidewaysRight<cr>

" vim-autoformat
noremap <F4> :Autoformat<CR>

"" snippets
" Open UltiSnips edit function
nmap <leader>ue :UltiSnipsEdit<cr>

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"" Vimux
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Goyo
autocmd! User GoyoEnter Limelight

" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

" Open terminal
nnoremap <leader>tr :10Term<CR>
" Build in terminal
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>it :terminal<CR>

" ctags
" TODO ctags
" nmap <F8> :TagbarToggle<CR>

" Fuzzy search tags
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>

" vimtex and latex conf
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
