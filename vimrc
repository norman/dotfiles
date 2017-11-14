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

" Automate tab/indent settings
Plugin 'tpope/vim-sleuth'

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
Plugin 'exu/pgsql.vim'

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
