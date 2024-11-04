require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<TAB>", ":bnext<CR>")
map("n", "<S-TAB>", ":bprev<CR>")
map("n", "<Esc>", ":nohlsearch<CR>")
map("n", "<leader>d", "<CMD>bd<CR>")
map("n", "<leader>p", "o<Esc>p")
map("n", "<S-u>", "<C-r>")
map("n", "<leader>e", ":NvimTreeToggle<CR>")
map("n", "<leader><leader>", ":Telescope live_grep<CR>")
map("n", "<leader>E", ":Telescope diagnostics<CR>")
map("n", "|", ":vsplit<CR>")
map("n", "-", ":split<CR>")
map("n", "<leader>m", ":MarkdownPreview<CR>")
map("n", "<leader>M", ":MarkdownPreviewStop<CR>")

vim.keymap.set("i", "ff", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
