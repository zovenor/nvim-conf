return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Иконки для файлов
  config = function()
    require("nvim-tree").setup({
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        icons = {
          git_placement = "after",
          show = {
            git = true,
          },
        },
      },
    })
  end,
}
