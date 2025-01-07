vim.g.netrw_liststyle = 3
vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.cmdheight = 0
vim.opt.termguicolors = false
vim.opt.clipboard:append("unnamedplus")
vim.opt.path:append("**")
vim.opt.wildignore:append("**/node_modules/*,**/target/*,**/dist/*,**/builds/*")
vim.opt.completeopt = { "menu" }
vim.api.nvim_set_hl(0, "StatusLine", { ctermbg = "NONE" })
vim.loader.enable()

vim.keymap.set("t", "<c-\\>", "<C-\\><C-n>")
vim.keymap.set("n", "<c-e>", "<cmd>edit .<cr>")
vim.keymap.set("n", "<c-p>", ":find ")
vim.keymap.set("n", "<c-a>", vim.diagnostic.setloclist)
vim.keymap.set("n", "<c-s>",
  "<cmd>lua n = vim.notify; vim.notify = function() end; vim.lsp.buf.format({filter = function(client) return client.name ~= 'ts_ls' end}); vim.notify = n; vim.cmd('w')<cr>")
vim.keymap.set("n", "<m-e>", "<cmd>!open .<cr>")
vim.keymap.set("n", "<m-w>", "<cmd>!explorer .<cr>")
vim.keymap.set("n", "<m-h>", "<cmd>vertical resize -5<cr>")
vim.keymap.set("n", "<m-l>", "<cmd>vertical resize +5<cr>")
vim.keymap.set("n", "<m-j>", "<cmd>horizontal resize -5<cr>")
vim.keymap.set("n", "<m-k>", "<cmd>horizontal resize +5<cr>")
vim.keymap.set("n", "<m-H>", "20zh")
vim.keymap.set("n", "<m-L>", "20zl")
vim.keymap.set("v", "J", ":m '>+1<cr>gv-gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv-gv")
vim.keymap.set("v", "D", "<del>")
vim.keymap.set("i", "<c-n>", "<C-x><C-o>")
vim.keymap.set("i", "<c-b>", "<C-x><C-n>")
vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<C-j>", "5j")
vim.keymap.set({ "n", "v" }, "<C-k>", "5k")
vim.keymap.set({ "n", "v" }, "d", [["_d]])

-- (macos) git clone --depth=1 https://github.com/neovim/nvim-lspconfig ~/.local/share/nvim/site/pack/plugins/start/nvim-lspconfig
-- (windows) git clone --depth=1 https://github.com/neovim/nvim-lspconfig %localappdata%/nvim-data/site/pack/plugins/start/nvim-lspconfig
-- :helptags ALL | help lspconfig-all
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
