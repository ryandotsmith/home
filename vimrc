scriptencoding utf-8

"-------------------------------
" Colors & Font
"-------------------------------
set t_Co=256
set nocompatible
syntax enable
colorscheme simplecolor

"-------------------------------
" Mappings
"-------------------------------
let mapleader = ","
imap ii <Esc>
imap <C-l> <Space>=><Space>

"-------------------------------
" Text Formatting
"-------------------------------
set autoindent
set softtabstop=2
set shiftwidth=2
set tabstop=4
set expandtab
set nowrap

"-------------------------------
" General
"-------------------------------
set nocp
filetype plugin on
set visualbell
set incsearch                       " show the `best match so far' as search strings are typed
set hlsearch                        " Highlight search results once found:
set showmatch                       " flashes matching brackets or parentheses
set directory=/tmp/                 " Set temporary directory (don't litter local dir with swp/tmp files)
set scrolloff=3                     " When scrolling off-screen do so 3 lines at a time, not 1
set wildmenu                        " Enable tab complete for commands.
set wildmode=list:longest,list:full " first tab shows all matches. next tab starts cycling through the matches
set list listchars=tab:»·,trail:·   " Display extra whitespace
set title                           " enable setting title
set backspace=indent,eol,start      " Make backspace work in insert mode
autocmd BufWritePre * :%s/\s\+$//e  " kill whitespace on save

" ---------------------------------------------------------------------------
" File Types
" ---------------------------------------------------------------------------
au BufRead,BufNewFile Gemfile      set ft=ruby
au BufRead,BufNewFile *.ru         set ft=ruby
au BufRead,BufNewFile *.rtxt       set ft=html spell
au BufRead,BufNewFile *.sql        set ft=pgsql
au BufRead,BufNewFile *.haml       set ft=haml
au BufRead,BufNewFile *.md         set ft=mkd ts=2 sw=2 wrap
au BufRead,BufNewFile *.markdown   set ft=mkd ts=2 sw=2 spell
au BufReadPre,BufNewFile *.go      set ft=go noet nolist ts=4 sw=4 fileencoding=utf-8 fileencodings=utf-8
au Filetype gitcommit set spell
au Filetype ruby      set ts=2 sw=2 expandtab
