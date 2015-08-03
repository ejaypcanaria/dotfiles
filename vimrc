set nocompatible                " choose no compatibility with legacy vi
set number
set encoding=utf-8
set showcmd                     " display incomplete commands
set noswapfile
set cursorline

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
Plugin 'kien/ctrlp.vim'
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
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rstacruz/sparkup'
Plugin 'dsawardekar/ember.vim'
Plugin 'dsawardekar/portkey'
Plugin 'skalnik/vim-vroom'
Plugin 'isRuslan/vim-es6'
call vundle#end()

" ====================== END VUNDLE ============================== "

"Map Pane Switcher
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Copy to system clipboard
set clipboard+=unnamed

"Always show Vim Airline
set laststatus=2

"" NERD Tree Config
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd BufEnter * lcd %:p:h

filetype off
filetype on

syntax enable

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
