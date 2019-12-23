
" 別のバッファーに移る時に保存を確認してこないようにする
set hidden
" カレント行ハイライト
set cursorline
" アンダーラインを引く(color terminal)
highlight CursorLine   cterm=underline ctermfg=NONE ctermbg=NONE gui=underline guifg=NONE guibg=NONE
" 行番号を表示する
set number
highlight LineNr       term=underline  ctermfg=130  ctermbg=None gui=underline guifg=Brown
highlight CursorLineNr cterm=bold      ctermfg=255  ctermbg=130  gui=bold      guifg=Brown

"https://github.com/Shougo/dein.vim
"2016/08/05
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('$HOME/.vim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('davidhalter/jedi-vim')
call dein#add('tomasr/molokai')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('tpope/vim-fugitive')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('scrooloose/syntastic')
call dein#add('janko-m/vim-test')
call dein#add('pangloss/vim-javascript')
call dein#add('fatih/vim-go')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

"------------------------------------------------------------
"Airline
"2016/08/05
set laststatus=2
set showtabline=2 " 常にタブラインを表示
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='papercolor'
let g:airline_powerline_fonts = 1
"let g:Powerline_symbols = 'fancy'

"------------------------------------------------------------

"------------------------------------------------------------
"Jedi Python
"2016/08/05
" jediにvimの設定を任せると'completeopt+=preview'するので
" 自動設定機能をOFFにし手動で設定を行う
let g:jedi#auto_vim_configuration = 0
" 補完の最初の項目が選択された状態だと使いにくいためオフにする
let g:jedi#popup_select_first = 0
" quickrunと被るため大文字に変更
let g:jedi#rename_command = '<Leader>R'
" gundoと被るため大文字に変更 (2013-06-24 10:00 追記）
let g:jedi#goto_command = '<Leader>G'

" syntasticとflake8で文法チェックを行う
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType python setl list listchars=tab:>-,eol:\ ,trail:_
autocmd FileType python setl completeopt-=preview
autocmd FileType python syntax enable
"------------------------------------------------------------

"------------------------------------------------------------
" Shell mode
autocmd FileType sh setl autoindent
autocmd FileType sh setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType sh setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType sh setl list listchars=tab:>-,eol:\ ,trail:_
autocmd FileType sh setl completeopt-=preview
autocmd FileType sh syntax enable
"------------------------------------------------------------
"
"------------------------------------------------------------
" JavaScript mode
autocmd FileType javascript setl autoindent
autocmd FileType javascript setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType javascript setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript setl list listchars=tab:>-,eol:\ ,trail:_
autocmd FileType javascript setl completeopt-=preview
autocmd FileType javascript syntax enable
"------------------------------------------------------------

"------------------------------------------------------------
" Unite
" 2016/08/05
nnoremap [unite]  <Nop>
nmap     <C-u>    [unite]

nnoremap <silent> <C-t><C-c>   :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> <C-t><C-t>   :<C-u>Unite buffer<CR>
nnoremap <silent> <C-t>t       :<C-u>Unite buffer<CR>

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    <C-t> [Tag]

" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
nnoremap <silent> <C-j> :tabnext<CR>
" tp 前のタブ
map <silent> [Tag]p :tabprev<CR>
nnoremap <silent> <C-k> :tabprev<CR>
" tw タブを閉じる
map <silent> [Tag]w :bdelete<CR>
"------------------------------------------------------------

"------------------------------------------------------------
"Gdiff
"2016/08/08
" vimdiffの色設定
set runtimepath^=$HOME/.vim/after
highlight DiffAdd     ctermfg=78   ctermbg=235
highlight DiffDelete  ctermfg=168  ctermbg=235
highlight DiffChange  ctermfg=0    ctermbg=42
highlight DiffText    ctermfg=255  ctermbg=199

"------------------------------------------------------------
"YAML
"2017/06/21
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"------------------------------------------------------------
"vim-go
"2018/03/11
let g:go_fmt_autosave = 1

autocmd FileType go setl autoindent
autocmd FileType go setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType go setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType go setl list listchars=tab:.\ ,eol:\ ,trail:_
autocmd FileType go setl completeopt-=preview
autocmd FileType go syntax enable
"------------------------------------------------------------
