" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load plugins here (pathogen or vundle)
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'jiangmiao/auto-pairs'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'elixir-lang/vim-elixir'
Plugin 'ElmCast/elm-vim'
Plugin 'pangloss/vim-javascript'
Bundle 'vim-ruby/vim-ruby'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'fatih/vim-go'
call vundle#end()

" Elm
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}
let g:elm_format_autosave = 1

" Ultisnips config
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>
"  close vim if only nerd tree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound

" Search for visually hightlighted text
vnoremap <c-f> y<ESC>/<c-r>"<CR>

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Escaping
inoremap jj <esc>

" New line
nmap <C-o> O<Esc>j

" Saving
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

" Find and replace
nnoremap <leader>r :%s/\<<C-r><C-w>\>/

" Strip whitespace on save
autocmd FileType elixir autocmd BufEnter <buffer> EnableStripWhitespaceOnSave

hi Search cterm=NONE ctermfg=grey ctermbg=blue

" Go shortcuts
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>x <Plug>(go-alternate-split)
au FileType go nmap <leader>v <Plug>(go-alternate-vertical)
