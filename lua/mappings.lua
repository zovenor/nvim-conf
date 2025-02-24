require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<TAB>", "<CMD>bnext<CR>")
map("n", "<S-TAB>", "<CMD>bprev<CR>")
map("n", "<Esc>", "<CMD>nohlsearch<CR>")
map("n", "<leader>d", "<CMD>bd<CR>")
map("n", "<leader>p", "o<Esc>p")
map("n", "<S-u>", "<C-r>")
map("n", "<leader>e", "<CMD>NvimTreeToggle<CR>")
map("n", "<leader><leader>", "<CMD>Telescope live_grep<CR>")
map("n", "<leader>E", "<CMD>Telescope diagnostics<CR>")
map("n", "|", "<CMD>vsplit<CR>")
map("n", "-", "<CMD>split<CR>")
map("n", "<leader>m", "<CMD>MarkdownPreview<CR>")
map("n", "<leader>M", "<CMD>MarkdownPreviewStop<CR>")

vim.keymap.set("i", "ff", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
