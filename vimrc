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

" Linting
Plugin 'w0rp/ale'

" Postgres syntax highlighting
Plugin 'Prosumma/vim-pgsql'

" Tests
Plugin 'vim-test/vim-test'

" File viewing
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'

" Ruby
Plugin 'vim-ruby/vim-ruby'

" Trim trailing whitespace
Plugin 'csexton/trailertrash.vim'

" Status line
Plugin 'itchyny/lightline.vim'
Plugin 'maximbaz/lightline-ale'

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

" Use RipGrep over grep
if executable('rg')
  set grepprg=rg\ --vimgrep
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

" Simple completion
set tags+=./tags
set omnifunc=ale#completion#OmniFunc
set complete=.,b,u,]
" Show list of tags when there are multiple matches
set cscopetag

" Ruby indenting
let g:ruby_indent_assignment_style = 'variable'

" Experimental
let g:is_posix=1
set synmaxcol=300
set wildmode=longest,list:longest
set completeopt=menu,preview

" Linting
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\   'ruby': ['rubocop', 'solargraph'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\   'ruby': ['rubocop'],
\}
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_sign_error = '✕'
let g:ale_sign_warning = '☞'
let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_format = '%linter% %severity% (%code%): %s'
let g:ale_loclist_msg_format = '%linter% %severity% (%code%): %s'
let g:ale_completion_enabled = 0
let g:ale_completion_autoimport = 1
nmap <silent> <leader>x :ALEFix<CR>
nnoremap gd :ALEGoToDefinition<CR>
nnoremap gr :ALEFindReferences<CR>
nnoremap K :ALEHover<CR>


" Set up lightline
set noshowmode
set laststatus=2
set cmdheight=1

let g:lightline = {
      \ 'colorscheme': 'solarized',
			\ 'component_function': {
			\   'gitbranch': 'FugitiveHead'
			\ },
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

let g:lightline.active = { 'right': [[ 'gitbranch', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }

" For MacVim
set guifont=Inconsolata\ Nerd\ Font:h16
set guicursor+=n-v-c:blinkon0

hi UnwantedTrailerTrash guibg=red ctermbg=red
au BufRead,BufNewFile *.arb set filetype=ruby 
