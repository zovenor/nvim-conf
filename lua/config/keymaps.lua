local map = vim.keymap.set

-- Base

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("n", "|", "<CMD>vsplit<CR>")
map("n", "-", "<CMD>split<CR>")
map("n", "<leader>e", "<CMD>:NvimTreeToggle<CR>")
map("n", "<S-u>", "<C-r>")
map("n", "<S-u>", "<C-r>")
map("n", "<leader>h", "<C-w>h", { desc = "Go to left window" })
map("n", "<leader>j", "<C-w>j", { desc = "Go to botton window" })
map("n", "<leader>k", "<C-w>k", { desc = "Go to top window" })
map("n", "<leader>l", "<C-w>l", { desc = "Go to right window" })
map("n", "<leader>d", "<C-w>c", { desc = "Close current window" })
map("n", "<leader>w", "<CMD>cclose<CR>", { desc = "Close quickfix" })
map("n", "<Tab>", "<cmd>cnext<CR>")
map("n", "<S-Tab>", "<cmd>cprev<CR>")

-- Codeium
vim.keymap.set("i", "ff", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })

-- Telescope

local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })

-- -- Trouble
-- map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
-- map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=true<cr>", { desc = "Symbols (Trouble)" })
-- map(
-- 	"n",
-- 	"<leader>cl",
-- 	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
-- 	{ desc = "LSP Definitions / references / ... (Trouble)" }
-- )
-- map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
-- map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
-- map("n", "<leader>xn", function()
-- 	require("trouble").next({ skip_groups = true, jump = true })
-- end, { desc = "Next Diagnostic" })
--
-- map("n", "<leader>xp", function()
-- 	require("trouble").prev({ skip_groups = true, jump = true })
-- end, { desc = "Previous Diagnostic" })

-- LSP diagnostics

--onvert LSP diagnostics severity to quickfix type
local function severityToType(severity)
	local types = { "E", "W", "I", "N" }
	return types[severity] or "I"
end
local function TypeToSeverity(type)
	local severity = {
		E = 0,
		W = 1,
		I = 2,
		N = 3,
	}
	return severity[type] or "I"
end
-- Function to collect LSP diagnostics and put them in quickfix
function LspToQf()
	local diagnostics = vim.diagnostic.get(nil)
	local qf_items = {}
	for _, diagnostic in ipairs(diagnostics) do
		table.insert(qf_items, {
			filename = vim.api.nvim_buf_get_name(diagnostic.bufnr),
			lnum = diagnostic.lnum + 1, -- LSP uses 0-based, quickfix uses 1-based
			col = diagnostic.col + 1, -- LSP uses 0-based, quickfix uses 1-based
			text = diagnostic.message,
			type = severityToType(diagnostic.severity),
		})
	end
	table.sort(qf_items, function(a, b)
		local a_type = TypeToSeverity(a.type)
		local b_type = TypeToSeverity(b.type)
		return a_type < b_type
	end)
	vim.fn.setqflist(qf_items, "r")
	vim.cmd(":copen")
	return #qf_items
end

map("n", "<leader>E", LspToQf, { desc = "LSP diagnostics to quickfix" })
