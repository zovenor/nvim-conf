return {
  -- {
  --   "kepano/flexoki-neovim",
  --   name = "flexoki",
  --   opts = {},
  --   config = function()
  --     -- Function to detect macOS theme (light or dark)
  --     local function get_macos_theme()
  --       local handle = vim.system({ "defaults", "read", "-g", "AppleInterfaceStyle" }, { text = true }):wait()
  --       if handle.code ~= 0 then
  --         -- If the command fails, it's likely because we're in light mode (AppleInterfaceStyle doesn't exist)
  --         return "light"
  --       else
  --         local output = handle.stdout:gsub("%s+", "")
  --         return output:lower() == "dark" and "dark" or "light"
  --       end
  --     end
  --
  --     -- Function to apply the appropriate theme
  --     local function apply_theme()
  --       local theme = get_macos_theme()
  --       if theme == "dark" then
  --         vim.cmd("colorscheme flexoki-dark")
  --       else
  --         vim.cmd("colorscheme flexoki-light")
  --       end
  --     end
  --
  --     -- Apply theme on startup
  --     apply_theme()
  --
  --     -- Create an autocmd group for theme switching
  --     local theme_group = vim.api.nvim_create_augroup("ThemeSwitcher", { clear = true })
  --
  --     -- Set up a timer to check for theme changes every 5 seconds
  --     vim.api.nvim_create_autocmd("VimEnter", {
  --       group = theme_group,
  --       callback = function()
  --         -- Create a recurring timer using vim.fn.timer_start
  --         local function create_theme_timer()
  --           vim.fn.timer_start(5000, function()
  --             apply_theme()
  --             create_theme_timer() -- Re-create the timer to make it recurring
  --           end)
  --         end
  --         -- Start the initial timer
  --         create_theme_timer()
  --       end,
  --     })
  --   end,
  -- },
  -- {
  --   {
  --     "rose-pine/neovim",
  --     priority = 1000,
  --     config = function()
  --       require("rose-pine").setup({
  --         variant = "moon", -- auto, main, moon, or dawn
  --         dark_variant = "moon", -- main, moon, or dawn
  --         dim_inactive_windows = false,
  --         extend_background_behind_borders = true,
  --
  --         enable = {
  --           terminal = true,
  --           legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
  --           migrations = true, -- Handle deprecated options automatically
  --         },
  --
  --         styles = {
  --           bold = true,
  --           italic = true,
  --           transparency = true,
  --         },
  --
  --         groups = {
  --           border = "muted",
  --           link = "iris",
  --           panel = "surface",
  --
  --           error = "love",
  --           hint = "iris",
  --           info = "foam",
  --           note = "pine",
  --           todo = "rose",
  --           warn = "gold",
  --
  --           git_add = "foam",
  --           git_change = "rose",
  --           git_delete = "love",
  --           git_dirty = "rose",
  --           git_ignore = "muted",
  --           git_merge = "iris",
  --           git_rename = "pine",
  --           git_stage = "iris",
  --           git_text = "rose",
  --           git_untracked = "subtle",
  --
  --           h1 = "iris",
  --           h2 = "foam",
  --           h3 = "rose",
  --           h4 = "gold",
  --           h5 = "pine",
  --           h6 = "foam",
  --         },
  --
  --         highlight_groups = {
  --           NormalFloat = { bg = "none" },
  --         },
  --       })
  --
  --       vim.cmd("colorscheme rose-pine-main")
  --     end,
  --   },
  -- },
  -- {
  --   "gambhirsharma/vesper.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   name = "vesper",
  --   config = function()
  --     vim.cmd([[colorscheme vesper]])
  --     vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = "#000" })
  --   end,
  -- },
  -- {
  --   "vague2k/vague.nvim",
  --   config = function()
  --     -- NOTE: you do not need to call setup if you don't want to.
  --     require("vague").setup({
  --       -- optional configuration here
  --     })
  --   end,
  -- },
  -- {
  --   "ray-x/aurora",
  --   init = function()
  --     vim.g.aurora_italic = 1
  --     vim.g.aurora_transparent = 1
  --     vim.g.aurora_bold = 1
  --   end,
  --   config = function()
  --     vim.cmd.colorscheme("aurora")
  --     -- override defaults
  --     vim.api.nvim_set_hl(0, "@number", { fg = "#e933e3" })
  --   end,
  -- },
  --   {
  --   "zootedb0t/citruszest.nvim",
  --   lazy = false,
  --   priority = 1000,
  -- },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    opts = {
      transparent = true,
      terminal_colors = true,
    },
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {
          -- Compiled file's destination location
          compile_path = vim.fn.stdpath("cache") .. "/nightfox",
          compile_file_suffix = "_compiled", -- Compiled file suffix
          transparent = true, -- Disable setting background
          terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = false, -- Non focused panes set to alternative background
          module_default = true, -- Default enable value for modules
          colorblind = {
            enable = false, -- Enable colorblind support
            simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
            severity = {
              protan = 0, -- Severity [0,1] for protan (red)
              deutan = 0, -- Severity [0,1] for deutan (green)
              tritan = 0, -- Severity [0,1] for tritan (blue)
            },
          },
          styles = { -- Style to be applied to different syntax groups
            comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
          },
          inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
          modules = { -- List of various plugins and additional options
            -- ...
          },
        },
        palettes = {},
        specs = {},
        groups = {},
      })
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
        },
      })
    end,
  },
}
