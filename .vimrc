
set tabstop=4
set shiftwidth=4
set nu
set tags=tag
set smartcase
set smartindent
set smarttab
set foldmethod=marker

syntax on
colo delek
set cursorline
hi cursorline cterm=none ctermbg=black

let NERDTreeWinPos=1
"let g:neocomplcache_enable_at_startup=1

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'snipMate'

"F2为打开当前C文件的函数列表
map <F2> :TlistToggle<cr>

"F3为打开目录列表
map <F3> :NERDTreeToggle<cr><cr>

"编辑模式下可以支持emacs的上下左右的快捷键
"(<C-n>和<C-p>由于是补全的快捷键,所以上和下改为<C-k>和<C-j>
imap <C-b> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-f> <Right>
imap <C-a> <Home>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-i> <Esc>

"在写回文件前将c,erl,lisp文件中的tab替换为空格
function RemoveWhitespaceOfC()
    if &ft =~ "erl" || &ft =~ "lisp" || &ft =~ "c"
        set et
        retab
    endif
endfunction
autocmd BufWritePre * call RemoveWhitespaceOfC()

"在写回文件前自动去除尾部空白符(不包括后缀为diff的文件)
function RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()

"显示尾部空白符
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

"记住上次光标所在位置
function RecoverLastPosition()
    if line("'\"") > 0
        if line("'\"") <= line("$")
            execute "normal '\""
        else
            execute "normal $"
        endif
        execute "normal zz"
    endif
endfunction
autocmd BufReadPost * call RecoverLastPosition()
