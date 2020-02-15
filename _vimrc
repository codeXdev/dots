
set nocompatible              " be iMproved, required
"----------------------Source Vundle plugins-------------------------"
source ~\plugins.vim







"---------------------- Editor Configuration -------------------------"
set number 
set encoding=utf-8			"Encode in utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set backspace=indent,eol,start
set linespace=0
set visualbell
set noerrorbells visualbell t_vb=
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden


""Setting clipboard to default windows clipboard
set clipboard=unnamedplus


"allowing plugins indent based on file type
filetype plugin indent on


""set spell lang to US and set spell check
"set nospell spelllang=en_us



""Set the file type to unix
"set ft=unix

"File Format to UNIX
set ff=unix





"---------------Visuals--------------"
syntax enable 
colorscheme atom-dark
set ruler
"set gcr=a:blinkon0





"--------------- Searching --------------"
set hlsearch
set incsearch
set ignorecase
set smartcase





"--------------- Editor Color --------------"
set laststatus=2					"For the status bar running
if !has('gui_running')					"For forcing the terminal color mode
  set t_Co=256
endif

"statusline format
"set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\







"--------------- Editor Shortcuts --------------"
"" no one is really happy until you have this shortcuts
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





"-------------Mappings------------"
"Make it easy to edit my _vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Leader+e+g to edit _gvimrc
nmap <Leader>eg :tabedit $MYGVIMRC<cr>

"Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

"Let's make it easy to write plugins.vim
nmap <Leader>ep :tabedit ~\plugins.vim<cr>

"Let's make it easy to source vimrc file 
"nmap <Leader>sv :tabedit $MYVIMRC<cr>:w<cr>:tabc<cr>

"Let's make it easy to NERDTree Toggle 
nmap <Leader>n :NERDTreeToggle<cr> 

"Mapping the ctrl r for the token(variables and method) search
nmap <c-r> :CtrlPBufTag<cr>


"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>


"" Vim jk keys for <Esc>
inoremap jk <Esc>



""Making it easy to save
noremap <C-s> <Esc>:w<CR>

""Making it easy to close
noremap <C-w> <Esc>:bd<CR>









"-------------MNERDTree configuration------------"
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
"nnoremap <silent> <F3> :NERDTreeToggle<CR>








"-------------Auto-Commands------------"

"Automatically source the vimrc file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost $MYVIMRC :source $MYVIMRC 
	autocmd BufWritePost plugins.vim :source $MYVIMRC 
	autocmd BufWritePost $MYGVIMRC :source $MYGVIMRC 
augroup END





"----------Backups and SWP files-----------"
set directory=$HOME/vimtemp
set directory^=$HOME/vimtemp
set backupdir=$HOME/vimtemp
set backupdir^=$HOME/vimtemp
set undodir=$HOME/vimtemp
set undodir^=$HOME/vimtemp


"---------------Plugins Configurations--------------"
"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0
