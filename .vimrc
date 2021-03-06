" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


"
" Global options
"
execute pathogen#infect()
syntax on
filetype indent plugin on

if has("gui_running")
  set background=light
  "colorscheme solarized
  colorscheme jellybeans
else
  set t_Co=256
  colorscheme xoria256
  set termencoding=utf-8
endif

set autowrite
set backspace=indent,eol,start
set completeopt=menu,longest,preview
set colorcolumn=80
set cursorline
set cursorcolumn
set expandtab
set encoding=utf-8
set foldcolumn=2
set foldenable
set foldlevel=0
set foldmethod=marker
set fillchars+=stl:\ ,stlnc:\
set fileformats=unix,dos,mac

if has("unix")
  let s:oscode = system("uname -s")
  if s:oscode == "Darwin\n"
"    set guifont=Inconsolata:h18
"    set guifont=Source\ Code\ Pro:h16
    set guifont=Source\ Code\ Pro\ for\ Powerline:h18
    set clipboard=unnamed
  else
    set guifont=Source\ Code\ Pro\ 12
  endif
else
  set guifont=Source_Code_Pro:h11
  " Vim 8 - windows
  "set rop=type:directx,geom:1,taamode:1
  "set enc=utf-8
endif

set guioptions+=c
set guioptions-=T
set guioptions-=m

set history=1000
set ignorecase
set laststatus=2
set linespace=0
"set list listchars=tab:→\ ,trail:·
set listchars=tab:▶\ ,trail:·,extends:\#,nbsp:.
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

"set statusline=
"set statusline+=%-3.3n\                                   " buffer number
"set statusline+=%F\                                       " filename
"set statusline+=%h%m%r%w                                  " status flags
"set statusline+=\[%{strlen(&ft)?&ft:'none'}]              " file type
"set statusline+=\ \|\ %(%{Tlist_Get_Tagname_By_Line()}%)  " taglist, active tag
"set statusline+=%=                                        " right align remainder
"set statusline+=0x%-3B                                    " character value hex
"set statusline+=\|\ %-5b                                  " character value dec
"set statusline+=%-10(%l,%c%V%)                            " line, character
"set statusline+=%<%P                                      " file position

set synmaxcol=500

set tabstop=2
set title titlestring=%{getcwd()}\ \|\ %<%f\ %([%{Tlist_Get_Tagname_By_Line()}]%)

set vb
set wildmenu


"
" General keymap customizationgs
"
" Backspace in normal mode behaves like in insert mode 
nnoremap <BS> i<BS><ESC>

" Easier window resizing with Alt + [h,j,k,l]
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-w>-
map <silent> <A-k> <C-w>+
map <silent> <A-l> <C-w>>

" Easier navigation between windows with , + [h,j,k,l]
nmap <silent> ,h <C-w>h
nmap <silent> ,j <C-w>j
nmap <silent> ,k <C-w>k
nmap <silent> ,l <C-w>l

" Buffer navigation 
nmap <silent> + :bnext<CR>
nmap <silent> - :bprevious<CR>

" Quickfix list navigation 
nmap <silent> <A-S-l> :cnext<CR>
nmap <silent> <A-S-h> :cprev<CR>


"
" Code complete
"
autocmd FileType javascript set omnifunc=javascriptcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP


"
" Language/tool specific customizations
"
" C++
au BufRead,BufNewFile *.cpp set foldmarker={,} foldmethod=marker
au BufRead,BufNewFile *.hpp set foldmarker={,} foldmethod=marker

" git
au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

" PHP - syntax check, tags settings, folding
let tlist_php_settings = 'php;c:class;d:constant;f:function'
au BufRead,BufNewFile *.php set makeprg=/usr/local/php5/bin/php\ -l\ %
au BufRead,BufNewFile *.php set errorformat=%m\ in\ %f\ on\ line\ %l
au BufRead,BufNewFile *.php set foldmarker={,} foldmethod=marker

" PostgreSQL, PL/PgSQL
"au BufNewFile,BufRead *.sql set filetype=pgsql
let g:sql_type_default = 'pgsql'

" XML 
let g:xml_syntax_folding = 1
au FileType xml setlocal foldmethod=syntax

" spell checking for viki editing
au BufNewFile,BufRead vimperator-*.tmp setlocal spell
au BufNewFile,BufRead vimperator-*.tmp setfiletype tracwiki


"
" Plugin customizations
"
" bufexplorer.vim 
let g:bufExplorerShowRelativePath=1  " Show absolute paths.
let g:bufExplorerSortBy='fullpath'  " Sort by the buffer's name.
let g:bufExplorerSplitBelow=1        " Split new window below current.
let g:bufExplorerSplitRight=1        " Split right.
let g:bufExplorerSplitOutPathName=0  " Don't split the path and file

" dbext
let g:dbext_default_profile_psql = 'type=PGSQL:host=localhost:port=5432:dbname=development:user=postgres'
let g:dbext_default_profile = 'psql'"
au BufNewFile,BufRead *.sql DBCompleteTables

" elm-vim, syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 0
let g:elm_setup_keybindings = 0
let g:elm_classic_hightlighting = 0

" taglist.vim 
map <silent> \t :TlistToggle<CR>
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Show_One_File = 1
let Tlist_Process_File_Always = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50
let Tlist_Show_Menu = 1

" qfixtoggle.vim 
let g:QFixToggle_Height = 10
map <silent> \q :QFix<CR>

" tagbar 
noremap <silent> \g :TagbarToggle<CR> 
let g:tagbar_width = 50

" rainbow_parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter *.clj RainbowParenthesesToggle
au Syntax *.clj RainbowParenthesesLoadRound
au Syntax *.clj RainbowParenthesesLoadSquare
au Syntax *.clj RainbowParenthesesLoadBraces

" YouCompleteMe
"nnoremap <Leader>] :YouCompleteMe GoTo<CR>
"let g:ycm_rust_src_path = '/Users/ols/Projects/rust/src'
"let g:ycm_semantic_triggers = {
"     \ 'elm' : ['.'],
"     \ 'rust' : ['.', '::']
"     \}
"
"let g:ycm_python_binary_path = 'python'

"Powerline
let g:Powerline_symbols = 'fancy'

"indentLine
"let g:vim_json_syntax_conceal = 0
autocmd Filetype json let g:indentLine_setConceal = 0

" ocaml
set rtp^="/Users/ols/.opam/4.02.3+buckle-master/share/ocp-indent/vim"

" END
