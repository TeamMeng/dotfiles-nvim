return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- 1. 强制启用预编译 Rust 模糊匹配内核 & 限制候选词数量
    opts.fuzzy = {
      implementation = "rust",
      max_items = 40,
    }

    opts.completion = opts.completion or {}

    -- 2. 悬浮菜单：精致圆角边框 + 紧凑布局 (图标 | 名称+描述紧跟 | 类型标签)
    opts.completion.menu = {
      border = "rounded",
      winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
      draw = {
        padding = 1,
        gap = 1,
        columns = {
          { "kind_icon" },
          { "label", "label_description", gap = 1 },
          { "kind" },
        },
        components = {
          label = {
            width = { fill = false },
          },
          label_description = {
            width = { max = 50 },
          },
        },
      },
    }

    -- 3. 幽灵文本（Ghost Text）：光标后显示浅灰色实时内联预览
    opts.completion.ghost_text = {
      enabled = true,
    }

    -- 4. 文档弹窗：圆角卡片边框 + 120ms 防抖延时
    opts.completion.documentation = {
      auto_show = true,
      auto_show_delay_ms = 120,
      window = {
        border = "rounded",
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
      },
    }

    -- 5. 函数签名助手（Signature Help）：传参时自动浮现圆角参数卡片，当前参数实时高亮
    opts.signature = {
      enabled = true,
      window = {
        border = "rounded",
        winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
        show_documentation = false, -- 禁用签名弹窗内的冗余大段文档，避免与 completion.documentation 叠加遮挡
      },
    }

    -- 6. 完整保留现有 Tab 键逻辑，并支持 <C-k> 随时手动唤起/关闭签名提示
    opts.keymap = opts.keymap or {}
    opts.keymap["<Tab>"] = {
      "select_next",
      LazyVim.cmp.map({ "snippet_forward", "ai_nes", "ai_accept" }),
      "fallback",
    }
    opts.keymap["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" }
    opts.keymap["<C-k>"] = { "show_signature", "hide_signature", "fallback" }
  end,
}
