return {
  "snacks.nvim",
  opts = {
    indent = { enabled = true, chunk = { enabled = true } },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 2000,
      width = { min = 30, max = 0.35 },
      height = { min = 1, max = 5 },
      padding = false,
      filter = function(notif)
        local msg = notif.msg or ""
        if notif.level == "error" and (msg:find("Error in .*Autocommands") or msg:find("vim/snippet%.lua")) then
          return false
        end
        return true
      end,
    },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
    },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    toggle = { map = LazyVim.safe_keymap_set },
    words = { enabled = true },
  },
  -- stylua: ignore
  keys = {
    { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
  },
}
