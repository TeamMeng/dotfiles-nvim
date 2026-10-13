return {
  -- 1. Mojo language support (Tree-sitter highlight, workflow helpers)
  {
    "Sarctiann/mojo.nvim",
    ft = { "mojo" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lsp = {
        enabled = true,
      },
      treesitter = {
        enabled = true,
      },
      completion = {
        enabled = true,
      },
    },
  },

  -- 2. Register Mojo LSP server in LazyVim's lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        mojo = {},
      },
    },
  },

  -- 3. Register Mojo keyword/snippet provider into blink.cmp
  {
    "saghen/blink.cmp",
    optional = true,
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      -- 仅在 mojo 文件类型下激活 mojo 源，避免污染 Rust/Python/Lua 等其他语言的补全列表与后台调度
      opts.sources.per_filetype = opts.sources.per_filetype or {}
      opts.sources.per_filetype.mojo = { "lsp", "path", "snippets", "buffer", "mojo" }
      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers.lsp = vim.tbl_deep_extend("force", opts.sources.providers.lsp or {}, {
        score_offset = 100, -- 保证 LSP 真实符号（函数/变量/方法）绝对优先展示
      })
      opts.sources.providers.mojo = {
        name = "mojo",
        module = "mojo.adapters.blink",
        score_offset = 0, -- 关键字与内置片段作为补充
        enabled = function()
          return vim.bo.filetype == "mojo"
        end,
      }
    end,
  },
}
