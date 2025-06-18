vim.loader.enable()
vim.g.netrw_liststyle = 3
vim.opt.guicursor = "i:block"
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 10
vim.opt.termguicolors = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.cmdheight = 0
vim.opt.clipboard:append("unnamedplus")
vim.opt.path:append("**")
vim.opt.wildignore:append({ "**/node_modules/*", "**/target/*", "**/dist/*", "**/builds/*" })

vim.keymap.set("n", "<C-e>", ":edit .<CR>")
vim.keymap.set("n", "<C-p>", ":find ")
vim.keymap.set("n", "<C-a>", function() vim.diagnostic.setloclist() end)
vim.keymap.set("n", "<C-s>", function() vim.lsp.buf.format({ filter = function(client) return client.name ~= "ts_ls" end }); vim.cmd("w"); vim.cmd("redraw!") end)
vim.keymap.set("n", "<C-j>", "5j")
vim.keymap.set("n", "<C-k>", "5k")
vim.keymap.set("n", "<M-h>", ":vertical resize -5<CR>")
vim.keymap.set("n", "<M-l>", ":vertical resize +5<CR>")
vim.keymap.set("n", "<M-j>", ":horizontal resize -5<CR>")
vim.keymap.set("n", "<M-k>", ":horizontal resize +5<CR>")
vim.keymap.set("n", "<M-H>", "20zh")
vim.keymap.set("n", "<M-L>", "20zl")
vim.keymap.set("v", "<C-j>", "5j")
vim.keymap.set("v", "<C-k>", "5k")
vim.keymap.set("v", "J", ":m '>+1<CR>gv-gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv-gv")
vim.keymap.set("v", "D", "<del>")
vim.keymap.set("x", "p", '"_dP')
vim.keymap.set("i", "<C-n>", "<C-x><C-o>")
vim.keymap.set("i", "<C-b>", "<C-x><C-n>")
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>")
vim.keymap.set({ "n", "v" }, "d", '"_d')

-- :lua vim.fn.system({"git", "clone", "--depth=1", "https://github.com/neovim/nvim-lspconfig", vim.fn.stdpath("data") .. "/site/pack/plugins/start/nvim-lspconfig"})
for _, server in ipairs({ "html", "biome", "ts_ls", "svelte", "tailwindcss", "ruff", "clangd", "gopls", "rust_analyzer" }) do require("lspconfig")[server].setup({}) end
vim.diagnostic.config({ virtual_lines = true })
