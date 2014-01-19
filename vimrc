colorscheme desert 
set nu 
syntax enable
syntax on
set cursorline 

set nocompatible    " be iMproved
filetype off        " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" vim-scripts repos
Bundle 'a.vim'
Bundle 'ctags.vim'
Bundle 'taglist.vim'
Bundle 'winmanager'
Bundle 'cscope.vim'
filetype plugin indent on

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

