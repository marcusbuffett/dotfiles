""" vim-plug
" PlugInstall to install plugins
" PlugClean to remove unused plugins
" PlugUpdate to update installed plugins
" UpdateRemotePlugins to update some neovim plugins
call plug#begin('~/.vim/plugged')
" Autocomplete
Plug 'Shougo/deoplete.nvim'
" Python completion
Plug 'zchee/deoplete-jedi'
" Syntax checking + linting + static code analysis
Plug 'benekastah/neomake'
" Fuzzy searching for everything
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Git wrapper
Plug 'lambdalisue/gina.vim'
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
" Snippet engine
Plug 'Shougo/neosnippet.vim'
" Snippets source
Plug 'Shougo/neosnippet-snippets'
" Adds operations like cs]) to change [test] to (test)
Plug 'tpope/vim-surround'
" Dash support (documentation app for OS X)
Plug 'rizzatti/dash.vim'
" Prevent repetitive key use in vim
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
" File explorer
Plug 'scrooloose/nerdtree'
" Interactive, customizable buffer
Plug 'Shougo/unite.vim'
" Send ctrl-h, ctrl-j, ctrl-k, ctrl-l to tmux if there is no window
Plug 'christoomey/vim-tmux-navigator'
" Allows other plugins to support the repeat command (.)
Plug 'tpope/vim-repeat'
" CSS3 syntax support
Plug 'hail2u/vim-css3-syntax'
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
" Haskell syntax highlighting + indentation
Plug 'neovimhaskell/haskell-vim'
" Create gists from vim
Plug 'mattn/gist-vim'
" Dependency of gist-vim
Plug 'mattn/webapi-vim'
" Distraction-free writing for prose
Plug 'junegunn/goyo.vim'
" Better markdown support
Plug 'plasticboy/vim-markdown'
" Focus on current line
Plug 'junegunn/limelight.vim'
" Swift autocomplete
Plug 'mitsuse/autocomplete-swift'
" Sidebar with buffer tags
Plug 'majutsushi/tagbar'
" Tagbar with unite
Plug 'Shougo/unite-outline'
" Colorscheme unite source
Plug 'ujihisa/unite-colorscheme'
" Marks unite source
Plug 'tacroe/unite-mark'
" Display marks in the sidebar
Plug 'jeetsukumaran/vim-markology'
" Note taking plugin
Plug 'xolox/vim-notes'
" Vimwiki
Plug 'vimwiki/vimwiki'
" Java autocomplete source
Plug 'artur-shaik/vim-javacomplete2'
" Java checkstyle plugin
Plug 'vim-scripts/java_checkstyle.vim'
" Close all other buffers
Plug 'schickling/vim-bufonly'
" Add more mappings for jumps
Plug 'tpope/vim-unimpaired'
call plug#end()

""" Options

" True color support
set termguicolors
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
" When hitting o/O on a commented line, continue the comment
set formatoptions+=o
" Don't auto-wrap text with textwidth
set formatoptions-=t
" No scroll offset
set scrolloff=0
" Always have a status line
set laststatus=2
" Show line numbers
set number
" Show relative line numbers
set relativenumber
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
" Some plugin is setting virtualedit to one more (allows
" cursor to go one past the last character)
set virtualedit=""
" Use vertical splits for diffs
set diffopt=filler,vertical

" Enable % to match more than braces
runtime macros/matchit.vim

" Set colorscheme
colorscheme gruvbox

"" General mappings
nnoremap <leader>/ :noh<CR>
nnoremap <leader>x :pclose<CR>:ccl<CR>:helpclose<CR>
nnoremap <tab> :b#<CR>`"
nnoremap <A-h> :bp<CR>
nnoremap <A-l> :bn<CR>
nnoremap <A-q> :tabclose<CR>
nnoremap <leader>bp :bprev<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>ose :set spell<CR>
nnoremap <leader>osd :set nospell<CR>
nnoremap <leader>ope :set paste<CR>
nnoremap <leader>opd :set nopaste<CR>
nnoremap <leader>ej :%!python -m json.tool<CR>
vnoremap <leader>ej :!python -m json.tool<CR>
" Delete current buffer, go to last
nnoremap <leader>bd :bp<bar>bd #<CR>
" Copy filepath:line_number to clipboard
nnoremap <leader>yc :let @+ = expand("%:p") . ":" . line(".")<CR>

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
  au Syntax * call matchadd('Debug', '\W\zs\(REVIEW\|NOTE\|INFO\|IDEA\)')

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
	set omnifunc=syntaxcomplete#Complete
  au FileType java setlocal omnifunc=javacomplete#Complete

  "" Other
  " 4-spaces for python and java
  au filetype python setlocal ts=4 sts=4 sw=4
  au filetype java   setlocal ts=4 sts=4 sw=4
  au filetype coffee setlocal ts=4 sts=4 sw=4 noexpandtab
  au filetype jade   setlocal ts=4 sts=4 sw=4 noexpandtab
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
autocmd! VimEnter * command! -nargs=* -complete=file AgRaw :call fzf#vim#ag_raw(<q-args>)
nnoremap <leader>aa :AgRaw ""<left>
nnoremap <leader>au :AgRaw -s ""<left>\b<C-r><C-w>\b<CR>
vnoremap <leader>aa y:AgRaw ""<left><C-r>0
" Put cursor in field for file include regex
nnoremap <leader>ag :AgRaw -G
vnoremap <leader>ag y:AgRaw -G <C-r>0
" Only search specific file types
nnoremap <leader>agr :AgRaw -G "\.rb" ""<left>
vnoremap <leader>agr y:AgRaw -G "\.rb" ""<left><C-r>0
nnoremap <leader>agj :AgRaw -G "\.js" ""<left>
vnoremap <leader>agj y:AgRaw -G "\.js" ""<left><C-r>0
nnoremap <leader>agh :AgRaw -G "\.hs" ""<left>
vnoremap <leader>agh y:AgRaw -G "\.hs" ""<left><C-r>0

"" Dash
" Search dash for current word
noremap <leader>d :Dash<CR>
" Open command mode to search dash
nnoremap <leader>D :Dash<space>

"" Fugitive
" Status without untracked files
noremap <Leader>gs :Gina status<CR>
" Diff all files
noremap <Leader>gd :Gina compare :<CR>
" Blame current file
noremap <Leader>gb :Gina blame : --width=40<CR>
" 3-way patch current file
noremap <Leader>gp :Gina patch<CR>
" Commit changes (in a new tab)
noremap <Leader>gc :Gina commit -v<CR><C-W>T
" Reset to head
noremap <Leader>gr :Gina checkout -- %<CR>:e<CR>
" Add
noremap <Leader>gw :Gina add %<CR>

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
let g:hardtime_maxcount = 2
" Set what keys hardtime will throttle
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>", "n", "w", "b", "W", "B", "e", "E", ";", "{", "}", "<C-d>", "<C-u>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
" nnoremap <leader>ho :HardTimeOff<CR>
" nnoremap <leader>ht :HardTimeToggle<CR>

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
let g:neomake_python_enabled_makers = ['flake8', 'mypy']
let g:neomake_rust_enabled_makers = ['cargo']
let g:neomake_javascript_enabled_makers = ['flow', 'eslint']
let g:neomake_jsx_enabled_makers = ['flow', 'eslint']
autocmd! BufWritePost *.rs :Neomake cargo
let g:neomake_swift_swiftlint_maker = {
      \ 'args': ['lint', '--config', './.swiftlint.yml', '--quiet'],
      \ 'errorformat': '%f:%l:%c: %trror: %m,%f:%l:%c: %tarning: %m,%f:%l: %tarning: %m,%f:%l: %trror: %m',
      \ 'append_file': 0,
      \ }
let g:neomake_swift_enabled_makers = ['swiftlint']
autocmd! BufWritePost *.swift :NeomakeSh swift build

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
  let g:deoplete#omni#input_patterns.swift =
  \ ['[^. *\t]\.\w*']
	let g:deoplete#omni#input_patterns.java = '[^. *\t]\.\w*'
endif
" Tab for completion
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['omni', 'snippet', 'tag', 'buffer']
let g:deoplete#tag#cache_limit_size = 100000000
" Manual completion when wanted
inoremap <silent><expr> <C-x><C-o>
      \ pumvisible() ? "\<C-n>" :
      \ deoplete#mappings#manual_complete()

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
let g:airline_section_c = '%t'
let g:airline_section_x = ''
let g:airline_section_y = ''
" Make section z (line number, column, etc) less cluttered
let g:airline_section_z = '%l:%c'

"" Rust racer
let g:racer_cmd="/Users/marcusbuffett/.cargo/bin/racer"
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

"" Slimux
map <Leader>sl :SlimuxREPLSendLine<CR>
vmap <Leader>ss :SlimuxREPLSendSelection<CR>
map <Leader>sa mzggVG:SlimuxREPLSendSelection<CR>`z
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

"" Unite
nnoremap <leader>uy :<C-u>Unite -start-insert -no-split -buffer-name=tags    outline<cr>
nnoremap <leader>ue :<C-u>Unite -start-insert -no-split -buffer-name=buffer  buffer<cr> 
nnoremap <leader>uq :<C-u>Unite -start_insert -no-split -buffer-name=buffer -quick-match buffer<cr>
nnoremap <leader>um :<C-u>Unite -start-insert -no-split -buffer-name=marks -quick-match mark<cr>
nnoremap <leader>up :<C-u>Unite -start-insert -no-split -buffer-name=mappings -quick-match mapping<cr>

function! s:goyo_enter()
  set wrap
  set linebreak
  Limelight
endfunction

function! s:goyo_leave()
  set nowrap
  set nolinebreak
  Limelight!
endfunction

let g:vim_markdown_new_list_item_indent = 2

"" Markology
let g:markology_textlower="\t"
let g:markology_textupper="\t"
let g:markology_textother="\t"

highlight MarkologyHLl guifg=#D688AF guibg=#3A3A3A
highlight MarkologyHLu guifg=#D688AF guibg=#3A3A3A
highlight MarkologyHLo guifg=#D688AF guibg=#3A3A3A
highlight MarkologyHLm guifg=#D688AF guibg=#3A3A3A
set updatetime=1000

"" Unite mark
let g:unite_source_mark_marks =
\   "abcdefghijklmnopqrstuvwxyz"
\ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
\ . "0123456789.'`^<>[]{}()\""

"" Monster
" Set async completion.
let g:monster#completion#rcodetools#backend = "async_rct_complete"
" With deoplete.nvim
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}

"" Scratch
let g:scratch_insert_autohide = 0
let g:scratch_filetype = "markdown"
let g:scratch_persistence_file = "/tmp/scratch.vim"
let g:scratch_height = 20

"" vim-notes
let g:notes_directories = ['~/Documents/notes/v-notes']
" let g:notes_smart_quotes = 0

"" vimwiki
nmap <Leader>wf <Plug>VimwikiFollowLink
vmap <Leader>wf <Plug>VimwikiFollowLink
nmap <Leader>we <Plug>VimwikiSplitLink
nmap <Leader>wq <Plug>VimwikiVSplitLink
nmap <Leader>wb <Plug>VimwikiGoBackLink
nmap <Leader>wp <Plug>VimwikiPrevLink
nmap <Leader>wn <Plug>VimwikiNextLink

nmap <Leader>w= <Plug>VimwikiAddHeaderLevel
nmap <Leader>w- <Plug>VimwikiRemoveHeaderLevel
nmap <Leader>w+ <Plug>VimwikiNormalizeLink
vmap <Leader>w+ <Plug>VimwikiNormalizeLinkVisual
map  <Leader>wl <Plug>VimwikiToggleListItem

"" neosnippet / deoplete
imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><CR> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
if has('conceal')
  set conceallevel=2
endif

"" bufonly
nmap <Leader>bo :BufOnly<CR>

" Rust src path
let $RUST_SRC_PATH = "/Users/marcusbuffett/.multirust/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src"
