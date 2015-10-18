nnoremap <F2> <C-W><C-W>
"<F5> for lookupfile
nnoremap <F6> :Rgrep<CR>
nnoremap <F7> :A<CR>

nnoremap <F9>  :cw<CR>
nnoremap <F10> :ccl<CR>
nnoremap <F11> :cn<CR>
nnoremap <F12> :cp<CR>

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

let mapleader=","
nmap <silent> <leader>ll :LUTags<cr>
nmap <silent> <leader>lb :LUBufs<cr>
nmap <silent> <leader>lw :LUWalk<cr>

syntax enable
syntax on
"set t_Co=8
set background=dark
colorscheme solarized
set number
set hls
"set nu

"缩进宽度
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hidden
set autoindent " 继承前一行的缩进方式，特别适用于多行注释
set smartindent " 为C程序提供自动缩进
set cindent " 使用C样式的缩进

"a.vim
let g:alternateNoDefaultAlternate = 1

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

" lookupfile setting
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件

if filereadable("./filenametags")                "设置tag文件的名字
    let g:LookupFile_TagExpr = '"./filenametags"'
endif

" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
    let _tags = &tags
    try
        let &tags = eval(g:LookupFile_TagExpr)
        let newpattern = '\c' . a:pattern
        let tags = taglist(newpattern)
        catch
        echohl ErrorMsg | echo
        "Exception: " . v:exception |
        echohl NONE
        return ""
    finally
        let &tags = _tags
    endtry
     "Show the matches for what is typed so far.
    let files = map(tags, 'v:val["filename"]')
        return files
endfunction
let g:LookupFile_LookupFunc ='LookupFile_IgnoreCaseFunc'

" cscope
if filereadable("./cscope.out")
    :cscope add cscope.out
    :set cscopequickfix=s-
endif

" vundle {
set rtp+=~/.vim/bundle/vundle/
" 如果在windows下使用的话，设置为
" set rtp+=$HOME/.vim/bundle/vundle/
call vundle#rc()
" }
"
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
Bundle 'c.vim'
Bundle "mbriggs/mark.vim" 
Bundle 'Valloric/YouCompleteMe'
Bundle 'a.vim'
Bundle 'taglist.vim'
Bundle 'bufexplorer.zip'
Bundle 'tpope/vim-unimpaired'
Bundle 'genutils'
Bundle 'lookupfile'
Bundle 'grep.vim'
Bundle 'winManager'
Bundle 'altercation/vim-colors-solarized'
Bundle 'minibufexpl.vim'
"Bundle 'auto.vim'
" non github reposo
" 非github的插件，可以直接使用其git地址
" Bundle 'git://git.wincent.com/command-t.git'
" ...
  
"
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



