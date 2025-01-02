vim.g.mapleader = " "
vim.g.netrw_liststyle = 3
vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.swapfile = false
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
vim.api.nvim_set_hl(0, "StatusLine", { ctermbg = "NONE" })
vim.loader.enable()

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")
vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set({ "n", "v" }, "d", [["_d]])
vim.keymap.set("n", "<leader>e", "<cmd>edit .<cr>")
vim.keymap.set("n", "<leader>E", "<cmd>!open .<cr>")
vim.keymap.set("n", "<leader>W", "<cmd>!explorer .<cr>")
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>")
vim.keymap.set({ "n", "v" }, "<C-j>", "5j")
vim.keymap.set({ "n", "v" }, "<C-k>", "5k")
vim.keymap.set("v", "D", "<del>")
vim.keymap.set("n", "<C-p>", ":find ")
vim.keymap.set("n", "<M-h>", "<cmd>vertical resize -5<cr>")
vim.keymap.set("n", "<M-l>", "<cmd>vertical resize +5<cr>")
vim.keymap.set("n", "<M-j>", "<cmd>horizontal resize -5<cr>")
vim.keymap.set("n", "<M-k>", "<cmd>horizontal resize +5<cr>")
vim.keymap.set("n", "<M-H>", "20zh")
vim.keymap.set("n", "<M-L>", "20zl")
vim.keymap.set("n", "<C-s>",
  "<cmd>lua n = vim.notify; vim.notify = function() end; vim.lsp.buf.format(); vim.notify = n; vim.cmd('w')<cr>")
vim.keymap.set("i", "<C-n>", "<C-x><C-o>")
vim.keymap.set("i", "<C-b>", "<C-x><C-n>")
vim.keymap.set("n", "<leader>a", vim.diagnostic.setloclist)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "H", vim.lsp.buf.definition)
vim.keymap.set("i", "<esc>", "<esc>:pclose<cr>")

-- (macos) git clone --depth=1 https://github.com/neovim/nvim-lspconfig ~/.local/share/nvim/site/pack/plugins/start/nvim-lspconfig
-- (windows) git clone --depth=1 https://github.com/neovim/nvim-lspconfig %localappdata%/nvim-data/site/pack/plugins/start/nvim-lspconfig
-- [docs] https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local lsp = require("lspconfig")
lsp.html.setup({})
lsp.cssls.setup({ capabilities = { textDocument = { completion = { completionItem = { snippetSupport = true, }, }, }, }, })
lsp.denols.setup({})
lsp.svelte.setup({})
lsp.tailwindcss.setup({})
lsp.ruff.setup({})
lsp.clangd.setup({})
lsp.gopls.setup({})
lsp.rust_analyzer.setup({})
lsp.lua_ls.setup({ settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
