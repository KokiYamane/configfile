" line number
set number
hi LineNr ctermfg=grey

" cursor line colors
set cursorline
au InsertEnter * hi CursorLine ctermbg=darkred ctermfg=black
au InsertLeave * hi CursorLine ctermbg=black ctermfg=none
au CursorMoved * hi CursorLine ctermbg=black ctermfg=none
hi CursorLine ctermbg=black ctermfg=none cterm=bold guibg=black guifg=black gui=bold

" indent
set expandtab
set autoindent
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブ文字が占める幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2 " smartindentで増減する幅

" search
set hlsearch
set ignorecase
set incsearch
set smartcase

set wildmenu

" statusline

" status bar colors
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=red ctermbg=black
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=cyan ctermbg=black
au CursorMoved * hi statusline guifg=black guibg=#8fbfdc ctermfg=cyan ctermbg=black
hi statusline guifg=black guibg=#8fbfdc ctermfg=cyan ctermbg=black

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %n\                                 " Buffer number
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode

