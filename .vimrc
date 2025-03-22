
" An example for a vimrc file.
"
" Maintainer:    Bram Moolenaar <Bram@vim.org>
" Last change:    2019 Dec 17
"
" To use it, copy it to
"           for Unix:  ~/.vimrc
"          for Amiga:  s:.vimrc
"     for MS-Windows:  $VIM\_vimrc
"          for Haiku:  ~/config/settings/vim/vimrc
"        for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup        " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile    " keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=80
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

set encoding=utf-8

set number
set relativenumber
" set ignorecase
set smartcase

" Do not invert colors in visual mode (alacritty will handle that)
highlight Visual cterm=reverse ctermbg=NONE
highlight Search cterm=reverse ctermbg=NONE

" Indentation
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

" Remaps
let mapleader = ' '
" nnoremap <leader>l :copen<CR>
" nnoremap <leader>L :cclose<CR>
nnoremap <leader>n :cn<CR>
nnoremap <leader>p :cp<CR>
nnoremap <leader>e :Ex<CR>
nnoremap <leader>s :source %<CR>
nnoremap <leader>b :ls<CR>:b 
nnoremap <ESC> :noh<CR><ESC>
nnoremap / /\c

vnoremap <leader>y "+y

" Netrw mappings
augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    nmap <buffer> l <CR>
    nmap <buffer> h -
endfunction

" Custom function and commands
let g:last_command = []

function! RepeatCommand(...)
    if a:0 == 0
        if empty(g:last_command)
            echo "No command set"
        else
            echo join(g:last_command, ' ')
            execute join(g:last_command, ' ')
        endif
    else
        let g:last_command = a:000
    endif
endfunction
command! -nargs=* RepeatCommand call RepeatCommand(<f-args>)
nnoremap <leader>r :RepeatCommand<CR><CR>

command! -nargs=* Tmux :execute "silent !tmux send-keys -t '~' '"<q-args>"' Enter" | redraw!

command! -nargs=0 Todo :e ~/todo.md

command! -nargs=+ Sqlfk call Write_sql_fk(<f-args>)

:function! Write_sql_fk(from, table, to)
:let lnum = line(".")
:let text = "CONSTRAINT fk_" .. a:from .. " FOREIGN KEY (" .. a:from .. ")" .. " REFERENCES ".. a:table .. "(" .. a:to .. ")"
:let failed = append(lnum, text)
:endfunction

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

nnoremap <silent> <leader> :call ToggleQuickFix()<cr>

" Allow swap buffers without saving
set hidden

" Backups and swap files
set undofile
set undolevels=1000  " How many undos
set undoreload=10000 " number of lines to save for undo

set backup                          " enable backups
set swapfile                        " enable swaps
set undodir=$HOME/.vim/tmp/undo     " undo files
set backupdir=$HOME/.vim/tmp/backup " backups
set directory=$HOME/.vim/tmp/swap   " swap files
set path=**

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

