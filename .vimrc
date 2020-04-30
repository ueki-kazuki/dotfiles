
" 別のバッファーに移る時に保存を確認してこないようにする
set hidden
" カレント行ハイライト
set cursorline
" 行番号を表示する
set number


"------------------------------------------------------------
"https://github.com/Shougo/dein.vim
"2016/08/05
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=$HOME/.local/share/vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.local/share/vim/dein')
  call dein#begin(expand('$HOME/.local/share/vim/dein'))

  " Let dein manage dein
  let s:toml_dir  = expand('$HOME/.config/vim/dein/toml')
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
  call map(dein#check_clean(), "delete(v:val, 'rf')")
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"------------------------------------------------------------
" Python mode
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType python setl list listchars=tab:>-,eol:\ ,trail:_
autocmd FileType python setl completeopt-=preview
autocmd FileType python syntax enable

" Shell mode
autocmd FileType sh setl autoindent
autocmd FileType sh setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType sh setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType sh setl list listchars=tab:>-,eol:\ ,trail:_
autocmd FileType sh setl completeopt-=preview
autocmd FileType sh syntax enable

" JavaScript mode
autocmd FileType javascript setl autoindent
autocmd FileType javascript setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType javascript setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript setl list listchars=tab:>-,eol:\ ,trail:_
autocmd FileType javascript setl completeopt-=preview
autocmd FileType javascript syntax enable

" YAML
" 2018/03/11
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Golang
" 2016/08/08
autocmd FileType go setl autoindent
autocmd FileType go setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType go setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType go setl list listchars=tab:.\ ,eol:\ ,trail:_
autocmd FileType go setl completeopt-=preview
autocmd FileType go syntax enable

" toml
" autocmd FileType toml syntax enable
"------------------------------------------------------------

"------------------------------------------------------------
" highlight

" アンダーラインを引く(color terminal)
highlight CursorLine   cterm=underline ctermfg=NONE ctermbg=NONE gui=underline guifg=NONE guibg=NONE

" 行番号
highlight LineNr       term=underline  ctermfg=130  ctermbg=None gui=underline guifg=Brown
highlight CursorLineNr cterm=bold      ctermfg=255  ctermbg=130  gui=bold      guifg=Brown

" Gdiff
" 2016/08/08
" vimdiffの色設定
set runtimepath^=$HOME/.vim/after
highlight DiffAdd     ctermfg=78   ctermbg=235
highlight DiffDelete  ctermfg=168  ctermbg=235
highlight DiffChange  ctermfg=0    ctermbg=42
highlight DiffText    ctermfg=255  ctermbg=199

" Pmenu
" 2019/12/25
highlight Pmenu		ctermfg=gray ctermbg=black guibg=darkcyan
highlight PmenuSel	ctermfg=white ctermbg=black guibg=black
highlight PmenuSbar	guibg=gray
highlight PmenuThumb	gui=reverse

" Netrw
highlight Directory     term=bold ctermfg=11 guifg=#1600FF
