return {
  {
    "catppuccin/nvim",
    opts = {
      flavour = "mocha",
      integrations = {
        blink_cmp = { style = "bordered" },
        rainbow_delimiters = true,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")
      local colors = require("catppuccin.palettes").get_palette()

      local palette = {
        CatppuccinRainbowYellow = colors.yellow,
        CatppuccinRainbowMauve = colors.mauve,
        CatppuccinRainbowSky = colors.sky,
        CatppuccinRainbowPeach = colors.peach,
        CatppuccinRainbowGreen = colors.green,
        CatppuccinRainbowTeal = colors.teal,
        CatppuccinRainbowPink = colors.pink,
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
          "CatppuccinRainbowYellow",
          "CatppuccinRainbowMauve",
          "CatppuccinRainbowSky",
          "CatppuccinRainbowPeach",
          "CatppuccinRainbowGreen",
          "CatppuccinRainbowTeal",
          "CatppuccinRainbowPink",
        },
      }
    end,
  },
}
