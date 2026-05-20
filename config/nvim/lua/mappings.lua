require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Buffer navigation
map("n", "<leader><leader>", "<C-^>", { desc = "Switch to previous buffer" })
map("n", "<leader>bp", "<C-^>", { desc = "Switch to previous buffer" })

-- LSP mappings (most LSP mappings are in lspconfig.lua on_attach)
-- These global mappings work without needing an LSP client attached
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
map("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
map("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostic list" })

-- Note: LSP-specific mappings like gr, gi, gd, K, <leader>rn, <leader>ca, etc.
-- are configured in lspconfig.lua on_attach function so they only work when
-- an LSP client is attached to the buffer

-- LazyGit
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- gd mapping is now handled in lspconfig.lua to override NvChad's default
