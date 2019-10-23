if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.vim') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif


" ファイルタイプ別のプラグイン/インデントを有効にする"
filetype plugin indent on

" vim-indent-guides"
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=238
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1


set nocompatible
set autoread
set formatoptions=lmoq

" swap, backupなどのファイル作成抑止"
set nowritebackup
set nobackup
set noswapfile


" 行番号を表示する"
set number

" 対応する括弧やブレースを表示する"
set showmatch

" 改行時に前の行のインデントを継続する"
set autoindent

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する"
set smartindent

" タブ文字の表示幅"
set tabstop=4

" Vimが挿入するインデントの幅"
set shiftwidth=4

" タブをスペースに変換"
set expandtab

" カーソルを行頭、行末で止まらないようにする"
set whichwrap=b,s,h,l,<,>,[,]

" for vim-colorscheme-primary"
set t_Co=256
"set background=dark
" colorscheme primary


" 構文毎に文字色を変化させる"
syntax on


" 構文毎に文字色を変化させる"
syntax on


" for golang"
autocmd BufNewFile,BufRead *.go set filetype=go
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
let g:go_fmt_autosave=1
let g:go_fmt_fail_silently=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_structs=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1

" for javascript"
autocmd FileType javascript call JavaScriptFold()
autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType javascript setlocal omnifunc=jscomplete#CompleteJS

" for HTML"
autocmd FileType html setlocal tabstop=4 shiftwidth=4 softtabstop=4

" for python"
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setlocal autoindent
let python_highlight_all=1

" for lightline"
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '▶', 'right': '◀' },
      \ 'subseparator': { 'left': '>', 'right': '<' }
      \ }

set laststatus=2


