""" vim-plug
" PlugInstall to install plugins
" PlugClean to remove unused plugins
" PlugUpdate to update installed plugins
" UpdateRemotePlugins to update some neovim plugins
call plug#begin('~/.vim/plugged')

" Autocomplete
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
" Syntax checking + linting + static code analysis
Plug 'benekastah/neomake'

" Fuzzy searching for everything
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'marcusbuffett/fzf.vim'
" Git wrapper
Plug 'lambdalisue/vim-fugitive'
" Commenting
Plug 'scrooloose/nerdcommenter'
" Status line
Plug 'bling/vim-airline'
" HTML and CSS abbreviation expansion using Emmet
Plug 'mattn/emmet-vim'
" Lots of color schemes
Plug 'flazz/vim-colorschemes'
" GHCMod for completion, linting, etc. of Haskell
Plug 'eagletmt/ghcmod-vim'
" Aligning of text using :Tabularize
Plug 'godlygeek/tabular'
" Lots of snippets
Plug 'honza/vim-snippets'
" Snippet engine
Plug 'SirVer/ultisnips'
" Adds operations like cs]) to change [test] to (test)
Plug 'tpope/vim-surround'
" Dash support (documentation app for OS X)
Plug 'rizzatti/dash.vim'
" Makes vim hard
Plug 'takac/vim-hardtime'
" Better JavaScript support (indentation, syntax highlighting, etc)
Plug 'pangloss/vim-javascript'
" Tern for some (minimal) static code analysis for JavaScript
Plug 'ternjs/tern_for_vim'
" Toggle location list / quickfix list
Plug 'Valloric/ListToggle'
" Substitute command that intelligently changes case, plurality,etc.
Plug 'tpope/vim-abolish'
" Highlight matching HTML tag
Plug 'gregsexton/MatchTag'
" " File explorer
Plug 'scrooloose/nerdtree'
" I knew I would be forced to install this one eventually...
Plug 'Shougo/unite.vim'
" Send ctrl-h, ctrl-j, ctrl-k, ctrl-l to tmux if there is no window
Plug 'christoomey/vim-tmux-navigator'
" Allows other plugins to support the repeat command (.)
Plug 'tpope/vim-repeat'
" CSS3 syntax support
Plug 'hail2u/vim-css3-syntax'
" Jade support
Plug 'digitaltoad/vim-jade'
" JSX support
Plug 'mxw/vim-jsx'
" SCSS support
Plug 'cakebaker/scss-syntax.vim'
" Indent guides, useful for callback-hell and HTML
Plug 'nathanaelkane/vim-indent-guides'
" Coffescript support
Plug 'kchmck/vim-coffee-script'
" Rust syntax highlighting
Plug 'wting/rust.vim'
" Rust autocompletion
Plug 'racer-rust/vim-racer'
" Git status symbols for NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin'
" " Set cwd to root of git project if exists
" Plug 'airblade/vim-rooter'
" Needed by other plugins
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Dependency of other plugins
Plug 'xolox/vim-misc'
" Easy motion
Plug 'easymotion/vim-easymotion'
" Send code to tmux panes
Plug 'epeli/slimux'
" Scala syntax highlighting + indentation
Plug 'derekwyatt/vim-scala'
" Show modified/added/removed lines in gutter
Plug 'airblade/vim-gitgutter'
" Swift syntax highlighting + indentation
Plug 'keith/swift.vim'
call plug#end()

""" Options

" Set leader to space
let mapleader="\<Space>"
" Enable syntax highlighting
syntax enable
" Copy indent from current line when inserting new line
set autoindent
" Smart indenting based on language
set smartindent
" Dark background
set background=dark
" Make backspace work as expected
set backspace=indent,eol,start
" Visual bell instead of audio bell
set visualbell
" Support hidden buffers
set hidden
" Highlight matches as the search is type
set incsearch
" Highlight all matches for a search
set hlsearch
" Don't wrap lines
set nowrap
" Number of spaces to use for auto indent + >> + <<, etc
set shiftwidth=2
" Number of spaces that a <Tab> inserts
set softtabstop=2
" Number of spaces that a <Tab> displays
set tabstop=2
" Expand tabs to spaces
set expandtab
" Ignore case when searching
set ignorecase
" Don't ignore case when there is a capital in the search
set smartcase
" Lots of undo
set undolevels=1000
" Allow vim to set the title of the shell
set title
" Set text width (used for comments)
set textwidth=60
" When hitting enter on a commented line, continue the comment
set formatoptions+=r
" Don't auto-wrap text with textwidth
set formatoptions-=t
" Don't insert comment leader when hitting `o`/`O` on commented line 
" NOTE: overriden by NerdTree
set formatoptions-=o
" No scroll offset
set scrolloff=0
" Always have a status line
set laststatus=2
" Show line numbers
set number
" Don't store swap files
set noswapfile
" No limit to syntax highlighting
set synmaxcol=0
" use g flag for substitute by default
set gdefault
" Disable left scrollbar
set guioptions-=l
" Disable right scrollbar
set guioptions-=r
" Intercept mouse events
set mouse=a
" Timeout for mappings
set timeoutlen=800 
" Timeout for key sequences
set ttimeoutlen=10
" Use tags file relative to cwd, not current file's directory
set cpoptions+=d
" Lots of history
set history=5000
" Use new and shiny regex engine
set re=2
" Enable filetype detection
filetype on
" Enable filetype-specific indenting
filetype indent on
" Enable filetype-specific plugins
filetype plugin on
" Do not automatically change dirs
set noautochdir
" Don't save twice
set nowritebackup
" Set spelling language to us english
set spelllang=en_us

" Enable % to match more than braces
runtime macros/matchit.vim

" Set colorscheme
colorscheme gruvbox

" General mappings
nnoremap <leader>w :wa<CR>
nnoremap <leader>q :wq<CR>
nnoremap <leader>/ :noh<CR>
nnoremap <leader>x :pclose<CR>:ccl<CR>:helpclose<CR>
nnoremap <tab> :b#<CR>`"
nnoremap <leader>bp :bprev<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>ose :set spell<CR>
nnoremap <leader>osd :set nospell<CR>

" Augroup for editing
augroup EditVim
  au!
  " Detect jade files
  au BufRead,BufNewFile *.jade setlocal ft=jade
  " Run files using <leader>r, respecting file type
  au filetype python     nnoremap <leader>r  :!python3 %<CR>
  au filetype haskell    nnoremap <leader>r  :!runhaskell %<CR>
  au filetype javascript nnoremap <leader>r  :!node %<CR>
  au filetype haskell    nnoremap <leader>rc :!cabal run<CR>
  au filetype ruby       nnoremap <leader>r  :!ruby %<CR>
  au filetype ruby       nnoremap <leader>rb :!bundle exec ruby %<CR>
  au filetype php        nnoremap <leader>r  :!php %<CR>
  au filetype rust        nnoremap <leader>r  :!cargo run<CR>

  au Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
  au Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')

  """ Filetype-specific mappings
  "" Haskell
  " Search hoogle
  au filetype haskell nnoremap <leader>h :!hoogle --count=5 ""<Left>
  " Autocomplete using necoghc
  au filetype haskell setlocal omnifunc=necoghc#omnifunc
  " Get type of expression under cursor
  au FileType haskell nnoremap <buffer> <leader>t :GhcModType<CR>
  " Clear highlighting of expression
  au FileType haskell nnoremap <buffer> <silent> <leader>/ :noh <bar> GhcModTypeClear<CR>

  "" JavaScript
  au filetype javascript nnoremap <leader>t :TernType<CR>
  au filetype javascript nnoremap <leader>f :TernDef<CR>
  au filetype javascript nnoremap K :TernDoc<CR>
  au FileType javascript setlocal omnifunc=tern#Complete

  "" Other
  " 4-spaces for python
  au filetype python setlocal ts=4 sts=4 sw=4
  " Autocomplete css
  au FileType css     set omnifunc=csscomplete#CompleteCSS
  " Autocomplete scss
  au FileType scss     set omnifunc=csscomplete#CompleteCSS
augroup END

" Make commands that wok an words and WORDS include '-' in css + scss
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
  autocmd FileType scss setlocal iskeyword+=-
augroup END

""" Plugin configurations

"" FZF
" Search buffers
nnoremap <leader>fn :Buffers<CR>
" Search marks
nnoremap <leader>fm :Marks<CR>
" Search tags
nnoremap <leader>fb :Tags<CR>
" Search files
nnoremap <leader>fp :Files<CR>
" Search git files
nnoremap <leader>fg :GitFiles<CR>
" Search lines in current file
nnoremap <leader>fs :BLines<CR>
" Search all files for text
nnoremap <leader>aa :Agp ""<left>
vnoremap <leader>aa y:Agp ""<left><C-r>0
" Put cursor in field for file include regex
nnoremap <leader>ag :Agp -G
vnoremap <leader>ag y:Agp -G <C-r>0
" Only search specific file types
nnoremap <leader>agr :Agp -G "\.rb" ""<left>
vnoremap <leader>agr y:Agp -G "\.rb" ""<left><C-r>0
nnoremap <leader>agj :Agp -G "\.js" ""<left>
vnoremap <leader>agj y:Agp -G "\.js" ""<left><C-r>0
nnoremap <leader>agh :Agp -G "\.hs" ""<left>
vnoremap <leader>agh y:Agp -G "\.hs" ""<left><C-r>0

"" Dash
" Search dash for current word
noremap <leader>d :Dash<CR>
" Open command mode to search dash
nnoremap <leader>D :Dash<space>

"" Fugitive
" Status without untracked files
noremap <Leader>gs :Gstatus<CR>
" Diff all files
noremap <Leader>gd :Gdiff<CR>
" Blame current file
noremap <Leader>gb :Gblame<CR>
" Patch current file
noremap <Leader>gp :Gpatch<CR>
" Commit staged changes
noremap <Leader>gc :Gcommit --verbose<CR>
" Reset to head
noremap <Leader>gr :Gread<CR>
" Add
noremap <Leader>gw :Gwrite<CR>

"" ListToggle
" Toggle location list 
let g:lt_location_list_toggle_map = '<leader>tl'
" Toggle quickfix list 
let g:lt_quickfix_list_toggle_map = '<leader>tq'

"" Hardtime
" Enable hardtime
let g:hardtime_default_on = 1
" Only activate for repeated presses of the same key
let g:hardtime_allow_different_key = 1
" Set what keys hardtime will throttle
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>", "n", "w", "b", "W", "B", "e", "E", ";"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
nnoremap <leader>ho :HardTimeOff<CR>
nnoremap <leader>ht :HardTimeToggle<CR>

"" NerdTree
" Toggle nerdtree
map <leader>n :NERDTreeToggle<CR>
" Move cursor to nerdtree
map <leader>nl :NERDTreeFocus<CR>
" Find the current file in nerdtree and move cursor
map <leader>nf :NERDTreeFind<CR>
" Why NERDTree uses '?' as its help command is beyond me...
let NERDTreeMapHelp='<f1>'


"" NerdCommenter
" Put one space after the comment character
let NERDSpaceDelims = 1

"" Neomake
" Check file after every write
autocmd! BufWritePost * Neomake
" Check file after every read
autocmd! BufReadPost * Neomake
" Only use rubocop for ruby
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_python_enabled_makers = ['flake8']

"" Deoplete
" Enable deoplete
let g:deoplete#enable_at_startup = 1
" If there aren't input patterns set for completion, set it to {}
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
  let g:deoplete#omni#input_patterns.python =
  \ ['[^. *\t]\.\w*']
  let g:deoplete#omni#input_patterns.javascript =
  \ ['[^. *\t]\.\w*']
  let g:deoplete#omni#input_patterns.ruby =
  \ ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']
endif
" Tab for completion
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'tag', 'omni']
" ST directory generates a *lot* of tags
let g:deoplete#tag#cache_limit_size = 100000000

"" Ultisnips
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

"" Airline
" Enable powerline fonts
let g:airline_powerline_fonts = 1
" Disable detecting whitespace because that's what linters
" are for
let g:airline_detect_whitespace=0
" Disable showing changed hunks in airline
let g:airline#extensions#hunks#enabled = 0
" Use default for section_a, *but* without mode because it's
" obvious what mode you're in
let g:airline_section_a = airline#section#create_left(['crypt', 'paste', 'spell', 'iminsert'])
" Disable section x (tagbar, filetype, virtualenv) and
" section y (fileencoding and fileformat) because they are
" rarely useful
let g:airline_section_x = ''
let g:airline_section_y = ''
" Make section z (line number, column, etc) less cluttered
let g:airline_section_z = '%l:%c'

"" Rust racer
let g:racer_cmd="/Users/marcusbuffett/Documents/etc/racer/target/release/racer"
"" NerdTree-git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "●",
    \ "Staged"    : "✚",
    \ "Untracked" : "?",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"" Sneak-like movement with easymotion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

"" Slimux
map <Leader>sl :SlimuxREPLSendLine<CR>
vmap <Leader>ss :SlimuxREPLSendSelection<CR>
map <Leader>sa maggVG:SlimuxREPLSendSelection<CR>`a
map <Leader>sk :SlimuxSendKeysPrompt<CR>
map <Leader>skr :SlimuxSendKeysLast<CR>
map <Leader>sh :SlimuxShellPrompt<CR>
map <Leader>sr :SlimuxShellLast<CR>
let g:slimux_select_from_current_window = 1

"" GitGutter
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
nmap <Leader>ggm :let g:gitgutter_diff_base = 'head' \| GitGutter<CR>
nmap <Leader>ggi :let g:gitgutter_diff_base = '' \| GitGutter<CR>
nmap <Leader>ggb :let g:gitgutter_diff_base = system("git merge-base master $(git rev-parse head)") \| GitGutter<CR>
