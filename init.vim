let g:netrw_liststyle = 3
set guicursor=n-v-i-c:block-Cursor
set shiftwidth=2
set expandtab
set nobackup
set undofile
set nohlsearch
set incsearch
set scrolloff=10
set ignorecase
set smartcase
set nowrap
set cmdheight=0
set clipboard+=unnamedplus
set path+=**
set wildignore+=**/node_modules/*,**/target/*,**/dist/*,**/builds/*
set completeopt=menu
highlight StatusLine ctermfg=0 ctermbg=6
lua vim.loader.enable()

nnoremap <C-e> :edit .<CR>
nnoremap <C-p> :find 
nnoremap <C-a> :lua vim.diagnostic.setloclist()<CR>
nnoremap <C-s> :lua vim.lsp.buf.format({filter = function(client) return client.name ~= 'ts_ls' end}); vim.cmd('w')<CR>:redraw!<CR>
nnoremap <M-e> :!open .<CR>
nnoremap <M-w> :!explorer .<CR>
nnoremap <M-h> :vertical resize -5<CR>
nnoremap <M-l> :vertical resize +5<CR>
nnoremap <M-j> :horizontal resize -5<CR>
nnoremap <M-k> :horizontal resize +5<CR>
nnoremap <M-H> 20zh
nnoremap <M-L> 20zl
vnoremap J :m '>+1<CR>gv-gv
vnoremap K :m '<-2<CR>gv-gv
vnoremap D <del>
inoremap <C-n> <C-x><C-o>
inoremap <C-b> <C-x><C-n>
xnoremap p "_dP
nnoremap <C-j> 5j
nnoremap <C-k> 5k
vnoremap <C-j> 5j
vnoremap <C-k> 5k
nnoremap d "_d
vnoremap d "_d

" :lua vim.fn.system({"git", "clone", "--depth=1", "https://github.com/neovim/nvim-lspconfig", vim.fn.stdpath("data") .. "/site/pack/plugins/start/nvim-lspconfig"})
" :helptags ALL | help lspconfig-all
lua << EOF
local lsp = require("lspconfig")
lsp.html.setup({})
lsp.biome.setup({})
lsp.ts_ls.setup({})
lsp.svelte.setup({})
lsp.tailwindcss.setup({})
lsp.ruff.setup({})
lsp.clangd.setup({})
lsp.gopls.setup({})
lsp.rust_analyzer.setup({})
lsp.lua_ls.setup({})
EOF
