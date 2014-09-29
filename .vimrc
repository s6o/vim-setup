" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"******************************************************************************
" Global options
"******************************************************************************
execute pathogen#infect()
syntax on
filetype indent plugin on

if has("gui_running")
  set background=dark
  colorscheme solarized
else
  set t_Co=256
  colorscheme xoria256
endif

set autowrite
set backspace=indent,eol,start
set completeopt=menu,longest,preview
set colorcolumn=80
set cursorline
set cursorcolumn
set expandtab
set foldcolumn=2
set foldenable
set foldlevel=0
set foldmethod=marker
set fileformats=unix,dos,mac

if has("unix")
  set guifont=Source\ Code\ Pro\ 11
else
  set guifont=Source_Code_Pro:h11
endif

set guioptions+=c
set guioptions-=T
set guioptions-=m

set history=1000
set ignorecase
set laststatus=2
set linespace=0
set matchpairs+=<:>
set nobackup
set nomousehide
set nowritebackup
set nowrap
set nohls
set number
set ruler
set scrolloff=2
set sidescrolloff=2
set smartindent
set smarttab
set shiftwidth=2
set showcmd
set splitbelow
set splitright

set statusline=
set statusline+=%-3.3n\                                   " buffer number
set statusline+=%F\                                       " filename
set statusline+=%h%m%r%w                                  " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}]              " file type
set statusline+=\ \|\ %(%{Tlist_Get_Tagname_By_Line()}%)  " taglist, active tag
set statusline+=%=                                        " right align remainder
set statusline+=0x%-3B                                    " character value hex
set statusline+=\|\ %-5b                                  " character value dec
set statusline+=%-10(%l,%c%V%)                            " line, character
set statusline+=%<%P                                      " file position

set synmaxcol=500

set tabstop=2
set title titlestring=%{getcwd()}\ \|\ %<%f\ %([%{Tlist_Get_Tagname_By_Line()}]%)

set vb

set wildmenu

"******************************************************************************
" CPP specific
"******************************************************************************
au BufRead,BufNewFile *.cpp set foldmarker={,} foldmethod=marker
au BufRead,BufNewFile *.hpp set foldmarker={,} foldmethod=marker

"******************************************************************************
" Use tabs for these types of files 
"******************************************************************************
"au BufRead,BufNewFile *.css set noexpandtab shiftwidth=4 tabstop=4 nosmartindent smarttab

"******************************************************************************
" Code complete
"******************************************************************************
"autocmd FileType python set noexpandtab shiftwidth=4 tabstop=4 nosmartindent smarttab
autocmd FileType javascript set omnifunc=javascriptcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"******************************************************************************
" PHP syntax check, tags settings, folding
"******************************************************************************
let tlist_php_settings = 'php;c:class;d:constant;f:function'
au BufRead,BufNewFile *.php set makeprg=/usr/local/php5/bin/php\ -l\ %
au BufRead,BufNewFile *.php set errorformat=%m\ in\ %f\ on\ line\ %l
au BufRead,BufNewFile *.php set foldmarker={,} foldmethod=marker
au BufNewFile,BufRead *.sql set filetype=pgsql

"******************************************************************************
" xml specific
"******************************************************************************
let g:xml_syntax_folding = 1
au FileType xml setlocal foldmethod=syntax

"******************************************************************************
" Plugin customizations
"******************************************************************************

"~~~~ bufexplorer.vim ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
let g:bufExplorerShowRelativePath=1  " Show absolute paths.
let g:bufExplorerSortBy='fullpath'  " Sort by the buffer's name.
let g:bufExplorerSplitBelow=1        " Split new window below current.
let g:bufExplorerSplitRight=1        " Split right.
let g:bufExplorerSplitOutPathName=0  " Don't split the path and file

"~~~~ taglist.vim ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
map <silent> \t :TlistToggle<CR>
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Show_One_File = 1
let Tlist_Process_File_Always = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40
let Tlist_Show_Menu = 1

"~~~~ qfixtoggle.vim ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
let g:QFixToggle_Height = 10
map <silent> \q :QFix<CR>

"******************************************************************************
" General keymap customizationgs
"******************************************************************************

"~~~~ Backspace in normal mode behaves like in insert mode ~~~~~~~~~~~~~~~~~~~~ 
nnoremap <BS> i<BS><ESC>

"~~~~ Easier window resizing with Alt + [h,j,k,l] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-w>-
map <silent> <A-k> <C-w>+
map <silent> <A-l> <C-w>>

"~~~~ Easier navigation between windows with , + [h,j,k,l] ~~~~~~~~~~~~~~~~~~~~ 
nmap <silent> ,h <C-w>h
nmap <silent> ,j <C-w>j
nmap <silent> ,k <C-w>k
nmap <silent> ,l <C-w>l

"~~~~ Buffer navigation ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
nmap <silent> + :bnext<CR>
nmap <silent> - :bprevious<CR>

"~~~~ Quickfix list navigation ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
nmap <silent> <A-S-l> :cnext<CR>
nmap <silent> <A-S-h> :cprev<CR>

"** end ***********************************************************************
