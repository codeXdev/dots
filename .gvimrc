
"------------------Gui-Visuals----------------
set guifont=CascadiaCode_Nerd_Font:h11

"colorscheme gruvbox 

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=e                                   "Making the tabs look like menu items

set nonumber
set foldcolumn=2
hi FoldColumn guibg=bg

set ghr=0
set linespace=15

"-------------Vim-Airline-Configuration------------"

"---------------Vim-Airline--------------"
" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1


" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''



" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1






"------------------Gui-languages----------------
let g:vim_bootstrap_langs = "html,javascript,php,typescript"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

"------------------Mappings-------------------"
"Ctrl+Enter to maximize gVim
"map <c-enter> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>


"Adding test comment
