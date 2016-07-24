set nocompatible        " Vim only options, not vi compatible
set smarttab          " Use tabs for indentation and spaces otherwise
set tabstop=2
set expandtab						" Expand into spaces
set shiftwidth=2				" Changes number of spaces inserted for indents
set showmatch 					"	Show matching brackets
set autoindent          " Vim handles indentation for you
set smartindent         " I have had mixed results.  It should intelligently indent for you
set ruler               " Info displayed at bottom
set cursorline					" Highlight current line
set number							" Set line numbers
set incsearch           " Search while typing instead of after
set hls                 " Hilight search hits
set history=700         " Command history
set clipboard+=unnamed  " Yanks go on clipboard instead.
set mat=5 							" Bracket blinking
set scrolloff=5					" Keep 5 lines while scrolling
colorscheme desert
set wildmenu						" Show files in dir for tab complete
set nobackup            " Get rid of backup files, we'll do it live!
set noswapfile
set nowritebackup
set nowrap              " This should help me to make a newline when I should :)
set ttyfast 						" Allow smoother changes


set laststatus=2				" Show last status
set cmdheight=2 				" The commandbar height
set ignorecase 					" Ignore case when searching
set smartcase           " No case set then search up + low, else lock case
filetype plugin on      " Enable plugins based on the filetype
filetype indent on      " Enable filetype indenting
syntax on 					" Enable syntax highlighting
:command W w
:command Bc Bclose

" Nerd Tree
" ctrl+ww flips back and forth between nerdtree and editor
" ctrl+e toggles nerdtree
nmap <silent> <C-E> :NERDTreeToggle<CR>

"nmap <silent> <C-tab> :NERDTreeToggle<CR>

"Map f2 and f3 for quick cycle through buffers
map <F2> :bprevious<CR>
map <F3> :bnext<CR>

" Map \d to next buffer then delete previous buffer
nmap <leader>d :bprevious<CR>:bdelete #<CR>

"Show hidden files by default
let g:NERDTreeShowHidden=1

" Enable wildmenu
set wildmode=list:longest,list:full
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.ds_store,*.db,.git,*.rbc,*.class,.svn

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

"----------------------------------------------------------------------------
" Set Custom Filetypes
"----------------------------------------------------------------------------

au BufNewFile,BufRead {Vagrantfile,Gemfile,Rakefile,config.ru} set filetype=ruby

" Close ruby method defs
au BufRead,BufNewFile *.rb :iab def 
\def
\<CR>end<Up>

" Retain selection after increasing/decreasing indent
vmap > >gv
vmap < <gv

" Restore cursor position
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " Strip trailing whitespace on save
  autocmd FileType python,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e
  autocmd BufWritePre *.yml,*.erb,*.md,*.haml,*.scss,*.js :%s/\s\+$//e
endif

"Fixes some syntax coloring problems.
"Pulled it from here: http://vim.wikia.com/wiki/Using_vim_color_schemes_with_Putty
if &term =~ "xterm"
  " 256 colors
  let &t_Co = 256
  " restore screen after quitting
  let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
  let &t_te = "\<Esc>[?47l\<Esc>8"
  if has("terminfo")
    let &t_Sf = "\<Esc>[3%p1%dm"
    let &t_Sb = "\<Esc>[4%p1%dm"
  else
    let &t_Sf = "\<Esc>[3%dm"
    let &t_Sb = "\<Esc>[4%dm"
  endif
endif
