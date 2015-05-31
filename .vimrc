set tags+=~/flash0235/apps_proc/kernel/include/tags

nmap <F2> <C-W><C-W>
nnoremap <F9> :Grep<CR>
nnoremap <silent> <F12> :A<CR>
nmap <F3> :bnext<cr>
nnoremap <F10> :Rgrep<CR>
nnoremap <F11> :Bgrep<CR>
nnoremap <F6> <C-x><C-o>

syntax enable
syntax on
"set t_Co=8
set background=dark
colorscheme solarized
set number
set hls
set nu

"缩进宽度
set tabstop=4
set softtabstop=4
set shiftwidth=4
"建议开启expandtab选项，会自动将tab扩展很空格，代码缩进会更美观
set expandtab

"
" taglist
"
let Tlist_Show_One_File=1    "只显示当前文件的tags
let Tlist_WinWidth=40        "设置taglist宽度
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
let g:winManagerWindowLayout='TagList,FileExplorer'
let g:winManagerWidth=40
nmap wm :WMToggle<cr>

let g:miniBufExplMapCTabSwitchBufs=1
let g:bufExplorerMaxHeight=30
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMapWindowNavVim = 1
let g:AutoOpenWinManager = 0

function! UpdateCtags()
    let curdir=getcwd()
    while !filereadable("./tags")
       cd ..
       if getcwd() == "/"
           break
       endif
    endwhile

    if filewritable("./tags")
        !ctags -R --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q
        TlistUpdate
    endif

    execute ":cd " . curdir
endfunction
nmap <F5> :call UpdateCtags()<CR>
"autocmd BufWritePost *.c,*.h,*.cpp call UpdateCtags()

"git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
  
" My Bundles here:
"
" original repos on github
" github上的用户写的插件，使用这种用户名+repo名称的方式
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
" vimscripts的repo使用下面的格式，直接是插件名称
Bundle 'taglist.vim'
"Bundle 'SuperTab'
"Bundle 'vimwiki'
Bundle 'winmanager'
Bundle 'bufexplorer.zip'
"Bundle 'The-NERD-tree'
"Bundle 'matrix.vim--Yang'
"Bundle 'FencView.vim'
"Bundle 'Conque-Shell'
"Bundle 'Vimpress'
"Bundle 'Markdown'
"Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'c.vim'
"Bundle 'snipMate'
Bundle 'a.vim'
  
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'Valloric/ListToggle'
"Bundle 'scrooloose/syntastic'
Bundle 'OmniCppComplete'
filetype plugin indent on

" non github reposo
" 非github的插件，可以直接使用其git地址
" Bundle 'git://git.wincent.com/command-t.git'
" ...
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" vundle主要就是上面这个四个命令，例如BundleInstall是全部重新安装，BundleInstall!则是更新
" 一般安装插件的流程为，先BundleSearch一个插件，然后在列表中选中，按i安装
" 安装完之后，在vimrc中，添加Bundle 'XXX'，使得bundle能够加载，这个插件，同时如果
" 需要配置这个插件，也是在vimrc中设置即可
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
