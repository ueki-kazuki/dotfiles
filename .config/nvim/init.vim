" 別のバッファーに移る時に保存を確認してこないようにする
set hidden
" カレント行ハイライト
set cursorline
" 行番号を表示する
set number
" InsertModeになる際にカーソル位置を画面中央にする
autocmd InsertEnter * norm zz
" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" DONT USE plugins {{{
let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1
" }}}

" NetRW
let g:netrw_liststyle = 1 " long listing
let g:netrw_list_hide = netrw_gitignore#Hide()

" Find {{{
set path+=**
set wildmenu
set wildignore+=*.pyc,**/.venv/**,**/__pycache__/**
set wildignore+=**/node_modules/**
set wildignore+=**/.git/**
set hidden
" }}}

" fold zf/zc/zo {{{
set foldmethod=marker
" autocmd BufWinLeave * mkview
" autocmd BufWinEnter * silent loadview
"" }}}

" dein {{{
"https://github.com/Shougo/dein.vim
"2016/08/05
"
" $ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
" $ sh ./installer.sh ~/.local/share/neovim/dein
"
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=$HOME/.local/share/neovim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.local/share/neovim/dein')
  call dein#begin(expand('$HOME/.local/share/neovim/dein'))

  " Let dein manage dein
  " Required:
  call dein#add('/Users/uekikazuki/.local/share/neovim/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neoyank.vim')
  " call dein#add('Shougo/unite.vim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('airblade/vim-gitgutter')
  call dein#add('lighttiger2505/deoplete-vim-lsp')
  call dein#add('liuchengxu/vim-which-key')
  call dein#add('mattn/vim-lsp-settings')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Required:
  call dein#end()
  call dein#save_state()
  call map(dein#check_clean(), "delete(v:val, 'rf')")
endif

" Required:
" filetype off
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

set laststatus=2
set showtabline=2 " 常にタブラインを表示
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='papercolor'
let g:airline_powerline_fonts = 1
"let g:Powerline_symbols = 'fancy'

"------------------------------------------------------------
" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#lsp#handler_enabled = 1
call deoplete#custom#option({
    \ 'auto_complete': v:true,
    \ 'min_pattern_length': 2,
    \ 'auto_complete_delay': 0,
    \ 'auto_refresh_delay': 20,
    \ 'refresh_always': v:true,
    \ 'smart_case': v:true,
    \ 'camel_case': v:true,
    \ })
let s:use_lsp_sources = ['lsp', 'dictionary', 'file']
call deoplete#custom#option('sources', {
    \ 'go': s:use_lsp_sources,
    \ 'python': s:use_lsp_sources,
    \ 'vim': ['vim', 'buffer', 'dictionary', 'file'],
    \})

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

" Denite
" 2021/01/06
" Define mappings
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
call denite#custom#var('file/rec', 'command',
                       \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'default_opts', ['--follow', '--no-group', '--no-color'])
" Define alias
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> s
  \ denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> v
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> /
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> ^
  \ denite#do_map('move_up_path')
endfunction

" defx
" 2021/02/02
" from :help defx-help
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

" Leader
" 2021/01/05
let mapleader = "\<Space>"
let maplocalleader = ","
nnoremap <silent><Leader>o :<C-u>Denite `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>
nnoremap <Leader>r :tabedit $HOME/.vimrc<CR>
nnoremap <leader>g :<C-u>Denite grep<CR>
nnoremap <leader>l :<C-u>Denite line<CR>
nnoremap <leader>s :<C-u>split<CR>
nnoremap <leader>v :<C-u>vsplit<CR>
nnoremap <leader>q :<C-u>close<CR>
nnoremap <silent> <C-t><C-t>   :<C-u>Denite buffer<CR>
nnoremap <silent> <C-t>t       :<C-u>Denite buffer<CR>
nnoremap <silent> <C-t><C-p>   :<C-u>Denite buffer -resume -cursor-pos=+1 -immediately<CR>
nnoremap <silent> <C-t>p       :<C-u>Denite buffer -resume -cursor-pos=+1 -immediately<CR>
nnoremap <silent> <C-t><C-n>   :<C-u>Denite buffer -resume -cursor-pos=-1 -immediately<CR>
nnoremap <silent> <C-t>n       :<C-u>Denite buffer -resume -cursor-pos=-1 -immediately<CR>

" vim-which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <leader><leader> :Denite buffer file_mru<CR>
nnoremap <silent> <leader>* :<C-u>DeniteCursorWord grep
nnoremap <silent> <Leader>y "+y
vnoremap <silent> <Leader>y "+y
nnoremap <silent> <Leader>d "+d
vnoremap <silent> <Leader>d "+d
nnoremap <silent> <Leader>p "+p
nnoremap <silent> <Leader>P "+P
vnoremap <silent> <Leader>p "+p
vnoremap <silent> <Leader>P "+P
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Including unlisted buffers in the cycle
" 2021/02/08
" https://vim.fandom.com/wiki/Cycle_through_buffers_including_hidden_buffers
function! SwitchToNextBuffer(incr)
  let help_buffer = (&filetype == 'help')
  let current = bufnr("%")
  let last = bufnr("$")
  let new = current + a:incr
  while 1
    if new != 0 && bufexists(new) && bufloaded(new) && ((getbufvar(new, "&filetype") == 'help') == help_buffer)
      execute ":buffer ".new
      break
    else
      let new = new + a:incr
      if new < 1
        let new = last
      elseif new > last
        let new = 1
      endif
      if new == current
        break
      endif
    endif
  endwhile
endfunction
nnoremap <silent> <C-n> :call SwitchToNextBuffer(1)<CR>
nnoremap <silent> <C-p> :call SwitchToNextBuffer(-1)<CR>
