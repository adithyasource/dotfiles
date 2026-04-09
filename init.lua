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
vim.opt.shell = (vim.loop.os_uname().sysname == "Windows_NT") and "powershell" or "/bin/zsh"
vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { reverse = true })
vim.filetype.add({ extension = { vsh = "glsl", fsh = "glsl" } })

vim.keymap.set("n", "<C-s>", function() vim.lsp.buf.format(); vim.cmd("w") end)
vim.keymap.set("n", "<C-e>", function() MiniFiles.open() end)
vim.keymap.set("n", "<C-p>", function() MiniPick.builtin.files() end)
vim.keymap.set("n", "<C-f>", function() MiniPick.builtin.grep_live() end)
vim.keymap.set("n", "<C-g>", function() vim.b.minidiff_disable = not vim.b.minidiff_disable; vim.cmd("edit") end)
vim.keymap.set("n", "<M-h>", ":vertical resize -3<CR>")
vim.keymap.set("n", "<M-l>", ":vertical resize +3<CR>")
vim.keymap.set("n", "<M-j>", ":horizontal resize -3<CR>")
vim.keymap.set("n", "<M-k>", ":horizontal resize +3<CR>")
vim.keymap.set("n", "<M-H>", "10zh")
vim.keymap.set("n", "<M-L>", "10zl")
vim.keymap.set("v", "J", ":m '>+1<CR>gv-gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv-gv")
vim.keymap.set("v", "D", "<del>")
vim.keymap.set("x", "p", '"_dP')
vim.keymap.set("i", "<C-n>", "<C-x><C-o>")
vim.keymap.set("i", "<C-b>", "<C-x><C-n>")
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>")
vim.keymap.set({ "n", "v" }, "<C-j>", "5j")
vim.keymap.set({ "n", "v" }, "<C-k>", "5k")
vim.keymap.set({ "n", "v" }, "d", '"_d')
 
vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-mini/mini.files",
  "https://github.com/nvim-mini/mini.pick",
  "https://github.com/nvim-mini/mini.diff"
})
vim.lsp.enable({
  "biome", "ts_ls", "tailwindcss", "prismals", "astro", "svelte",
  "ruff", "ty", "clangd", "gopls", "rust_analyzer", "glsl_analyzer"
})
vim.lsp.config("ts_ls", {
  on_attach = function(c)
    c.server_capabilities.documentFormattingProvider = false
  end,
})

require('mini.files').setup()
require('mini.pick').setup()
require('mini.diff').setup()
