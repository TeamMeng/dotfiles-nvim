return {
  -- 全局 LSP 与诊断控制
  {
    "neovim/nvim-lspconfig",
    init = function()
      -- 彻底静音 Neovim 内置原生 LSP signatureHelp 浮窗处理函数
      -- 由 blink.cmp 单独全权负责传参签名卡片，根除原生与 blink 同时弹出的双重弹窗冲突
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(function() end, {})
    end,
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false, -- 插入模式下冻结诊断刷新，退出插入模式才更新红波浪线
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      },
      inlay_hints = {
        enabled = true, -- 开启内联提示（变量类型、参数名称等），可用快捷键 <leader>uh 随时切换
      },
      -- 禁用 LazyVim 默认在插入模式下绑定的 <c-k> 签名按键，避免拦截或回退触发原生 LSP 弹窗
      servers = {
        ["*"] = {
          keys = {
            { "<c-k>", false, mode = "i" },
          },
        },
      },
      -- 禁用 LSP 自动接管折叠（保留 options.lua 中配置的 manual 折叠，防止全量语法树重算卡顿）
      folds = {
        enabled = false,
      },
    },
  },

  -- 针对 Rust (rustaceanvim) 专项提速
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            check = { command = "clippy" }, -- 仅在保存时跑 clippy，严禁打字时后台偷跑检查
            cargo = { allFeatures = false },
            procMacro = { enable = true },
            diagnostics = { disabled = { "unresolved-proc-macro" } },
          },
        },
      },
    },
  },
}
