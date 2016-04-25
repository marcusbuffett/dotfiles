""" vim-plug
" PlugInstall to install plugins
" PlugClean to remove unused plugins
" PlugUpdate to update installed plugins
" UpdateRemotePlugins to update some neovim plugins
call plug#begin('~/.vim/plugged')

if has('nvim')
  " Autocomplete
  Plug 'Shougo/deoplete.nvim'
  " Syntax checking + linting + static code analysis
  Plug 'benekastah/neomake'
else
  " Autocomplete
  Plug 'Valloric/YouCompleteMe'
  " Syntax checking + linting + static code analysis
  Plug 'scrooloose/syntastic'
endif

" Fuzzy searching for everything
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Git wrapper
Plug 'lambdalisue/vim-gita'
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
" Send ctrl-h, ctrl-j, ctrl-k, ctrl-l to tmux if there is no window
Plug 'christoomey/vim-tmux-navigator'
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
Plug 'marijnh/tern_for_vim'
" Toggle location list / quickfix list
Plug 'Valloric/ListToggle'
" Substitute command that intelligently changes case, plurality,etc.
Plug 'tpope/vim-abolish'
" Highlight matching HTML tag
Plug 'gregsexton/MatchTag'
" " File explorer
Plug 'scrooloose/nerdtree'
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
" Set cwd to root of git project if exists
Plug 'airblade/vim-rooter'
" Needed by other plugins
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Dependency of other plugins
Plug 'xolox/vim-misc'
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
" When hitting enter on a commented line, continue the comment
set formatoptions-=cr
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
set timeoutlen=500 
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

" Enable % to match more than braces
runtime macros/matchit.vim

" Set colorscheme
colorscheme solarized

" General mappings
nnoremap <leader>w :wa<CR>
nnoremap <leader>q :wq<CR>
nnoremap <leader>/ :noh<CR>
nnoremap <leader>x :pclose<CR>:ccl<CR>:helpclose<CR>
nnoremap <tab> :b#<CR>

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
" Search tags
nnoremap <leader>fb :Tags<CR>
" Search files
nnoremap <leader>fp :Files<CR>
" Search git files
nnoremap <leader>fg :GitFiles<CR>
" Search lines in current file
nnoremap <leader>fs :BLines<CR>

" Ag with all options supported
function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': &acd ? fnamemodify(parts[0], ':p') : parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2
    return
  endif

  let cmd = get(get(g:, 'fzf_action', s:default_action), a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  try
    execute cmd s:escape(first.filename)
    execute first.lnum
    execute 'normal!' first.col.'|zz'
  catch
  endtry

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

" query, [[ag options], options]
function! fzf#vim#ag(query, ...)
  echo a:query
  let args = copy(a:000)
  echo args
  let ag_opts = len(args) > 1 ? remove(args, 0) : ''
  echo ag_opts
  echo printf('ag --nogroup --column --color %s',
  \                   empty(a:query) ? '^(?=.)' : a:query)

  call fzf#run({
  \ 'source':  printf('ag --nogroup --column --color %s',
  \                   empty(a:query) ? '^(?=.)' : a:query),
  \ 'sink*':    function('s:ag_handler'),
  \ 'options': '--ansi --delimiter : --nth 4..,.. --prompt "Ag> " '.
  \            '--multi --bind alt-a:select-all,alt-d:deselect-all '.
  \            '--color hl:68,hl+:110'})
endfunction
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, s:w(<bang>0))

"" Dash
" Search dash for current word
nnoremap <leader>d :Dash<CR>
" Open command mode to search dash
nnoremap <leader>D :Dash 

"" Ag
" Search all files for text
nnoremap <leader>aa :Ag ""<left>
" Put cursor in field for file include regex
nnoremap <leader>ag :Ag -G "" ""<left><left><left><left>
" Only search specific file types
nnoremap <leader>agr :Ag -G "\.rb" ""<left>
nnoremap <leader>agj :Ag -G "\.js" ""<left>
nnoremap <leader>agh :Ag -G "\.hs" ""<left>
" TODO make a mapping to search for only matches that are in the same
" filetype as the current file

"" Gita
" Status without untracked files
noremap <Leader>gs :Gita status --untracked-files=no<CR>
" Status with untracked files
noremap <Leader>ga :Gita status<CR>
" Diff current file
noremap <Leader>gd :Gita diff<CR>
" Diff current file against cached file
noremap <Leader>gdc :Gita diff --cached<CR>
" Blame current file
noremap <Leader>gb :Gita blame<CR>
" Patch current file
noremap <Leader>gp :Gita patch<CR>
" Stage the current file
noremap <Leader>gw :Gita add %<CR>
" Commit staged changes
noremap <Leader>gc :Gita commit<CR>

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

"" Syntastic / Neomake
" Use syntastic for vim, neomake for neovim
if has('nvim')
  " Check file after every write
  autocmd! BufWritePost * Neomake
  " Check file after every read
  autocmd! BufReadPost * Neomake
  " Only use rubocop for ruby
  let g:neomake_ruby_enabled_makers = ['rubocop']
else
  " Check on save
  let g:syntastic_mode_map = { "mode": "active"}
  " Check on open
  let g:syntastic_check_on_open=1
  " Populate the location list with warnings/errors
  let g:syntastic_always_populate_loc_list = 1
  " Enable language-specific checkers
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_scss_checkers = ['scss_lint']
  let g:syntastic_ruby_checkers = ['rubocop']
  let g:syntastic_coffee_checkers = ['coffeelint']
endif


"" YouCompleteMe and Deoplete
" Use YouCompleteMe for vim, Deoplete for neovim
if has('nvim')
  " Enabel deoplete
  let g:deoplete#enable_at_startup = 1
  " If there aren't input patterns set for completion, set it to {}
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  " Tab for completion
  inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
else
  " Set what keys trigger YouCompleteMe
  let g:ycm_semantic_triggers = {
      \   'scss': [ 're!^\s{4}', 're!:\s+' ],
      \   'css' : [ 're!^\s{4}', 're!:\s+' ],
      \   'javascript' : ["require"],
      \   'haskell' : ["."]
  \ }
  " Only require one char to trigger completion
  let g:ycm_min_num_of_chars_for_completion = 1
endif

"" Ultisnips
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
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
let g:airline_detect_whitespace=0
