colorscheme nord

" font
if has("gui_macvim")
    " set macvim specific stuff
    set macligatures
endif

set guifont=Fira\ Code:h15

" add ruler
set ruler

" Enable syntax hilighting
syntax enable

" Tabs
set softtabstop=4
set expandtab
set shiftwidth=4

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" list plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/goyo.vim'

" Initialize plugin system
call plug#end()

" File Type specific
filetype plugin on

" Visuals
set number
set relativenumber
set showcmd
set cursorline
filetype indent on

" Cmd completion
set wildmenu

" For perf
set lazyredraw

" Show matching braces
set showmatch

" Searching
set incsearch
set hlsearch
" nnoremap <leader><space> :nohlsearch<CR>

" Ctrl P
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Syntastic
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pep8']

" enable JSX highlighting in JS files
let g:jsx_ext_required = 0

" Remove trailing whitespace when saving.
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Using file extension
autocmd BufWritePre *.py,*.js,*.jsx,*.rs,*.logic :call <SID>StripTrailingWhitespaces()

" Often files are not necessarily identified by extension, if so use e.g.:
autocmd BufWritePre * if &ft =~ 'sh\|rust\|python\|javascript' | :call <SID>StripTrailingWhitespaces() | endif

" Remove scrollbars
set guioptions=

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Better defaults when splitting
set splitbelow
set splitright

" Change cursor shape between insert and normal mode in iTerm2.app
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Backspace
set backspace=indent,eol,start

" Powerline
" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup
" Keep it there all the time
set laststatus=2
