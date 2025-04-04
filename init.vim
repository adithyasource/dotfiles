let g:netrw_liststyle = 3
set guicursor=i:block
set shiftwidth=2
set expandtab
set nobackup
set undofile
set nohlsearch
set incsearch
set scrolloff=10
set notermguicolors
set nowrap
set cmdheight=0
set clipboard+=unnamedplus
set path+=**
set wildignore+=**/node_modules/*,**/target/*,**/dist/*,**/builds/*
lua vim.loader.enable()

nnoremap <C-e> :edit .<CR>
nnoremap <C-p> :find 
nnoremap <C-a> :lua vim.diagnostic.setloclist()<CR>
nnoremap <C-s> :lua vim.lsp.buf.format({filter = function(client) return client.name ~= 'ts_ls' end}); vim.cmd('w')<CR>:redraw!<CR>
tnoremap <C-\> <C-\><C-n>
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
lua lsp = require("lspconfig")
lua lsp.html.setup({})
lua lsp.biome.setup({})
lua lsp.ts_ls.setup({})
lua lsp.svelte.setup({})
lua lsp.tailwindcss.setup({})
lua lsp.ruff.setup({})
lua lsp.clangd.setup({})
lua lsp.gopls.setup({})
lua lsp.rust_analyzer.setup({})
lua lsp.lua_ls.setup({})
lua vim.diagnostic.config({ virtual_lines = true })
