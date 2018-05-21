filetype plugin on
filetype plugin indent on
syntax on
colorscheme {{ colorscheme }}

" http://vim.wikia.com/wiki/Indenting_source_code#Explanation_of_the_options
set shiftwidth=4
set expandtab
set softtabstop=4

" Enable search highlighting
set hlsearch

" Press Space to turn off highlighting and clear any message already
" displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Highlight column 120
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%121v', 100)

" Relative line numbers for window in focus
" Absolute line numbers for all other windows
" https://jeffkreeftmeijer.com/vim-number/
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Insert newline w/out entering edit mode
" http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

" Auto-resize split windows
" https://vi.stackexchange.com/questions/201/make-panes-resize-when-host-window-is-resized
:autocmd VimResized * wincmd =

" Bind ? to show netrw quickmaps help entry
autocmd FileType netrw nnoremap ? :help netrw-quickmap<CR>

" Remove netrw banner
let g:netrw_banner = 0

" Toggle (relative) numbers
nmap <C-I> :set relativenumber!<CR>:set number!<CR>

" https://stackoverflow.com/questions/5019315/vim-backspace-key-only-works-on-new-text
set backspace=indent,eol,start
