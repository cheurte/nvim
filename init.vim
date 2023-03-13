let g:polyglot_disabled = ['markdown']
let g:polyglot_disabled = ['markdown.plugin']
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
autocmd Filetype * AnyFoldActivate
set foldlevel=99
hi Folded term=underline
set foldcolumn=3
set number " add line numbers
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set cursorcolumn
set ttyfast                 " Speed up scrolling in Vim
set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
set backupdir=~/.cache/vim " Directory to store backup files.
"
let g:airline_powerline_fonts = 1
set t_Co=256
" Tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <C-t> :tabnew<CR>

" Space bar to write a command
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing Alt+j, Alt+k, Alt+h, or Alt+l.
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END
" windows
" nnoremap <>
inoremap jj <ESC>

" Automatic tab
vnoremap < <gv
vnoremap > >gv

call plug#begin("~/.vim/plugged")

    "Plugin Section

    " Appearence
     Plug 'ryanoasis/vim-devicons'
    set encoding=UTF-8
    " Theme & ariline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/gruvbox-material'
    Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
    Plug 'jacoborus/tender.vim'
    Plug 'ayu-theme/ayu-vim'
    Plug 'Yggdroot/indentLine'
    "
    " Tree
    Plug 'scrooloose/nerdtree'
    Plug 'PhilRunninger/nerdtree-visual-selection'

    " Starting
    Plug 'mhinz/vim-startify'

    " Auto pairs
    Plug 'jiangmiao/auto-pairs'

    " Auto completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Jedi python

    " Comment
    Plug 'tomtom/tcomment_vim'

    " Sudo modifying files
    Plug 'lambdalisue/suda.vim'

    " Battery
    Plug 'lambdalisue/battery.vim'

    " wildmenu
    function! UpdateRemotePlugins(...)
        " Needed to refresh runtime files
        let &rtp=&rtp
        UpdateRemotePlugins
    endfunction

    Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }

    " Folding
    Plug 'pseewald/vim-anyfold'

    " Language
    Plug 'sheerun/vim-polyglot'

    " search file
    Plug 'ctrlpvim/ctrlp.vim'   

    Plug 'tpope/vim-surround'

call plug#end()

set termguicolors
syntax enable
" set background=dark 

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_foreground = 'original'
let g:gruvbox_material_disable_italic_comment='-1'
let g:gruvbox_material_enable_bold='0'
colorscheme gruvbox-material
" colorscheme tokyonight-night

set guifont=DroidSansMono\ Nerd\ Font\ 11

" Vim jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Nerd Tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Open the existing NERDTree on each new tab.
let NERDTreeMapOpenInTab='t'
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Have nerdtree ignore certain files and directories.
" let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" Autocompletion
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
     \ coc#pum#visible() ? coc#pum#next(1) :
     \ CheckBackspace() ? "\<Tab>" :
     \ coc#refresh()

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Json files
autocmd FileType json syntax match Comment +\/\/.\+$+

" config file
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')

" To run cargo run automatically

" commenter
nnoremap <C-c> :TComment<CR>
vnoremap <C-c> :TComment<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='base16'
" let g:airline_theme = 'tender'
" let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_highlighting_cache = 1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols                                                                                                                              
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Terminal mode 
:tnoremap <Esc> <C-\><C-n>

" Battery
set tabline=...%{battery#component()}...
set statusline=...%{battery#component()}...
let g:battery#update_tabline = 1    " For tabline.
let g:battery#update_statusline = 1 " For statusline.
let g:airline#extentions#battery#enabled = 1
let g:battery#update_interval = 30000
let g:battery_watch_on_startup = 1
function! Battery_icon() 
  let l:battery_icon = {
    \ 5: " ",
    \ 4: " ",
    \ 3: " ",
    \ 2: " ",
    \ 1: " "}
    
  let l:backend = battery#backend()
  let l:nf = float2nr(round(backend.value / 20.0))
  return printf('%s', get(battery_icon, nf))
endfunction
let g:airline_section_x = airline#section#create(['%{battery#sign()} %{battery#value()}%% %{Battery_icon()}'])

" Tab show
let g:indentLine_setColors = 0
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Number fix and relative
:augroup numertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" wild menu plugin
call wilder#setup({'modes': [':', '/', '?']})

call wilder#set_option('pipeline', [
    \   wilder#branch(
    \    wilder#cmdline_pipeline({
    \       'language': 'python',
    \       'fuzzy': 1,
    \     }),
    \     wilder#cmdline_pipeline(),
    \     wilder#python_search_pipeline({
    \       'pattern': wilder#python_fuzzy_pattern(),
    \       'sorter': wilder#python_difflib_sorter(),
    \       'engine': 're',
    \   }),
    \   ),
    \ ])

call wilder#set_option('renderer', wilder#popupmenu_renderer({
    \ 'highlighter': [
    \   wilder#lua_pcre2_highlighter(),
    \   wilder#lua_fzy_highlighter(),
    \ ],
    \ 'highlights': {
    \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
    \ },
    \ 'pumblend':100,
    \ 'left': [
    \   ' ', wilder#popupmenu_devicons(),
    \ ],
    \ 'right': [
    \   ' ', wilder#popupmenu_scrollbar(),
    \ ],
    \ }))

call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
    \ 'highlights': {
    \   'border': 'Normal',
    \ },
    \ 'border': 'rounded',
    \ })))

" call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_palette_theme({
"     \ 'border': 'rounded',
"     \ 'max_height': '75%',
"     \ 'min_height': 0,
"     \ 'prompt_position': 'top',
"     \ 'reverse': 0,
"     \ })))

" call wilder#set_option('renderer', wilder#renderer_mux({
"       \ ':': wilder#popupmenu_renderer(wilder#popupmenu_palette_theme()),
"       \ '/': wilder#popupmenu_renderer(),
"       \ }))
" Python
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


autocmd FileTpe rust map <buffer> <F9> :w<CR>:exec '!cargo run'<CR>
