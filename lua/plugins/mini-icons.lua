return {
  {
    "nvim-mini/mini.icons",
    opts = function(_, opts)
      opts.directory = vim.tbl_deep_extend("force", opts.directory or {}, {
        [".config"] = { glyph = "󱁿", hl = "MiniIconsPurple" },
        [".git"] = { glyph = "󰊢", hl = "MiniIconsOrange" },
        [".github"] = { glyph = "󰊤", hl = "MiniIconsPurple" },
        [".vscode"] = { glyph = "󰨞", hl = "MiniIconsBlue" },

        ["assets"] = { glyph = "󰉏", hl = "MiniIconsGreen" },
        ["bin"] = { glyph = "󰆍", hl = "MiniIconsOrange" },
        ["cmd"] = { glyph = "󰆍", hl = "MiniIconsOrange" },
        ["config"] = { glyph = "󱁿", hl = "MiniIconsPurple" },
        ["docs"] = { glyph = "󱧶", hl = "MiniIconsYellow" },
        ["examples"] = { glyph = "󰉍", hl = "MiniIconsGreen" },
        ["internal"] = { glyph = "󰉌", hl = "MiniIconsMauve" },
        ["lua"] = { glyph = "󰢱", hl = "MiniIconsBlue" },
        ["node_modules"] = { glyph = "󰎙", hl = "MiniIconsGreen" },
        ["pkg"] = { glyph = "󰏗", hl = "MiniIconsPeach" },
        ["proto"] = { glyph = "󰈙", hl = "MiniIconsSky" },
        ["scripts"] = { glyph = "󱆃", hl = "MiniIconsOrange" },
        ["src"] = { glyph = "󰉋", hl = "MiniIconsBlue" },
        ["test"] = { glyph = "󰙨", hl = "MiniIconsGreen" },
        ["tests"] = { glyph = "󰙨", hl = "MiniIconsGreen" },

        ["ecosystem"] = { glyph = "󰚩", hl = "MiniIconsMauve" },
        ["user-management"] = { glyph = "󰚩", hl = "MiniIconsMauve" },
      })
    end,
    config = function(_, opts)
      local palette = require("tokyonight.colors").setup()
      local groups = {
        MiniIconsMauve = palette.purple,
        MiniIconsPeach = palette.orange,
        MiniIconsSky = palette.cyan,
      }

      for group, color in pairs(groups) do
        vim.api.nvim_set_hl(0, group, { fg = color })
      end

      require("mini.icons").setup(opts)
      require("mini.icons").mock_nvim_web_devicons()
    end,
  },
}
