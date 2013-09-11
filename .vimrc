set tabstop=4
set shiftwidth=4
set nu
set tags=tags
set smartcase
set smartindent
set smarttab
set foldmethod=marker

if has("autocmd")
	"记住上次光标所在位置
	au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
endif

syntax on
colo delek 
set cursorline
hi cursorline cterm=none ctermbg=black

let NERDTreeWinPos=1
let g:neocomplcache_enable_at_startup=1

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'snipMate'

"F2为打开当前C文件的函数列表
map <F2> :TlistToggle<cr>

"F3为打开目录列表
map <F3> :NERDTreeToggle<cr><cr> 



