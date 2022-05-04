-- LSP status
if not pcall(require, "lsp-status") then
  return
end

local lsp_status = require("lsp-status")
lsp_status.config({
  diagnostics = false,
  indicator_errors = "E",
  indicator_warnings = "W",
  indicator_info = "i",
  indicator_hint = "?",
  indicator_ok = "Ok",
  status_symbol = "",
})
lsp_status.register_progress()
