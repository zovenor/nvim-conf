return {
  {
    "kepano/flexoki-neovim",
    name = "flexoki",
    opts = {},
    config = function()
      -- Function to detect macOS theme (light or dark)
      local function get_macos_theme()
        local handle = vim.system({ "defaults", "read", "-g", "AppleInterfaceStyle" }, { text = true }):wait()
        if handle.code ~= 0 then
          -- If the command fails, it's likely because we're in light mode (AppleInterfaceStyle doesn't exist)
          return "light"
        else
          local output = handle.stdout:gsub("%s+", "")
          return output:lower() == "dark" and "dark" or "light"
        end
      end

      -- Function to apply the appropriate theme
      local function apply_theme()
        local theme = get_macos_theme()
        if theme == "dark" then
          vim.cmd("colorscheme flexoki-dark")
        else
          vim.cmd("colorscheme flexoki-light")
        end
      end

      -- Apply theme on startup
      apply_theme()

      -- Create an autocmd group for theme switching
      local theme_group = vim.api.nvim_create_augroup("ThemeSwitcher", { clear = true })

      -- Set up a timer to check for theme changes every 5 seconds
      vim.api.nvim_create_autocmd("VimEnter", {
        group = theme_group,
        callback = function()
          -- Create a recurring timer using vim.fn.timer_start
          local function create_theme_timer()
            vim.fn.timer_start(5000, function()
              apply_theme()
              create_theme_timer() -- Re-create the timer to make it recurring
            end)
          end
          -- Start the initial timer
          create_theme_timer()
        end,
      })
    end,
  },
  -- {
  --   "Yazeed1s/minimal.nvim",
  --   name = "minimal",
  --   config = function()
  --     vim.cmd("colorscheme minimal")
  --   end,
  -- },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     vim.cmd("colorscheme rose-pine")
  --   end,
  -- },
}
