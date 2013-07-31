colo delek 

set tabstop=4
set shiftwidth=4

set fileencodings=gb2312
set encoding=gb2312
set nu
let NERDTreeWinPos=1
map <F2> :TlistToggle<cr>
map <F3> :NERDTreeToggle<cr><cr> 

let g:neocomplcache_enable_at_startup=1

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'snipMate'
syntax on

set tags=tags;
