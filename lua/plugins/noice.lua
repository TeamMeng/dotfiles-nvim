return {
  "folke/noice.nvim",
  opts = function(_, opts)
    opts.lsp = opts.lsp or {}
    opts.lsp.signature = {
      enabled = false,
      auto_open = {
        enabled = false,
      },
    }
    opts.lsp.hover = {
      enabled = false, -- 禁用 Noice 悬浮文档接管，交由 Neovim 原生 LSP 浮窗全权处理，彻底解决双重悬浮弹窗冲突
    }
    opts.routes = opts.routes or {}
    table.insert(opts.routes, 1, {
      filter = {
        error = true,
        any = {
          { find = "Error in .*Autocommands" },
          { find = "vim/snippet%.lua" },
        },
      },
      opts = {
        skip = true,
      },
    })
    return opts
  end,
}
