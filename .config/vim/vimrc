" Source defaults
source $VIMRUNTIME/defaults.vim

" Backup file config
set backup                          " enable backups
set swapfile                        " enable swaps
set undodir=$HOME/.vim/tmp/undo     " undo files
set backupdir=$HOME/.vim/tmp/backup " backups
set directory=$HOME/.vim/tmp/swap   " swap files

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

" Some options
set path=**
set encoding=utf-8
set number
set relativenumber
set smartcase
set hidden
set hlsearch

" Indentation
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

" Do not invert colors in visual mode
highlight Visual cterm=reverse ctermbg=NONE
highlight Search cterm=reverse ctermbg=NONE

" Remaps
let mapleader = ' '
nnoremap <leader>n :cn<CR>
nnoremap <leader>p :cp<CR>
nnoremap <leader>e :Ex<CR>
nnoremap <leader>s :source %<CR>
nnoremap <leader>b :ls<CR>:b 
nnoremap <ESC> :noh<CR><ESC>
nnoremap <leader>s /\c\<\><left><left>
nnoremap <silent> <leader>l :call ToggleQuickFix()<cr>
nnoremap / /\c

vnoremap <leader>y "+y
vnoremap <leader>d "_d

" Netrw mappings
augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    nmap <buffer> l <CR>
    nmap <buffer> h -
endfunction

" Commands
command! -nargs=0 Todo :e ~/todo.md
command! -nargs=+ Sqlfk call Write_sql_fk(<f-args>)

" Aliases for commonly used commands+lazy shift finger:
command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
command! -bar                                  -bang Wqa       wqa<bang>
command! -bar -nargs=* -complete=file -range=% -bang We        <line1>,<line2>w<bang> | e <args>
command! -bar -nargs=* -complete=file          -bang E         edit<bang> <args>
command! -bar                                  -bang Q         quit<bang>
command! -bar                                  -bang Qa        qall<bang>
command! -bar -nargs=? -complete=help                Help      help <args>
command! -bar -nargs=* -complete=file          -bang Make      make<bang> <args>
command! -bar -nargs=* -complete=dir           -bang Cd        cd<bang> <args>

" Functions
function! Write_sql_fk(from, table, to)
    let lnum = line(".")
    let text = "CONSTRAINT fk_" .. a:from .. " FOREIGN KEY (" .. a:from .. ")" .. " REFERENCES ".. a:table .. "(" .. a:to .. ")"
    let failed = append(lnum, text)
endfunction

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
