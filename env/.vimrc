"====================================================================
" Start vundle
"====================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"===============================================================
" Write your plugins here
"===============================================================
Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
"Plugin 'chazy/cscope_maps'
"Plugin 'vim-scripts/taglist.vim' Legacy version (4.5)
Plugin 'scrooloose/nerdtree'
Plugin 'wesleyche/SrcExpl'
Plugin 'wesleyche/Trinity'
"Plugin 'Valloric/YouCompleteMe'

"====================================================================
" Run vundle
"====================================================================
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set nu

set shiftwidth=4
set expandtab
set tabstop=4

set hlsearch
set incsearch
"set cursorline

filetype indent on

"" Tab switching
nnoremap <F3> :tabN<CR>
nnoremap <F4> :tabn<CR>

nnoremap <F8>  :TrinityToggleAll<CR>
nnoremap <F9>  :TrinityToggleSourceExplorer<CR>
nnoremap <F11> :TrinityToggleNERDTree<CR>

nnoremap <F10> :TlistToggle<CR>
nnoremap <F12> :TlistOpen<CR>
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
set ut=1000

syntax on
set t_Co=256
colorscheme vibrantink
set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey

autocmd BufNewFile,BufReadPre,BufReadPost *.mib set syntax=mib
autocmd BufReadPost *.makeErr set syntax=make

set listchars=eol:$,tab:>.,trail:~,extends:>,precedes:<

set autochdir
set tags=./tags,tags;

if has("cscope") && filereadable("/usr/bin/cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set csre
    set nocsverb
    "" add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    else
        cs add ~/edsg4000/download/NET/EDS/G4000/G4000/develop/source/package/app_moxa_iss_10_1_0/cscope.out
        cs add ~/edsg4000/download/NET/EDS/G4000/G4000/develop/source/package/lib_bcm_xsdk_1_4_3/cscope.out
        cs add ~/edsg4000/download/NET/EDS/G4000/G4000/develop/source/package/eds4000-test-utility/cscope.out
        "cs add ~/mdsg4000/download/NET/MDS/4000/G4000/develop/source/package/app_moxa_iss_10_1_0/cscope.out
    endif
    set csverb
endif

let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/plugin/.ycm_extra_conf.py'
