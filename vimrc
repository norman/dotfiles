unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" begin vundle setup
filetype off
" LilyPond
set rtp+=~/Applications/LilyPond.app/Contents/Resources/share/lilypond/current/vim
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

" Linting
Plugin 'w0rp/ale'

" Postgres syntax highlighting
" Plugin 'exu/pgsql.vim'
Plugin 'Prosumma/vim-pgsql'

" Tests	
Plugin 'tpope/vim-dispatch'
Plugin 'janko-m/vim-test'

" File viewing
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'

" CScope
Plugin 'chazy/cscope_maps'

" Ruby
Plugin 'vim-ruby/vim-ruby'

" Align assignments
Plugin 'godlygeek/tabular'

" Trim trailing whitespace
Plugin 'csexton/trailertrash.vim'

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

" Use ag over grep
if executable('ag')
  set grepprg=ag\ --vimgrep
end

" Highlight beyond column 124 to avoid long lines
let &colorcolumn=join(range(124,999),",")

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
let test#strategy = "dispatch"
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

autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType haml set omnifunc=rubycomplete#Complete
let g:rubycomplete_load_gemfile = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" Experimental
let g:is_posix=1
set synmaxcol=300

" Linting
" In ~/.vim/vimrc, or somewhere similar.
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

if exists(":Tabularize")
  nmap <Leader>h :Tabularize /=><CR>
  vmap <Leader>h :Tabularize /=><CR>
  nmap <Leader>j :Tabularize /:\zs<CR>
  vmap <Leader>j :Tabularize /:\zs<CR>
endif

" For MacVim
set guifont=Inconsolata\ Nerd\ Font:h16
set guicursor+=n-v-c:blinkon0

hi UnwantedTrailerTrash guibg=red ctermbg=red
