return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")
      local colors = require("tokyonight.colors").setup()

      local palette = {
        TokyoNightRainbowYellow = colors.yellow,
        TokyoNightRainbowPurple = colors.purple,
        TokyoNightRainbowCyan = colors.cyan,
        TokyoNightRainbowOrange = colors.orange,
        TokyoNightRainbowGreen = colors.green,
        TokyoNightRainbowTeal = colors.teal,
        TokyoNightRainbowMagenta = colors.magenta,
      }

      for group, color in pairs(palette) do
        vim.api.nvim_set_hl(0, group, { fg = color })
      end

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy.global,
        },
        query = {
          [""] = "rainbow-delimiters",
        },
        highlight = {
          "TokyoNightRainbowYellow",
          "TokyoNightRainbowPurple",
          "TokyoNightRainbowCyan",
          "TokyoNightRainbowOrange",
          "TokyoNightRainbowGreen",
          "TokyoNightRainbowTeal",
          "TokyoNightRainbowMagenta",
        },
      }
    end,
  },
}
