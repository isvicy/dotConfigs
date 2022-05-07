local M = {}

function M.setup()
  vim.g.coq_settings = {
    auto_start = "shut-up",
    clients = {
      tabnine = {
        enabled = true,
      },
    },
    keymap = {
      recommended = false,
      jump_to_mark = "<c-e>",
    },
  }
  local coq = require("coq")
  local coq_3p = require("coq_3p")

  -- 3party sources
  coq_3p({
    { src = "copilot", short_name = "COP", accept_key = "<C-y>" },
    { src = "nvimlua", short_name = "nLUA", conf_only = false }, -- Lua
    { src = "figlet", trigger = "!big" }, -- figlet command
    {
      src = "repl",
      sh = "zsh",
      shell = { p = "perl", n = "node" },
      max_lines = 99,
      deadline = 500,
      unsafe = { "rm", "poweroff", "mv" },
    },
  })

  coq.Now() -- Start coq
end

return M
