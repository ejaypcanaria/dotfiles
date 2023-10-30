set nocompatible                " choose no compatibility with legacy vi
set number
set encoding=utf-8
set showcmd                     " display incomplete commands
set noswapfile
set cursorline

let g:ctrlp_custom_ignore = 'node_modules\|tmp\|DS_Store\|git'

filetype off                    " required
filetype plugin indent on       " load file type plugins + indentation

" Disable auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"" Whitespace
"set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,start,eol  " backspace through everything in insert mode
autocmd BufWritePre <buffer> :%s/\s\+$//e   " remove trailing whitespaces

set colorcolumn=120
highlight ColorColumn ctermbg=DarkGray

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set omnifunc=csscomplete#CompleteCSS

"" Mappings

nnoremap <silent> <Leader>= :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize -10"<CR>
nnoremap <silent> <Leader>fr o# frozen_string_literal: true<ESC>

" Enter key to add new line without entering insert mode
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>

" ========================= VUNDLE Stuffs ========================= "

" Keep Plugin commands between vundle#begin/end.
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rake'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'kwaledesign/scss-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nono/vim-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rstacruz/sparkup'
Plugin 'dsawardekar/ember.vim'
Plugin 'dsawardekar/portkey'
Plugin 'skalnik/vim-vroom'
Plugin 'isRuslan/vim-es6'
Plugin 'jremmen/vim-ripgrep'
Plugin 'dyng/ctrlsf.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plugin 'junegunn/fzf.vim'
Plugin 'slim-template/vim-slim.git'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
call vundle#end()

" ====================== END VUNDLE ============================== "

"Map Pane Switcher
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Copy to system clipboard
"if $TMUX == ''
set clipboard=unnamed
"endif

vnoremap <Leader>ps :w !tmux-pipe-to-next-pane<CR>

set rtp+=/usr/local/opt/fzf

"Always show Vim Airline
set laststatus=2

"" NERD Tree Config
map <C-t> :NERDTreeToggle<CR>
map <C-T> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd BufEnter * lcd %:p:h

" FZF Config
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'GFiles' s:find_git_root()

map <C-p> :ProjectFiles<CR>
let g:fzf_layout = { 'down': '~20%' }

filetype off
filetype on

syntax enable

" CtrlSF Mappings
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" FZF Config
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'GFiles' s:find_git_root()
map <C-p> :ProjectFiles<CR>
let g:fzf_layout = { 'down': '~20%' }

"" Railscasts Theme Settings
set background=dark
colorscheme base16-railscasts

highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1
"" End Railscasts Theme Settings
