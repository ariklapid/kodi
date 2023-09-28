":version 6.1
":set nowrap
:set title
:set ruler
:set ignorecase
":set guifont=-b&h-lucidatypewriter-bold-r-normal-sans-17-160-75-75-m-100-iso8859-6
":set guifont=Courier10Pitch\ 16
:set guifont=Monospace\ 14
:syntax on
:au! BufRead,BufNewFile *.fs            set filetype=vhdl
:au! BufRead,BufNewFile *.ifc	        set filetype=vhdl
:au! BufRead,BufNewFile *.map	        set filetype=vhdl
:au! BufRead,BufNewFile *.hpp	        set filetype=vhdl
:au! BufRead,BufNewFile *.pro           set filetype=vhdl

:au! BufRead,BufNewFile *.debug	        set filetype=debug

:au! BufRead,BufNewFile *.w             set filetype=perl
:au! BufRead,BufNewFile *.hdl           set filetype=perl

:au! BufRead,BufNewFile csim_pli.elog   set filetype=csimpli
:au! BufRead,BufNewFile *.rpt           set filetype=csimpli

":au! BufRead,BufNewFile *.sv            set filetype=verilog
":au! BufRead,BufNewFile *.vs            set filetype=verilog
:au! BufRead,BufNewFile *.icf           set filetype=verilog
":au! BufRead,BufNewFile *.vh            set filetype=verilog
":au! BufRead,BufNewFile *.svh           set filetype=verilog
":au! BufRead,BufNewFile *.tt2           set filetype=verilog

:au! BufRead,BufNewFile *.fasm          set filetype=fasm
:au! BufRead,BufNewFile *.finc          set filetype=fasm
:au! BufRead,BufNewFile *.patchlet      set filetype=fasm
:au! BufRead,BufNewFile *.lst           set filetype=fasm
:au! BufRead,BufNewFile *.patch         set filetype=patch

:filetype on

:autocmd FileType vhdl    so ~/docs/ihdl.vim	  		| "recognize hdl files (*.hdl in vim is vhdl type)
:autocmd FileType def     so ~/docs/ihdl.vim	  		| "recognize def files (*.hdl in vim is vhdl type)
:autocmd FileType idlang  so ~/docs/ihdl.vim			| "proto
:autocmd FileType debug   so ~/docs/debug.vim			| "debug
:autocmd FileType csimpli so ~/docs/csimpli.vim                 | "csim_pli.log
:set cpt=.,k~/docs/dict,k$VIM/syntax/perl.vim,b,w,u
:set history=20
:set wildchar=<TAB>
:set expandtab
:set tabpagemax=30
:set showmatch
:set hlsearch
:set incsearch
:set smartindent 
:ab fro for
:ab teh the
:ab pritn print
:ab arch architecture
set laststatus =2
set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
:set ts=4
:set sw=4
:set titlestring=%t
:set undolevels=500
:set nocp
:set guioptions=agimrLtTbte
:set bs=2 "backspace allowed always
:syn match cm ".*::.*"
":hi cm guibg='Cyan'
:hi cm guibg='Blue'
:hi Visual guibg='Yellow' guifg='Darkred'
:hi normal guifg=blue guibg=gray 
hi normal guifg=blue guibg=gray

"Colors for drop-down menu of word-completion (ctrl+n/ctrl+p)
:highlight Pmenu ctermfg=1 ctermbg=4 guibg=DarkMagenta

set nu
color slate
"Shift-RIGHT complete when inc search what's under the cursor
"Shift-Down complete whole word - under cursor
cnoremap <S-Down> <CR>yiw<BS>/<C-R>"
cnoremap <S-Right> <CR>y/<Up>/e+1<CR><BS>/<C-R>=escape(@",'.*\/?')<CR>

"press / or n when visual mode - will search the selected string
vmap / y/<C-R>"<CR>
vmap n y/<C-R>"<CR>

"shift-right in insert mode - to visual (as in windows - mark)
imap <S-Right> <Esc><Right>v
vmap <S-Right> <Right>
vmap <CR> <Esc>
nmap <S-Right> v<Right>

"Shift-Insert = paste
nmap <S-Insert> <Esc>"*p
imap <S-Insert> <Esc>"*pi<Right>
cmap <S-Insert> <MiddleMouse>

" Copy file name / full path to clipboard
function! CopyFileName(fullPath)
    if (a:fullPath=="1")
        let str = expand('%:p')
    else
        let str = expand('%:t')
    endif
    echo "Copied to clipboard: " str
    let @*= str
endfunction
nmap <silent><A-p>     :call CopyFileName(1)<CR>
nmap <silent><A-S-P>   :call CopyFileName(0)<CR>



" % highlight {..}
:nmap % v%

" set size for 7.1 version
":set lines=36
":set columns=115
":winpos 0 30

" set size for 7.1 version with Monospace guifont
:set lines=40
:set columns=200
:winpos 0 0

""auto completion of paranthesis

":inoremap ( ()<Esc>a
":inoremap [ []<Esc>i
":inoremap " ""<Esc>i
":inoremap { {<enter>};<Esc><left><up>o

" bk edit <file>
":map <F3> :!bk edit %<CR><CR>

" chmod u+w <file>
":map <F4> :!chmod u+w %<CR><CR>

:map <F3> :!glv  <C-R><C-W><CR>
:map <F4> :!fvar <C-R><C-W><CR>
:map <F6> :norm I// <CR>
:map <F11> :sp $MODEL_ROOT/source/punit/rtl/pcu_info.xml <CR>


" short for tabnew (keep the space at the end)
" :cmap tb tabnew 

" short for 'se wrap' and 'se nowrap'
:map <F7> :se wrap<CR>
:map <F8> :se nowrap<CR>

" easily move between windows
nmap <silent> <A-Up>    :wincmd k<CR>
nmap <silent> <A-Down>  :wincmd j<CR>
nmap <silent> <A-Left>  :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" save, when in insert mode (will return to inser mode)
imap <c-s> <c-o>:w<CR>
imap <F2> <c-o>:w<CR>
" save, when in normal mode
map <c-s> :w<CR>
map <F2> :w<CR>

:set tw=0

" show existing tab with 4 spaces width
set tabstop=8
set softtabstop=4
" when indenting with '>', use 4 spaces width
"set shiftwidth=4
" On pressing tab, insert 4 spaces
"set expandtab

fun! AllIndent()
    let oldLine=line('.')
    normal(gg=G)
    execute ':' . oldLine
endfun
map -- :call AllIndent()<cr> 

:set autochdir


" -------------
" DWG Settings:
" -------------
"source /p/hdk/rtl/proj_tools/debug_utils/xhdk74_cdg/latest/gvim/vimrc_dwg
