let mapleader = "," 
colorscheme desert 
set nu 
set showcmd              "在状态栏显示正在输入的命令
syntax enable            "语法高亮
set expandtab            "将tal键改为空格，默认8个
set tabstop=4            "将Tab键改为4个空格
set smarttab             "智能删除tab
set cindent              "使用c语言的规则自动缩进，当敲回车时候自动缩进
set shiftwidth=4         "自动缩进时，使用4个空格，默认是8个
set sm                   "括号配对情况
syntax on   
set cursorline           "高亮的线 
set background=dark      "设置背景颜色
set backspace=indent,eol,start
set pastetoggle=<F12>
set foldmethod=syntax  "语法项目指定折叠方式
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=n            " 在所有模式下都允许使用鼠标，还可以是n,v,i,c等
set whichwrap+=<,>,h,l " 退格键和方向键可以换行
set lz                  " 当运行宏时，在命令执行完成之前，不重绘屏幕
set ai                  " 自动缩进
set si                  " 智能缩进
set showmatch           " 显示匹配的括号 
set cindent             " C/C++风格缩进
" tab转化为4个字符
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
" 状态栏
set laststatus=2        " 总是显示状态栏
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"开始使用vundle的必须配置
set nocompatible         " 是vim不兼容vi
filetype off             " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" vim-scripts repos
Bundle 'a.vim'
Bundle 'taglist.vim'
Bundle 'winmanager'
Bundle 'ctags.vim'
Bundle 'cscope.vim'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'OmniCppComplete'
Bundle 'minibufexpl.vim'
Bundle 'bufexplorer.zip'
"original repos on github

filetype plugin indent on 
"""""""""""""""""""""""""""""""""""""
"winmanger 协同管理NERDTree,Taglist
let g:NERDTree_title="[NERD Tree]" 
let g:winManagerWindowLayout='NERDTree|TagList,BufExplorer'

function! NERDTree_Start()

    exec 'NERDTree'

    endfunction

    function! NERDTree_IsValid()

    return 1

    endfunction

    nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>

    nmap <F3> :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""'
"Taglist setting
let Tlist_Use_Right_Window=1        "" 右边显示
let Tlist_Exit_OnlyWindow =1        "" 只有一个窗口退出
let Tlist_Show_One_File=1           "" 让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1    "" 非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1         "" 当taglist是最后一个分割窗口时，自退出vim
""""""""""""""""""""""""""""""""""""""""""""""""""
" 根据给定方向搜索当前光标下的单词，结合下面两个绑定使用
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "<cr>"
    else
        execute "normal /" . l:pattern . "<cr>"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" 用 */# 向 前/后 搜索光标下的单词
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast reloading of the .vimrc
map <silent> <leader>so :source ~/.vimrc<cr>
map <silent> <leader>ee :e ~/.vimrc<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERD_tree setting
let NERDTreeShowHidden = 1         "" 隐藏
let NERDTreeWinPos="right" 
let NERDTreeHighlightCursorline=1  ""高亮当前行" 
let NERDTreeShowBookmarks=1        ""自动显示标签"
let NERDTreeWinSize=30
nmap <silent> <leader>n :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"quickfix setting
nmap <F3> :cw<cr>
nmap <F5> :cp<cr>
nmap <F4> :cn<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"miniBufferExplore setting
let g:miniBufExplMapCTabSwitchBufs = 1      ""启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在                                               当前窗口打开；ubuntu好像不支持
let g:miniBufExplMapWindowNavVim = 1        ""按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapWindowNavArrows = 1     ""按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
let g:miniBufExplorerMoreThanOne=0          ""
let g:miniBufExplModSelTarget = 1           "" 不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " OmniCppComplete.vim setting
 " http://www.vim.org/scripts/script.php?script_id=1520
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  
 set completeopt=menu
 let OmniCpp_ShowPrototypeInAbbr = 1
 let OmniCpp_DefaultNamespaces = ["std"]     " 逗号分割的字符串
 let OmniCpp_MayCompleteScope = 1
 let OmniCpp_ShowPrototypeInAbbr = 0
 let OmniCpp_SelectFirstItem = 2
 " c-j自动补全，当补全菜单打开时，c-j,k上下选择
 imap <expr> <c-j>      pumvisible()?"\<C-N>":"\<C-X><C-O>"
 imap <expr> <c-k>      pumvisible()?"\<C-P>":"\<esc>"
 " f:文件名补全，l:行补全，d:字典补全，]:tag补全
 imap <C-]>             <C-X><C-]>
 imap <C-F>             <C-X><C-F>
 imap <C-D>             <C-X><C-D>
 imap <C-L>             <C-X><C-L> 
"""""""""""""""""""""""""""""""""""""""""""""""""""
    " 更新ctags和cscope索引
    " href: http://www.vimer.cn/2009/10/把vim打造成一个真正的ide2.html
    " 稍作修改，提取出DeleteFile函数，修改ctags和cscope执行命令
map <F6> :call Do_CsTag()<cr>
function! Do_CsTag()
    let dir = getcwd()
 
    "先删除已有的tags和cscope文件，如果存在且无法删除，则报错。
    if ( DeleteFile(dir, "tags") )
        return
    endif
    if ( DeleteFile(dir, "cscope.files") )
        return
    endif
    if ( DeleteFile(dir, "cscope.out") )
        return
    endif
 
    if(executable('ctags'))
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:isWin)
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        else
            silent! execute "!find . -iname '*.[ch]' -o -name '*.cpp' > cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
    " 刷新屏幕
    execute "redr!"
endfunction
 
function! DeleteFile(dir, filename)
    if filereadable(a:filename)
        if (g:isWin)
            let ret = delete(a:dir."\\".a:filename)
        else
            let ret = delete("./".a:filename)
        endif
        if (ret != 0)
            echohl WarningMsg | echo "Failed to delete ".a:filename | echohl None
            return 1
        else
            return 0
        endif
    endif
    return 0
endfunction
 
" cscope 绑定
if has("cscope")
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
    " s: C语言符号  g: 定义     d: 这个函数调用的函数 c: 调用这个函数的函数
    " t: 文本       e: egrep模式    f: 文件     i: include本文件的文件
    nmap <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
    nmap <leader>si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
    nmap <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
endif
""""""""""""""""""""""""""""""""""""""""""""""""""
" 获取当前路径，将$HOME转化为~
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction
set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\ 
""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers Explorer （需要genutils.vim）
" http://vim.sourceforge.net/scripts/script.php?script_id=42
" http://www.vim.org/scripts/script.php?script_id=197
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber
nmap <silent> <Leader>b :BufExplorer<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"F7一键编译程序
nmap <F7> :call DoOneFileMake()<CR>
function DoOneFileMake()
if(expand("%:p:h")!=getcwd())
            echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press redirect to the dir of this file."
 endif
 exec "w"
 call SetCompilation()
 exec "make"
 exec "copen"
endfunction
function SetCompilation()
    if &filetype=='c'
    set makeprg=gcc\ %\ -o\ %<
    elseif &filetype=='cpp'
        set makeprg=g++ \ %\ -o\ %<根据不同
    endif
endfunction 
"从系统剪切板中复制，剪切，粘贴
map <F8> "+y
map <F9> "+p

" 快捷输入
" 自动完成括号和引号
inoremap <leader>1 ()<esc>:let leavechar=")"<cr>i
inoremap <leader>2 []<esc>:let leavechar="]"<cr>i
inoremap <leader>3 {}<esc>:let leavechar="}"<cr>i
inoremap <leader>4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap <leader>q ''<esc>:let leavechar="'"<cr>i
inoremap <leader>w ""<esc>:let leavechar='"'<cr>i
