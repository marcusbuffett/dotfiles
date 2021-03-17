" Plugins
call plug#begin('~/.vim/plugged')
" Fuzzy searching for everything
Plug 'junegunn/fzf'
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
Plug 'Valloric/ListToggle'
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
" Easy motion
Plug 'easymotion/vim-easymotion'
" Moving between hunks, sigss for changed lines
" Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
" Delete other buffers
Plug 'schickling/vim-bufonly'
" Delete current buffer, maintain layout
Plug 'moll/vim-bbye'
" JSX/Javascript stuff, there's way too many of these
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
" Nice status bar
Plug 'itchyny/lightline.vim'
" Completion
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Coc-snippets needs snippet sources
Plug 'mlaursen/vim-react-snippets'
Plug 'honza/vim-snippets'
" Navigation by indent level
Plug 'jeetsukumaran/vim-indentwise'
" Plug 'mtikekar/nvim-send-to-term'
" Exchange operator
Plug 'tommcdo/vim-exchange'
" Correct syntax highlighting for styled components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"" Better Haskell syntax highlighting / indentation
Plug 'neovimhaskell/haskell-vim'
" Some nice movement stuff
Plug 'liuchengxu/vim-clap'
" File formatting, on save
" Plug 'sbdchd/neoformat'
" Purescript syntax / indentation
Plug 'purescript-contrib/purescript-vim'
" Git log for files
Plug 'int3/vim-extradite'
" Undo tree
Plug 'simnalamburt/vim-mundo'
" Symbol outliner
Plug 'liuchengxu/vista.vim'
" Layout manager
Plug 'paroxayte/vwm.vim'
" floating terminals
Plug 'voldikss/vim-floaterm'
Plug 'chrisbra/unicode.vim'
Plug '907th/vim-auto-save'
Plug 'evanleck/vim-svelte'
Plug 'vn-ki/coc-clap'
call plug#end()


""" Options

" True color support
set termguicolors
" set shellcmdflag=-ic
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
set nobackup
" Set spelling language to us english
set spelllang=en_us
" Use vertical splits for diffs
set diffopt=filler,vertical
" cause more trouble than they're worth
set noswapfile
" Indent folding works better in most file types
set foldmethod=indent
" Don't start folded
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=99
set foldcolumn=0
" JSX highlighting gets screwed up in long files, this makes vim detect syntax
" from the beginning of the file
autocmd BufEnter * :syntax sync fromstart
" When wrap is on, break more reasonably
set linebreak
" Python 3
set pyx=3
let g:python3_host_prog = '~/.pyenv/shims/python'
set autoread
" No ex mode
nnoremap Q <nop>
set undofile
set undodir=~/.vim/undo
set lazyredraw
set magic


" Enable % to match more than braces
runtime macros/matchit.vim

" Set colorscheme
colorscheme afterglow

"" General mappings
nnoremap <tab> :b#<CR>`"
nnoremap <leader>bi <C-w>o
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
" Clipboard
nmap <leader>y "*y
vmap <leader>y "*y
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
nnoremap ,l :Clap blines<CR>
nnoremap ,c :Clap bcommits<CR>
nnoremap ,b :Clap buffers<CR>
" nnoremap , :Clap colors<CR>
nnoremap ,c :Clap command<CR>
" nnoremap , :Clap commits<CR>
nnoremap ,f :Clap files<CR>
nnoremap ,g :Clap gfiles<CR>
nnoremap ,d :Clap git_diff_files<CR>
nnoremap ,a :Clap grep<CR>
nnoremap ,j :Clap jumps<CR>
nnoremap ,s :Clap lines<CR>
nnoremap ,m :Clap marks<CR>
nnoremap ,r :Clap registers<CR>
nnoremap ,t :Clap tags<CR>
nnoremap ,y :Clap yanks<CR>
nnoremap ,w :Clap windows<CR>
" Search all files for text
nnoremap <leader>aa :RgText<CR>
nnoremap <leader>al :RgText<CR>
nnoremap <leader>an :RgText<CR>
nnoremap <leader>af :Rg<CR>
nnoremap <leader>au :RgText \b<C-r><C-w>\b<CR>
vnoremap <leader>aa y:Rg <C-r>0<CR>
command! -bang GitFilesWithWorkspace call fzf#run(fzf#wrap({ 'source': '{ git ls-files -o -c --exclude-standard .; }' }, <bang>0))
command! -bang FilesWithWorkspace call fzf#run(fzf#wrap({ 'source': '{ find .; find /Users/marcusbuffett/Documents/workspace; }' }, <bang>0))
command! -bang -nargs=* RgText call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
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

"" Extradite
noremap <Leader>ge :Extradite<CR>

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
map <leader>nn :NERDTreeToggle<CR>
" Move cursor to nerdtree
map <leader>nl :NERDTreeFocus<CR>
" Find the current file in nerdtree and move cursor
map <leader>nf :NERDTreeFind<CR>
" Why NERDTree uses '?' as its help command is beyond me...
let NERDTreeMapHelp='<f1>'
let NERDTreeAutoDeleteBuffer=1
" Because this messes with ctrl-j/k
let g:NERDTreeMapJumpNextSibling = '<Nop>'
let g:NERDTreeMapJumpPrevSibling = '<Nop>'
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''


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

""bbye
nmap <Leader>bq :Bwipeout<CR>

" vim-jsx
let g:jsx_ext_required = 0


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
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:coc_global_extensions = ['coc-ultisnips', "coc-snippets", "coc-lists", "coc-emmet", "coc-diagnostic", "coc-tsserver", "coc-rls", "coc-python", "coc-json", "coc-html", "coc-css", "coc-pairs"]
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

nnoremap <silent> [e <Plug>(coc-diagnostic-prev-error)
nnoremap <silent> ]e <Plug>(coc-diagnostic-next-error)
nmap <silent> ]d :call CocAction('diagnosticNext')<cr>
nmap <silent> [d :call CocAction('diagnosticPrevious')<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>cn <Plug>(coc-rename)


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction



autocmd CursorHold * silent call CocActionAsync('highlight')

" Ale 
" let g:ale_linters = {'python': []}

" Vista
let g:vista_default_executive = 'coc'
inoremap <Leader>vo :Vista

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

xmap <leader>cf <Plug>(coc-format-selected)
nmap <leader>cf <Plug>(coc-format-selected)
nmap <leader>.  <Plug>(coc-fix-current) \| :w<CR>
nmap <leader>a  <Plug>(coc-codeaction-selected)
vmap <leader>a  <Plug>(coc-codeaction-selected)
vmap <leader>as  <Plug>(coc-codeaction-line)
nmap <silent> <leader>af :call CocAction('fixAll')<cr>
nmap <silent> <leader>ar :call CocAction('doQuickfix')<cr>
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>xq  :q<CR>
nmap <leader>xw  :wq<CR>
nmap <Leader>cd :CocDiagnostics<CR>
nnoremap <silent><nowait> <leader>d  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <leader>cc  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <leader>co  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <leader>cs  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>cr  :<C-u>CocListResume<CR>
nmap <Leader>cp :CocConfig<CR>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Nerd Commenter
let g:NERDCreateDefaultMappings = 0
nmap <leader>c<space> <Plug>NERDCommenterToggle
vmap <leader>c<space> <Plug>NERDCommenterToggle
nmap <leader>cm <Plug>NERDCommenterMinimal
vmap <leader>cm <Plug>NERDCommenterMinimal


" augroup fmt
  " autocmd!
  " autocmd FileType typescript.tsx autocmd BufWritePre <buffer> call CocAction('runCommand', 'prettier.formatFile')
" augroup END

command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Base mappings
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>

let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_haskell = ['ormolu']

"Mundo
nnoremap <Leader>mu :MundoToggle<CR>

"vwm
let s:dev_panel = {
      \  'name': 'dev_panel',
      \  'openAftr': ['edit'],
      \  'left':
      \  {
      \    'v_sz': 33,
      \    'init': ['NERDTree'],
      \    'bot': {
      \      'init': ['Vista', 'sleep 1500ms']
      \    }
      \  }
      \}

let g:vwm#layouts = [s:dev_panel]

nnoremap <leader>ld :VwmOpen dev_panel<CR>
" noremap <Leader>gs :FloatermNew lazygit<CR>

" function! s:fuzzyfind(dir) abort
    " " Ignore .git directories
    " let items = printf('find %s -name .git -prune -o -type f -print', a:dir)
    " return fzy#start(items, {i -> execute('edit ' . fnameescape(i))}, {
            " \ 'statusline': printf(':edit {fname} [directory: %s]', a:dir)
            " \ })
" endfunction

" command! -bar -nargs=? -complete=dir Find
        " \ call s:fuzzyfind(empty(<q-args>) ? getcwd() : <q-args>)

" Ale 
" let g:ale_linters = {'python': []}
" let g:ale_list_vertical = 0
" let g:ale_open_list = 1
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:ale_purescript_ls_config = {
		" \  'purescript': {
		" \    'addSpagoSources': v:true,
		" \    'addNpmPath': v:true,
		" \    'buildCommand': 'spago build --purs-args --json-errors --purs-args --stash --purs-args --censor-codes=MissingTypeDeclaration,UnusedImport'
		" \  }
		" \}
" nmap <leader>cn :ALENextWrap<CR>
" nmap <leader>cp :ALEPreviousWrap<CR>
"

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "tsx", "typescript" },  -- list of language that will be disabled
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF
