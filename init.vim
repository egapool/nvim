
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

syntax enable
set encoding=utf-8
let mapleader = "\<Space>"

" Color Scheme
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark    " Setting dark mode
"set laststatus=2
set t_Co=256

set expandtab " TABキーを押した際にタブ文字の代わりにスペースを入れる
set tabstop=4
set shiftwidth=4
set scrolloff=3 " 指定行数前からスクロールする

" クリップボードとヤンク
set clipboard+=unnamed

" Insertモードから戻るときにIME閉じる
"inoremap <silent> <Esc> <Esc>:call system('fcitx-remote -c')<CR>

" Defx Start
"autocmd VimEnter * execute 'Defx'
nnoremap <silent> <Leader>s :<C-u> Defx <CR>

"インクリメンタルサーチを有効にする
set incsearch

"検索結果をハイライト 
set hlsearch

set ignorecase "大文字小文字を区別しない
set smartcase " 大文字を含む文字列で検索した場合は無視しない

nnoremap <silent> <ESC><ESC> :nohlsearch<CR> " <ESC>連打で検索ハイライト消す

"set number " 行数を表示

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" クオーテーションの補完
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
inoremap [ []<LEFT>
inoremap {<Enter> {}<Left><CR><ESC><S-o>

" Move window
"nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" move Carsol
nmap j gj
nmap k gk

"Paste in visual mode without copying
xnoremap p pgvy:w<cr>

" LSP
nmap <silent> gd :LspDefinition<CR>
nmap <silent> gt :tab split<cr>:LspDefinition<cr>
nmap <silent> gs :sp<cr>:LspDefinition<cr>
nmap <silent> gv :vsp<cr>:LspDefinition<cr>
nmap <silent> gh :LspPeekDefinition<cr>
nmap <silent> K :LspHover<CR>
nmap <silent> <f2> :LspRename<CR>
nmap <silent> <Leader>a :LspCodeAction<CR>
nmap <silent> <Leader>d :LspTypeDefinition<CR>
nmap <silent> <Leader>r :LspReferences<CR>
nmap <silent> <Leader>i :LspImplementation<CR>
let g:lsp_preview_max_height = 100
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_popup_delay = 100
let g:lsp_text_edit_enabled = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:markdown_fenced_languages = ['go', 'rust', 'php']
let g:markdown_syntax_conceal = 1
let g:lsp_hover_conceal=1
let g:vim_markdown_conceal = 1
let g:vim_markdown_conceal_code_blocks = 1
let lsp_log_verbose=0
let lsp_log_file = '/tmp/lsp.log'

" fzf
nnoremap [Fzf] <Nop>
nmap <Leader>f [Fzf]
nmap <C-p> :<C-u>GFiles<CR>
nnoremap [Fzf]f :<C-u>Files<CR>
nnoremap [Fzf]g :<C-u>GFiles<CR>
nnoremap [Fzf]G :<C-u>GFiles?<CR>
nnoremap [Fzf]b :<C-u>Buffers<CR>
nnoremap [Fzf]a :<C-u>Ag<CR>

map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>w <Plug>(easymotion-jumptoanywhere)
nmap <Leader>jk <Plug>(easymotion-sol-bd-jk)
" nmap <Leader>s <Plug>(easymotion-s2)
"
nmap <leader>ve :VdebugEval

"LSP wordpress
let g:lsp_settings = {
      \   'intelephense': {
      \     'workspace_config': {
      \       'intelephense': {
      \         'stubs': [
      \           "wordpress",
      \           "apache",
      \           "bcmath",
      \           "bz2",
      \           "calendar",
      \           "com_dotnet",
      \           "Core",
      \           "csprng",
      \           "ctype",
      \           "curl",
      \           "date",
      \           "dba",
      \           "dom",
      \           "enchant",
      \           "exif",
      \           "fileinfo",
      \           "filter",
      \           "fpm",
      \           "ftp",
      \           "gd",
      \           "hash",
      \           "iconv",
      \           "imap",
      \           "interbase",
      \           "intl",
      \           "json",
      \           "ldap",
      \           "libxml",
      \           "mbstring",
      \           "mcrypt",
      \           "mssql",
      \           "mysql",
      \           "mysqli",
      \           "oci8",
      \           "odcb",
      \           "openssl",
      \           "password",
      \           "pcntl",
      \           "pcre",
      \           "PDO",
      \           "pdo_ibm",
      \           "pdo_mysql",
      \           "pdo_pgsql",
      \           "pdo_sqlite",
      \           "pgsql",
      \           "Phar",
      \           "posix",
      \           "pspell",
      \           "readline",
      \           "recode",
      \           "Reflection",
      \           "regex",
      \           "session",
      \           "shmop",
      \           "SimpleXML",
      \           "snmp",
      \           "soap",
      \           "sockets",
      \           "sodium",
      \           "SPL",
      \           "sqlite3",
      \           "standard",
      \           "superglobals",
      \           "sybase",
      \           "sysvmsg",
      \           "sysvsem",
      \           "sysvshm",
      \           "tidy",
      \           "tokenizer",
      \           "wddx",
      \           "xml",
      \           "xmlreader",
      \           "xmlrpc",
      \           "xmlwriter",
      \           "Zend OPcache",
      \           "zip",
      \           "zlib"
      \         ]
      \       }
      \     }
      \   }
      \ }
