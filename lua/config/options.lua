-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 1. 缩短空闲响应时间（从 4000ms 降至 250ms，加快 CursorHold 悬浮和高亮响应）
vim.opt.updatetime = 250

-- 2. 快捷键判定时间缩短至 300ms（击键组合判定更凌厉）
vim.opt.timeoutlen = 300

-- 3. 核心：禁用动态 Treesitter AST 折叠计算（避免每次敲击按键触发全量语法树重算）
vim.opt.foldmethod = "manual"

-- 4. 优化重绘调度
vim.opt.lazyredraw = false

-- 5. 全局浮窗统一精致圆角边框（与 blink.cmp、lsp 浮窗样式高度统一，Neovim 0.12 原生支持）
vim.opt.winborder = "rounded"
