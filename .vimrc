"""""""" let Vundle manage Vundle""""""""
filetype off  " required when vundle startup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'snipMate'
Bundle 'taglist.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'godlygeek/tabular'
Bundle 'Shougo/neocomplcache.vim'
filetype plugin indent on " recover filetype when vundle startup finished

""""""""''"""""neocomplcache"""""""""""""""""""
"neocomplcache is the abbreviation of "neo-completion with cache". It provides
"keyword completion system by maintaining a cache of keywords in the current
"buffer. neocomplcache could be customized easily and has a lot more features
"than the Vim's standard completion feature.
"
"If you use Vim 7.3.885 or above with if_lua feature, you should use
"neocomplete. It is faster than neocomplcache.
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" enable AutoComplPop.
let g:acp_enableAtStartup = 1
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1
" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"""""""" erlang auto compile plugin""""""""""
let g:erlangHighlightBif = 1
let g:erlangCompletionGrep='zgrep'
let g:erlangManSuffix='erl\.gz'

""""""""""""snipMate""""""""""""""""
" e.g: input main, and then press Tab, it will complete a main function
" configuration is in ~/.vim/bundle/snipMate/snippets/

""""""""taglist"""""""""""""
" open current file tags lists
map <F2> :TlistToggle<cr>

""""""""NerdTree"""""""""""""""
let NERDTreeWinPos=1
map <F3> :NERDTreeToggle<cr>
" open a NERDTree automatically when vim starts up if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap < :vertical resize -1<cr>
nmap > :vertical resize +1<cr>
nmap <c-h> <c-w>h<c-w><Bar>
nmap <c-l> <c-w>l<c-w><Bar>
nmap <c-k> <c-w>k<c-w><Bar>
nmap <c-j> <c-w>j<c-w><Bar>
nmap <c-n> <c-w>w

""""""""""minibufexpl.vim""""""""""
" when has more then one windows let vim show label

""""""""""""tabular"""""""""""""
" when need align code by following characters, just press a, and characters to align
" |=;:[]{}()
" e.g: press ,a= is aligning code by =
let mapleader=','
nmap <Leader>a\| :Tabularize /\|<CR>
vmap <Leader>a\| :Tabularize /\|<CR>
nmap <Leader>a\ :Tabularize /\|<CR>
vmap <Leader>a\ :Tabularize /\|<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a( :Tabularize /(<CR>
vmap <Leader>a( :Tabularize /(<CR>
nmap <Leader>a) :Tabularize /)<CR>
vmap <Leader>a) :Tabularize /)<CR>
nmap <Leader>a; :Tabularize /;<CR>
vmap <Leader>a; :Tabularize /;<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a[ :Tabularize /[<CR>
vmap <Leader>a[ :Tabularize /[<CR>
nmap <Leader>a] :Tabularize /]<CR>
vmap <Leader>a] :Tabularize /]<CR>
nmap <Leader>a{ :Tabularize /{<CR>
vmap <Leader>a} :Tabularize /}<CR>
nmap <Leader>a<space> :Tabularize / <CR>
vmap <Leader>a<space> :Tabularize / <CR>
" in insert mode，if code is already aligned by |, then vim can auto aligned code when input |
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction



" swith tab to space when saving
function RemoveWhitespaceOfC()
    if &ft =~ "erl"  ||
	 \ &ft =~ "lisp" ||
	 \ &ft =~ "c"    ||
	 \ &ft =~ "h"    ||
	 \ &ft =~ "cpp"  ||
	 \ &ft =~ "sh"   ||
	 \ &ft =~ "sql"
        set et
        retab
		set noet
    endif
endfunction
autocmd BufWritePre * call RemoveWhitespaceOfC()

" remove space in the tail when saving(exclude '*.diff' sufix file)
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

" recover last curson position when startup vim
function RecoverLastPosition()
    if line("'\"") > 0
        if line("'\"") <= line("$")
            execute "normal! g`\""
        else
            execute "normal $"
        endif
    endif
endfunction
autocmd BufReadPost * call RecoverLastPosition()

" set tags file name to '.tags', so that we can hide it
" Q1: when I startup vim, it show 'Taglist: Exuberant ctags (http://ctags.sf.net) not  found in PATH. Plugin is not loaded.', what's up?
" A1: you should install the ctags first
" Q2: what's the shortcut key in ctags?
" A2: ctrl-[ : goto tags(such as function、macro) definion
"     ctrl-t : go back
" Q3: when I press ctrl-[, it shows no tags found. what's wrong?
" A3: you should quit vim, and then execute: ctags -Rf .tags
set tags+=.tags

set list
" setting show tab and space style with '|'
set lcs=tab:\|\ ,nbsp:%,trail:-

" set fisrt tab color to gray
"highlight LeaderTab guifg=#666666
"match LeaderTab /^\t/

" show space in the tail
"highlight WhitespaceEOL ctermbg=red guibg=red
"match LeaderTab /\s\+$/

" any question with the following settings
" just run :help fold, or :help hlsearch, blablabla...
set foldmethod=marker
set hlsearch
set incsearch
set tabstop=4
set shiftwidth=4
set number
set showcmd
set ruler
set title
set autoindent
set smartcase
set nowrap
set wildmenu
set nocp
syntax on

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

imap <C-b> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-f> <Right>
imap <C-a> <Home>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-i> <Esc>
