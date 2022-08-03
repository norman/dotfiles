unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" begin vundle setup
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugins
Plugin 'VundleVim/Vundle.vim'

" Rails
Plugin 'tpope/vim-rails'

" Git
Plugin 'tpope/vim-fugitive'

" Quoting
Plugin 'tpope/vim-surround'

" Fuzzy finding
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

" Like Solarized but smaller
Plugin 'romainl/flattened'

" Commenting
Plugin 'tomtom/tcomment_vim'

" Postgres syntax highlighting
Plugin 'Prosumma/vim-pgsql'

" Tests
Plugin 'vim-test/vim-test'

" File viewing
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'

" Trim trailing whitespace
Plugin 'csexton/trailertrash.vim'

Plugin 'neoclide/coc.nvim'

call vundle#end()
filetype plugin indent on
" end vundle setup

colorscheme flattened_light

" Paren/block matching
runtime! macros/matchit.vim

" Be quiet
set vb

" Use comma as leader
let mapleader=","

if executable('ag')
  set grepprg=ag\ --vimgrep
end

" Highlight beyond column 125 avoid long lines
let &colorcolumn=join(range(125,999),",")

" Line numbers
set number

" Allow click-drag to resize splits in iTerm and others
if has('mouse_sgr')
  set ttymouse=sgr
endif

" Don't unload when switching buffers. This preserves undo history
" while changing buffers.
set hidden

" Reread externally changed files when buffer has no edits
set autoread

" Indentation
set shiftwidth=2
set smartindent
set smarttab
set tabstop=2
set expandtab

" Open new splits to the bottom right
set splitbelow
set splitright

" Stop from accidentally entering ex mode.
nnoremap Q <nop>

" Don't screw up Makefiles
autocmd FileType make set noexpandtab

" FZF setup
nmap <silent> <leader>f :Files<CR>
nmap <silent> <leader>t :Tags<CR>
nmap <silent> <leader>b :Buffers<CR>

" Treat all SQL as Postgres
let g:sql_type_default = 'pgsql'

" Strip trailing whitespace
autocmd FileType ruby,javascript,lua,bash,haml,html autocmd BufWritePre <buffer> %s/\s\+$//e

" Use Mac clipboard
set clipboard=unnamed

" Tests
let test#strategy = "vimterminal"
nmap <silent> <leader>N :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>L :TestLast<CR>
nmap <silent> <leader>V :TestVisit<CR>
let g:test#runner_commands = ['RSpec']

" NerdTree
nmap <silent> <leader>d :NERDTreeToggle<CR>

" More random keyboard shortcuts
nmap <silent> <leader>s :set nolist!<CR>
nmap <silent> <leader>p :set invpaste paste?<CR>
nmap <silent> <leader>n :set invnumber number?<CR>

" Show list of tags when there are multiple matches
set cscopetag

" Experimental
let g:is_posix=1
set synmaxcol=300
set wildmode=longest,list:longest


" CoC settings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> <leader>x :call CocActionAsync('format')<CR>


function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

hi UnwantedTrailerTrash guibg=red ctermbg=red
au BufRead,BufNewFile *.arb set filetype=ruby
