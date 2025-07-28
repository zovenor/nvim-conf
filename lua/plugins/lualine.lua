return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto", -- Можно поменять на "gruvbox", "tokyonight" и т.д.
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				globalstatus = true, -- Единая статусная линия для всех окон
			},
			sections = {
				-- Левая часть
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				-- Центральная часть
				lualine_c = {
					{
						"filename",
						path = 3, -- 0=имя файла, 1=относительный путь, 2=абсолютный, 3=от корня git
						symbols = { modified = "●", readonly = "", unnamed = "[No Name]" },
					},
				},
				-- Правая часть
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "quickfix", "nvim-tree", "toggleterm" },
		})
	end,
}
