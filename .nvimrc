" Plugins
call plug#begin('~/.vim/plugged')
" Fuzzy searching for everything
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Git wrapper
Plug 'tpope/vim-fugitive'
" Commenting
Plug 'scrooloose/nerdcommenter'
" Colorschemes
Plug 'rafi/awesome-vim-colorschemes'
" Plug 'qualiabyte/vim-colorstepper'
" Aligning of text using :Tabularize
Plug 'godlygeek/tabular'
" Adds operations like cs]) to change [test] to (test)
Plug 'tpope/vim-surround'
" Prevent repetitive key use in vim
Plug 'takac/vim-hardtime'
" Toggle location list / quickfix list
" Plug 'Valloric/ListToggle'
" Substitute command that intelligently changes case, plurality,etc.
Plug 'tpope/vim-abolish'
" Highlight matching HTML tag
Plug 'gregsexton/MatchTag'
" File explorer
Plug 'scrooloose/nerdtree'
" Send ctrl-h, ctrl-j, ctrl-k, ctrl-l to tmux if there is no window
Plug 'christoomey/vim-tmux-navigator'
" Allows other plugins to support the repeat command (.)
Plug 'tpope/vim-repeat'
" JSX support
Plug 'MaxMEllon/vim-jsx-pretty'
" Indent guides, useful for callback-hell and HTML
Plug 'nathanaelkane/vim-indent-guides'
" Easy motion
Plug 'easymotion/vim-easymotion'
" Moving between hunks, sigss for changed lines
Plug 'mhinz/vim-signify'
" Delete other buffers
Plug 'schickling/vim-bufonly'
" JSX/Javascript stuff
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
" Airline but faster
Plug 'itchyny/lightline.vim'
" Completion
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'honza/vim-snippets'
" Coc-snippets needs a Snippets source
Plug 'mlaursen/vim-react-snippets'
" Navigation by indent level
Plug 'jeetsukumaran/vim-indentwise'
" Plug 'mtikekar/nvim-send-to-term'
" Exchange operator
Plug 'tommcdo/vim-exchange'
" Get path to a json key
Plug 'mogelbrod/vim-jsonpath'
" Correct syntax highlighting for styled components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" GHCi REPL for Haskell
" Plug 'parsonsmatt/intero-neovim'
"" Better Haskell syntax highlighting / indentation
Plug 'neovimhaskell/haskell-vim'
call plug#end()

""" Options

" True color support
set termguicolors
set shellcmdflag=-ic
" Set leader to space
let mapleader="\<Space>"
" Copy indent from current line when inserting new line
set autoindent
" Make backspace work as expected
set backspace=indent,eol,start
" No beeps
set belloff=all
" Support hidden buffers, required for some pluigns to work
set hidden
" Highlight matches as the search is type
set incsearch
" Sometimes it's hard to see the cursor when hlsearch is on, and it's not that
" useful
set nohlsearch
" Ignore case when searching
set ignorecase
" Don't ignore case when there is a capital in the search
set smartcase
" Don't wrap lines
set nowrap
" I like 2 spaces, and no tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
" Set text width (used for comments)
set textwidth=80
" When hitting enter on a commented line, continue the comment
set formatoptions+=r
" When hitting o/O on a commented line, continue the comment
set formatoptions+=o
" Don't auto-wrap text with textwidth
set formatoptions-=t
" Always have a status line, required for lightline
set laststatus=2
" use g flag for substitute by default, it's deprecated but it's too annoying to
" type /g at the end of every substitute command
set gdefault
" Intercept mouse events
set mouse=a
" Immediate timeout for escape codes
set timeoutlen=800
set ttimeoutlen=10
" Enable filetype detection
filetype on
" Enable filetype-specific indenting
filetype indent on
" Enable filetype-specific plugins
filetype plugin on
" Don't save twice, messes up some programs that watch for file changes
set nowritebackup
" Set spelling language to us english
set spelllang=en_us
" Use vertical splits for diffs
set diffopt=filler,vertical
" cause more trouble than they're worth
set noswapfile
" Indent folding works better in most file types
" set foldmethod=indent
" Don't start folded
set foldlevelstart=20
" JSX highlighting gets screwed up in long files, this makes vim detect syntax
" from the beginning of the file
autocmd BufEnter * :syntax sync fromstart
" When wrap is on, break more reasonably
set linebreak
" Python 3
set pyx=3
let g:python3_host_prog = '~/.pyenv/shims/python'

" Enable % to match more than braces
runtime macros/matchit.vim

" Set colorscheme
colorscheme onedark

"" General mappings
nnoremap <tab> :b#<CR>`"
nnoremap <leader>ose :set spell<CR>
nnoremap <leader>osd :set nospell<CR>
nnoremap <leader>ope :set paste<CR>
nnoremap <leader>opd :set nopaste<CR>
nnoremap <leader>owe :set wrap<CR>
nnoremap <leader>owd :set nowrap<CR>
nnoremap <leader>ej :%!python -m json.tool<CR>
vnoremap <leader>ej :!python -m json.tool<CR>
" Copy filepath:line_number to clipboard
nnoremap <leader>yc :let @+ = expand("%") . ":" . line(".")<CR>
nnoremap <leader>ym :let @+ = expand("%:t:r") . "#" . "<C-r><C-w>"<CR>
" Perform last subtitution on the current line ( or selected area )
map <Leader>br :s/\<<C-r>-\>/<C-r>.<CR>

" Augroup for editing
augroup EditVim
  au!
  " Run files using <leader>r, respecting file type
  au filetype python     nnoremap <leader>r  :!python %<CR>
  au filetype haskell    nnoremap <leader>r  :!runhaskell %<CR>
  au filetype javascript nnoremap <leader>r  :!node %<CR>
  au filetype haskell    nnoremap <leader>rc :!stack run<CR>
  au filetype ruby       nnoremap <leader>r  :!ruby %<CR>
  au filetype ruby       nnoremap <leader>rb :!bundle exec ruby %<CR>
  au filetype php        nnoremap <leader>r  :!php %<CR>
  au filetype rust        nnoremap <leader>r  :!cargo run<CR>

  au Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
  au Syntax * call matchadd('Debug', '\W\zs\(REVIEW\|NOTE\|INFO\|DONE\|IDEA\)')

  """ Filetype-specific mappings
  "" Haskell
  " Search hoogle
  au filetype haskell nnoremap <leader>h :!hoogle --count=5 ""<Left>

  "" JavaScript

  "" Other
  " 4-spaces for python and java
  au filetype python setlocal ts=4 sts=4 sw=4
  au filetype java   setlocal ts=4 sts=4 sw=4
  au filetype swift  setlocal ts=4 sts=4 sw=4
  au filetype html   setlocal ts=4 sts=4 sw=4
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
" nnoremap <leader>fp :Files getcwd()<CR>
nnoremap <leader>fa :FilesWithWorkspace<CR>
" echo { 'source': '{ git ls-files; find /Users/marcusbuffett/Documents/workspace; }' }
" Search git files
nnoremap <leader>fp :GitFilesWithWorkspace<CR>
" Search lines in current file
nnoremap <leader>fs :BLines<CR>
" Search all files for text
nnoremap <leader>aa :RgText<CR>
nnoremap <leader>al :RgText<CR>
nnoremap <leader>an :RgText<CR>
nnoremap <leader>af :Rg<CR>
nnoremap <leader>au :RgText \b<C-r><C-w>\b<CR>
vnoremap <leader>aa y:Rg <C-r>0<CR>
command! -bang GitFilesWithWorkspace call fzf#run(fzf#wrap({ 'source': '{ git ls-files -o -c --exclude-standard .; }' }, <bang>0))
command! -bang FilesWithWorkspace call fzf#run(fzf#wrap({ 'source': '{ find .; find /Users/marcusbuffett/Documents/workspace; }' }, <bang>0))
command! -bang -nargs=* RgText
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>).' $( git ls-files -o -c --exclude-standard | xargs)', 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%'),
  \   1)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>).' /Users/marcusbuffett/Documents/workspace .', 1,
  \   fzf#vim#with_preview('up:60%'),
  \   1)
" command! -bang -nargs=* Rg
  " \ call fzf#vim#grep(
  " \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  " \   <bang>0 ? fzf#vim#with_preview('up:60%')
  " \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  " \   <bang>0)
" Put cursor in field for file include regex
" nnoremap <leader>ag :AgRaw -G
" vnoremap <leader>ag y:AgRaw -G <C-r>0
" Only search specific file types
" nnoremap <leader>agr :AgRaw -G "\.rb" ""<left>
" vnoremap <leader>agr y:AgRaw -G "\.rb" ""<left><C-r>0
" nnoremap <leader>agj :AgRaw -G "\.js" ""<left>
" vnoremap <leader>agj y:AgRaw -G "\.js" ""<left><C-r>0
" nnoremap <leader>agh :AgRaw -G "\.hs" ""<left>
" vnoremap <leader>agh y:AgRaw -G "\.hs" ""<left><C-r>0

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
" noremap <Leader>gl :Gina log<CR>

"" Merginal
noremap <Leader>ga :Merginal<CR>

"" ListToggle
" Toggle location list 
let g:lt_location_list_toggle_map = '<leader>tl'
" Toggle quickfix list 
let g:lt_quickfix_list_toggle_map = '<leader>tq'

"" Hardtime
" Enable hardtime
let g:hardtime_default_on = 0
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
let NERDTreeAutoDeleteBuffer=1


"" NerdCommenter
" Put one space after the comment character
let NERDSpaceDelims = 1

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
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)
vmap s <Plug>(easymotion-s2)
nmap <Leader>j <Plug>(easymotion-j)
vmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
vmap <Leader>k <Plug>(easymotion-k)

"" mtikekar/nvim-send-to-term
nmap <Leader>ts :SendHere<CR>
nmap <Leader>tu <Plug>SendLine
nmap <Leader>te <Plug>Send
vmap <Leader>te <Plug>Send

let g:send_disable_mapping = 1

" vim markdown
let g:vim_markdown_new_list_item_indent = 2

"" Scratch
let g:scratch_insert_autohide = 0
" let g:scratch_filetype = "markdown"
" let g:scratch_persistence_file = "/tmp/scratch.vim"
let g:scratch_height = 20
let g:scratch_persistence_file = '~/Documents/workspace/scratch'
let g:scratch_no_mappings = 1
let g:scratch_autohide = 0
nmap <leader>so :Scratch<CR>
xmap <leader>so <plug>(scratch-selection-reuse)

"" vim-notes
let g:notes_directories = ['~/Documents/notes/v-notes']
" let g:notes_smart_quotes = 0

if has('conceal')
  set conceallevel=0 concealcursor=niv
endif

"" bufonly
nmap <Leader>bo :BufOnly<CR>

" Rust src path
let $RUST_SRC_PATH = "/Users/marcusbuffett/.multirust/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src"

" LanguageClient
" \ 'python': ['python', '-m', 'pyls', '--log-file', './pyls_logs.txt'],
" let g:LanguageClient_serverCommands = {
    " \ 'python': ['python', '-m', 'pyls'],
    " \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    " \ 'swift': ['/Users/marcusbuffett/Documents/sources/langserver-swift/.build/x86_64-apple-macosx10.10/debug/langserver-swift']
    " \ }
" let g:LanguageClient_rootMarkers = {                                      
         " \ 'swift': ['AirCam.xcodeproj']                                          
         " \ }   
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_diagnosticsEnable = 0

" nnoremap <leader>gc :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" vim-jsx
let g:jsx_ext_required = 0

" ncm2 
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect
" imap <C-g> <Plug>(ncm2_manual_trigger)
" let ncm2#popup_delay = 60
" let ncm2#complete_length = [[1, 1]]

" ncm2 ultisnips
" autocmd VimEnter * iunmap <C-s>
" let g:UltiSnipsJumpForwardTrigger	= "<C-s>"
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
" let g:UltiSnipsJumpBackwardTrigger	= "<C-S>"
let g:UltiSnipsExpandTrigger = '<f5>'


" Indentwise
map <Leader>ih <Plug>(IndentWisePreviousLesserIndent)
map <Leader>ik <Plug>(IndentWisePreviousEqualIndent)
map <Leader>ip <Plug>(IndentWisePreviousGreaterIndent)
map <Leader>in <Plug>(IndentWiseNextLesserIndent)
map <Leader>ij <Plug>(IndentWiseNextEqualIndent)
map <Leader>il <Plug>(IndentWiseNextGreaterIndent)

" Tagbar
" let g:tagbar_autoclose = 1
let g:tagbar_map_showproto = ""
nnoremap <Leader>ft :exec 'TagbarAutoClose' <Bar> BLines<CR>

" Ultisnips
set runtimepath+=~/dotfiles/snippets/

" Python 3 stuff
let g:python_host_prog="/Users/marcusbuffett/.pyenv/versions/3.7.0/bin/python" 

" coc
" :CocInstall coc-python  coc-rls coc-html coc-lists coc-ultisnips coc-css coc-emmet
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction<Paste>

nmap <leader>rn <Plug>(coc-rename)

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            ]
      \ }
      \ }

nnoremap <silent> [e <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]e <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
autocmd CursorHold * silent call CocActionAsync('highlight')

" Ale 
" let g:ale_linters = {'python': []}
nnoremap <Leader>q :Bdelete<CR>

" Vista
let g:vista_default_executive = 'coc'

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript
augroup END

" Macros
function ExtractMissingStyledComponents()
    normal cwblah
endfunction
" nnoremap <Leader>c :call TransformNodeCallback()^M

nnoremap <Leader>so :14split ~/vimwiki/notes/scratch.md<CR>
nnoremap <Leader>sd :14split ~/vimwiki/Daily_TODO.md<CR>
nnoremap <Leader>sp :141split ~/vimwiki/notes/buffer_scratch.md<CR>

tnoremap <Esc> <C-\><C-n>

xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>ca :CocAction<CR>
nmap <leader>cc :CocCommand<CR>
nmap <Leader>cd :CocList diagnostics<CR>

" Nerd Commenter
let g:NERDCreateDefaultMappings = 0
nmap <leader>c<space> <Plug>NERDCommenterToggle
vmap <leader>c<space> <Plug>NERDCommenterToggle

