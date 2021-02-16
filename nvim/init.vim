call plug#begin('~/.config/nvim/plugged')

" General {{{
  "Abbreviations {{{
    abbr funciton function
    abbr teh the
    abbr tempalte template
    abbr fitler filter
    abbr cosnt const
    abbr attribtue attribute
    abbr attribuet attribute
  "}}}

  set autoread " detect when a file is changed

  set history=1000
  set textwidth=120

  set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set nobackup
  set nowritebackup
  set noswapfile

  " show results of substition as they're happening
  " but don't open a split
  set inccommand=nosplit
  " Disable ruby provider
  let g:loaded_ruby_provider = 0
  " Disable python2 provider
  let g:loaded_python_provider = 0

  set backspace=indent,eol,start
  set clipboard=unnamed
  set mouse=a

  " Searching
  set ignorecase " case insensitive searching
  set smartcase " case-sensitive if expresson contains a capital letter
  set hlsearch " highlight search results
  set incsearch " set incremental search, like modern browsers
  set nolazyredraw " don't redraw while executing macros
  set magic " Set magic on, for regex

  " error bells
  set noerrorbells
  set visualbell
  set t_vb=
  set tm=500
" }}}

" Appearance {{{
  set number " show line numbers
  set wrap " turn on line wrapping
  set wrapmargin=8 " wrap lines when coming within n characters from side
  set linebreak " set soft wrapping
  set showbreak=… " show ellipsis at breaking
  set autoindent " automatically set indent of new line
  set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
  set laststatus=2 " show the status line all the time
  set scrolloff=7 " set 7 lines to the cursors - when moving vertical
  set wildmenu " enhanced command line completion
  set hidden " current buffer can be put into background
  set showcmd " show incomplete commands
  set noshowmode " don't show which mode disabled for PowerLine
  set wildmode=list:longest " complete files like a shell
  set shell=$SHELL
  set cmdheight=1 " command bar height
  set title " set terminal title
  set showmatch " show matching braces
  set mat=2 " how many tenths of a second to blink
  set updatetime=300
  set signcolumn=yes
  set shortmess+=c

  " Tab control
  set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
  set tabstop=2 " the visible width of tabs
  set softtabstop=2 " edit as if the tabs are 4 characters wide
  set shiftwidth=2 " number of spaces to use for indent and unindent
  set shiftround " round indent to a multiple of 'shiftwidth'
  set expandtab

  " code folding settings
  set foldmethod=syntax " fold based on marker {{{}}}
  set foldlevelstart=99 " all folds closed at start
  set foldnestmax=10 " deepest fold is 10 levels
  set foldlevel=1
  set nofoldenable

  " toggle invisible characters
  set list
  set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
  set showbreak=↪

  set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
  " switch cursor to line when in insert mode, and block when not
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

  if &term =~ '256color'
      " disable background color erase
      set t_ut=
  endif

  " enable 24 bit color support if supported
  if (has("termguicolors"))
      if (!(has("nvim")))
          let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
          let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      endif
      set termguicolors
  endif

  " highlight conflicts
  match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

  " Load colorschemes
  Plug 'chriskempson/base16-vim'

  " LightLine {{{
      Plug 'itchyny/lightline.vim'
      Plug 'mike-hearn/base16-vim-lightline'
      let g:lightline = {
          \   'colorscheme': 'base16_seti',
          \   'active': {
          \       'left': [ [ 'mode', 'paste' ],
          \               [ 'gitbranch' ],
          \               [ 'readonly', 'filetype', 'filename' ]],
          \       'right': [ [ 'percent' ], [ 'lineinfo' ],
          \               [ 'fileformat', 'fileencoding' ],
          \               [ 'gitblame', 'currentfunction',  'cocstatus', 'linter_errors', 'linter_warnings' ]]
          \   },
          \   'component_expand': {
          \   },
          \   'component_type': {
          \       'readonly': 'error',
          \       'linter_warnings': 'warning',
          \       'linter_errors': 'error'
          \   },
          \   'component_function': {
          \       'fileencoding': 'helpers#lightline#fileEncoding',
          \       'filename': 'helpers#lightline#fileName',
          \       'fileformat': 'helpers#lightline#fileFormat',
          \       'filetype': 'helpers#lightline#fileType',
          \       'gitbranch': 'helpers#lightline#gitBranch',
          \       'cocstatus': 'coc#status',
          \       'currentfunction': 'helpers#lightline#currentFunction',
          \       'gitblame': 'helpers#lightline#gitBlame'
          \   },
          \   'tabline': {
          \       'left': [ [ 'tabs' ] ],
          \       'right': [ [ 'close' ] ]
          \   },
          \   'tab': {
          \       'active': [ 'filename', 'modified' ],
          \       'inactive': [ 'filename', 'modified' ],
          \   },
          \   'separator': { 'left': '', 'right': '' },
          \   'subseparator': { 'left': '', 'right': '' }
      \ }
  " }}}
" }}}

" General Mappings {{{
  let mapleader = ','

  "shortcut to save
  nmap <leader>, :w<cr>

  " edit ~/.config/nvim/init.vim
  map <leader>ev :e! ~/.config/nvim/init.vim<cr>
  " edit gitconfig
  map <leader>eg :e! ~/.gitconfig<cr>

  " clear highlighted search
  noremap <space> :nohl<cr>

  " remove extra whitespace
  nmap <leader><space> :%s/\s\+$<cr>
  nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

  inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
  inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

  " keep visual selection when indenting/outdenting
  vmap < <gv
  vmap > >gv

  " switch between current and last buffer
  nmap <leader>. <c-^>

  " move line mappings
  " ∆ is <A-j> on macOS
  " ˚ is <A-k> on macOS
  nnoremap ∆ :m .+1<cr>==
  nnoremap ˚ :m .-2<cr>==
  inoremap ∆ <Esc>:m .+1<cr>==gi
  inoremap ˚ <Esc>:m .-2<cr>==gi
  vnoremap ∆ :m '>+1<cr>gv=gv
  vnoremap ˚ :m '<-2<cr>gv=gv

  " toggle cursor line
  nnoremap <leader>i :set cursorline!<cr>

  " scroll the viewport faster
  nnoremap <C-e> 3<C-e>
  nnoremap <C-y> 3<C-y>

  " moving up and down work as you would expect
  nnoremap <silent> j gj
  nnoremap <silent> k gk
  nnoremap <silent> ^ g^
  nnoremap <silent> $ g$

  " Custom text objects
  " inner-line
  xnoremap <silent> il :<c-u>normal! g_v^<cr>
  onoremap <silent> il :<c-u>normal! g_v^<cr>
  " around line
  vnoremap <silent> al :<c-u>normal! $v0<cr>
  onoremap <silent> al :<c-u>normal! $v0<cr>
" }}}

" AutoGroups {{{
  " file type specific settings
  augroup configgroup
      autocmd!

      " automatically source init.vim on save
      autocmd BufWritePost init.vim source %
      " save all files on focus lost, ignoring warnings about untitled buffers
      autocmd FocusLost * silent! wa

      " make quickfix windows take all the lower section of the screen
      " when there are multiple windows open
      autocmd FileType qf wincmd J
      autocmd FileType qf nmap <buffer> q :q<cr>
      " coc  correct comment highlighting
      autocmd FileType json syntax match Comment +\/\/.\+$+
  augroup END
" }}}

" General Functionality {{{
  " quickly change case
  Plug 'tpope/vim-abolish'

  " easy commenting motions
  Plug 'tpope/vim-commentary'

  " mappings which are simply short normal mode aliases for commonly used ex commands
  Plug 'tpope/vim-unimpaired'

  " mappings to easily delete, change and add surroundings in pairs, such as quotes, parens, etc
  Plug 'tpope/vim-surround'

  " tmux integration for vim
  Plug 'benmills/vimux'

  " enables repeating other supported plugins with .
  Plug 'tpope/vim-repeat'

  " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
  Plug 'AndrewRadev/splitjoin.vim'

  " https://github.com/norcalli/nvim-colorizer.lua/blob/master/README.md
  Plug 'norcalli/nvim-colorizer.lua'

  " detect indent style (tabs vs. spaces)
  Plug 'tpope/vim-sleuth'

  " auto pairs https://github.com/jiangmiao/auto-pairs
  Plug 'jiangmiao/auto-pairs'

  " context-aware pasting
  Plug 'sickill/vim-pasta'

  " NERDTree {{{
    Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    let g:WebDevIconsOS = 'Darwin'
    let g:WebDevIconsUnicodeDecorateFolderNodes = 1
    let g:DevIconsEnableFoldersOpenClose = 1
    let g:DevIconsEnableFolderExtensionPatternMatching = 1
    let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
    let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
    let NERDTreeNodeDelimiter = "\u263a" " smiley face

    augroup nerdtree
        autocmd!
        autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
        autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
    augroup END

    " Toggle NERDTree
    function! ToggleNerdTree()
        if @% != "" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
            :NERDTreeFind
        else
            :NERDTreeToggle
        endif
    endfunction
    " toggle nerd tree
    nmap <silent> <leader>n :call ToggleNerdTree()<cr>
    " find the current file in nerdtree without needing to reload the drawer
    nmap <silent> <leader>y :NERDTreeFind<cr>

    let NERDTreeShowHidden=1
    " let NERDTreeDirArrowExpandable = '▷'
    " let NERDTreeDirArrowCollapsible = '▼'
    let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
  " }}}

  " FZF {{{
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    let g:fzf_layout = { 'down': '~25%' }

    if isdirectory(".git")
        " if in a git project, use :GFiles
        nmap <silent> <leader>t :GitFiles --cached --others --exclude-standard<cr>
    elseif isdirectory("../.git")
        " if in a git project, use :GFiles
        nmap <silent> <leader>t :GitFiles --cached --others --exclude-standard<cr>
    else
        " otherwise, use :FZF
        nmap <silent> <leader>t :FZF<cr>
    endif

    nmap <silent> <leader>s :GFiles?<cr>

    nmap <silent> <leader>r :Buffers<cr>
    nmap <silent> <leader>e :FZF<cr>
    nmap <leader><tab> <plug>(fzf-maps-n)
    xmap <leader><tab> <plug>(fzf-maps-x)
    omap <leader><tab> <plug>(fzf-maps-o)

    " Insert mode completion
    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)

    nnoremap <silent> <Leader>C :call fzf#run({
    \   'source':
    \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
    \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
    \   'sink':    'colo',
    \   'options': '+m',
    \   'left':    30
    \ })<CR>

    command! FZFMru call fzf#run({
    \  'source':  v:oldfiles,
    \  'sink':    'e',
    \  'options': '-m -x +s',
    \  'down':    '40%'})

    command! -bang -nargs=* Find call fzf#vim#grep(
        \ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
        \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
    command! -bang -nargs=? -complete=dir GitFiles
        \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
  " }}}

  " vim-fugitive {{{
    Plug 'tpope/vim-fugitive'
    nmap <silent> <leader>gs :Gstatus<cr>
    nmap <leader>ge :Gedit<cr>
    nmap <silent><leader>gr :Gread<cr>
    nmap <silent><leader>gb :Gblame<cr>

    Plug 'tpope/vim-rhubarb' " hub extension for fugitive
    Plug 'sodapopcan/vim-twiggy'
  " }}}

  " UltiSnips {{{
    Plug 'SirVer/ultisnips' " Snippets plugin
    let g:UltiSnipsExpandTrigger="<C-l>"
    let g:UltiSnipsJumpForwardTrigger="<C-j>"
    let g:UltiSnipsJumpBackwardTrigger="<C-k>"
  " }}}

  " coc {{{
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-diagnostic',
    \ 'coc-eslint',
    \ 'coc-json',
    \ 'coc-pairs',
    \ 'coc-prettier',
    \ 'coc-reason',
    \ 'coc-tabnine',
    \ 'coc-tailwindcss',
    \ 'coc-tsserver',
    \ 'coc-ultisnips',
    \ 'coc-vimlsp',
    \ 'coc-yaml'
    \ ]

    autocmd CursorHold * silent call CocActionAsync('highlight')

    " coc-prettier
    command! -nargs=0 Prettier :CocCommand prettier.formatFile
    nmap <leader>f :CocCommand prettier.formatFile<cr>

    nmap <silent> <leader>k :CocCommand explorer<cr>

    "remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nmap <silent> gh <Plug>(coc-doHover)

    " diagnostics navigation
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " rename
    nmap <silent> <leader>rn <Plug>(coc-rename)

    " Remap for format selected region
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    " organize imports
    command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    "tab completion
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    if exists('*complete_info')
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
        imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif
    

    " For enhanced <CR> experience with coc-pairs checkout :h coc#on_enter()
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
          \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  " }}}
" }}}

call plug#end()

set background=dark
colorscheme base16-seti
syntax on
filetype plugin indent on

 " make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermfg=19 guifg=#333333
highlight NonText ctermfg=19 guifg=#333333
highlight Normal ctermbg=none
