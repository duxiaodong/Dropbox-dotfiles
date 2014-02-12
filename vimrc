colorscheme desert 
set nu 
set showcmd "在状态栏显示正在输入的命令
syntax enable "语法高亮
set expandtab  "将tal键改为空格，默认8个
set tabstop=4 "将Tab键改为4个空格
set smarttab  "智能删除tab
set cindent "使用c语言的规则自动缩进，当敲回车时候自动缩进
set shiftwidth=4 "自动缩进时，使用4个空格，默认是8个
set sm "括号配对情况
syntax on   
set cursorline 
    """"""""""""""""""""""""""
    "
    let mapleader = "," "设置NERD_commenter.vim
    "Fast reloading of the .vimrc
    map <silent> <leader>ss :source ~/.vimrc<cr>
    map <silent> <leader>ee :e ~/.vimrc<cr>
    """"""""""""""""""""""""""
    "NERD_tree setting
    let NERDTreeWinPos="right" 
    let NERDTreeHighlightCursorline=1 "高亮当前行" 
    let NERDTreeShowBookmarks=1   "自动显示标签"
    let NERDTreeWinSize=30
    nmap <silent> <leader>nt :NERDTreeToggle<CR>

    
"开始使用vundle的必须配置
set nocompatible    " 是vim不兼容vi
filetype off        " required!
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
"original repos on github

filetype plugin indent on "vundle配置必须开启插件

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<CR>
let Tlist_Show_one_File=1   "当taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist__Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim

"config cscope 
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
"   add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> 
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR> 
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> 
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> 
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> 
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR> 
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

set background=dark "设置背景颜色
set backspace=indent,eol,start
set pastetoggle=<F12>
"""""""""""""""""""""""""""""""""""""
set completeopt=menu
    """""""""""""""""""""""""""""""""'
    "Tlist setting
    let Tlist_Use_Right_Window=1
    let Tlist_Show_One_File=1 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
    let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
    let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
   """"""""""""""""""""""""""""""
   " NERDTree setting
   """"""""""""""""""""""""""""""
   nmap <silent> <leader>tt :NERDTreeToggle<cr>
