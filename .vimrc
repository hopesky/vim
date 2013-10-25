"设置一个tab显示出来时几个空格
set tabstop=4

"设置自动缩进所使用的空白长度
set shiftwidth=4

"显示行号
set number

"设置函数、宏等标签所用到tags文件名
"（顺便说下，Ctrl-[是跑到函数、宏等定义处，Ctrl-t返回）
"如果提示找不到标签或者你要更新标签可以在linux shell下执行命令：
" ctags -Rf .tags
" 如果启动vim时提示ctags有关的问题，那么请安装最新版本的ctags
set tags=.tags

"设置代码折叠方式为标记式折叠（这样下次打开时该处也是折叠的）
"折叠方法：
"折叠一对{}或[]或（）或/**/里的内容：将光标移到起始或末尾处，按zf%进行折叠
"zo：展开当前折叠
"zO：展开当前折叠（包括嵌套折叠）
"zr：展开所有折叠
"zR：展开所有折叠（包括嵌套折叠）
"zc：收起当前折叠
"zC：收起当前折叠（包括嵌套折叠）
"zd：删除当前折叠
"zD：删除当前折叠（包括嵌套折叠）
"zE：删除所有折叠
set foldmethod=marker

"设置语法高亮
syntax on

"设置配色方案
colo delek

"设置搜索高亮(要取消搜索的高亮可以用“:noh”）(即nohighlight)
set hlsearch
hi Search cterm=none ctermbg=Magenta

"设置动态搜索高亮（即搜索时自动跳转）
set incsearch

"设置高亮当前行，如果觉得不好看，可以注释掉
set cursorline
hi cursorline cterm=none ctermbg=black

"F2为打开当前C文件的函数列表
map <F2> :TlistToggle<cr>

"F3为打开目录列表
let NERDTreeWinPos=1
map <F3> :NERDTreeToggle<cr><cr>

"设置自动开启补全（如果注释掉，那么只有按Ctrl-n或Ctrl-p才能补全）
let g:neocomplcache_enable_at_startup=1

"Bundle管理插件（可用它来装各种插件）
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"自动代码补全插件（如输入main，再按tab键，那么会补全一个main函数)
"可通过设置~/.vim/bundle/snipMate/snippets/里的文件来配置补全
Bundle 'snipMate'


"编辑模式下可以支持emacs的上下左右和删除单个字符快捷键
"(<C-n>和<C-p>由于是补全的快捷键,所以上和下改为<C-k>和<C-j>
imap <C-b> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-f> <Right>
imap <C-a> <Home>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-i> <Esc>

"在写回文件前将下列文件后缀中的tab替换为空格
function RemoveWhitespaceOfC()
    if &ft =~ "erl"  ||
	 \ &ft =~ "lisp" ||
	 \ &ft =~ "c"    ||
	 \ &ft =~ "h"    ||
	 \ &ft =~ "cpp"  ||
	 \ &ft =~ "sh"
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
