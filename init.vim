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

lua vim.lsp.config.html = { cmd = { 'vscode-html-language-server', '--stdio' }, filetypes = { 'html', 'templ' }, init_options = { embeddedLanguages = { css = true, javascript = true, }, configurationSection = { 'html', 'css', 'javascript' }, provideFormatter = true, }, }
lua vim.lsp.config.biome = { cmd = { 'biome', 'lsp-proxy' }, filetypes = { 'astro', 'css', 'graphql', 'javascript', 'javascriptreact', 'json', 'jsonc', 'svelte', 'typescript', 'typescriptreact', 'vue', }, }
lua vim.lsp.config.ts_ls = { cmd = { 'typescript-language-server', '--stdio' }, filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', }, }
lua vim.lsp.config.svelte = { cmd = { 'svelteserver', '--stdio' }, filetypes = { 'svelte' }, }
lua vim.lsp.config.tailwindcss = { cmd = { 'tailwindcss-language-server', '--stdio' }, filetypes = { 'astro', 'css', 'html', 'javascript', 'javascriptreact', 'markdown', 'scss', 'svelte', 'typescript', 'typescriptreact', 'vue', 'templ', }, }
lua vim.lsp.config.ruff = { cmd = { 'ruff', 'server' }, filetypes = { 'python' }, }
lua vim.lsp.config.clangd = { cmd = { 'clangd' }, filetypes = { 'c', 'cpp' }, }
lua vim.lsp.config.gopls = { cmd = { 'gopls' }, filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' }, }
lua vim.lsp.config.rust_analyzer = { cmd = { 'rust-analyzer' }, filetypes = { 'rust' }, }
lua vim.lsp.enable({ 'html', 'biome', 'ts_ls', 'svelte', 'tailwindcss', 'ruff', 'clangd', 'gopls', 'rust_analyzer', })
lua vim.diagnostic.config({ virtual_lines = true })
