local api = vim.api
local lspconfig = require('lspconfig')

-- Lua
local system_name
if vim.fn.has("mac") == 1 then
   system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
   system_name = "Linux"
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.expand("$HOME") .. "/github/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

-- Efm language server
-- https://github.com/mattn/efm-langserver
local eslint = {
   lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
   lintIgnoreExitCode = true,
   lintStdin = true,
   lintFormats = {'%f:%l:%c: %m'},
   formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
   formatStdin = true
}

local prettier = {formatCommand = 'prettier --stdin-filepath ${INPUT}', formatStdin = true}

local luaformatter = {
   formatCommand = 'lua-format -i --tab-width=3 --indent-width=3 --column-limit=120',
   formatStdin = true
}

require'navigator'.setup({
   treesitter_analysis = true, -- treesitter variable context
   on_attach = function(client, bufnr)
      require("lsp_signature").on_attach({
         bind = true,
         hint_enable = true,
         handler_opts = {border = "shadow"},
         floating_window = false
      })
   end,
   default_mapping = true,
   keymaps = {
      {key = "gd", func = "definition()"}, {key = "gr", func = "references()"},
      {key = "ga", func = "require('navigator.codeAction').code_action()"},
      {key = "<Leader>rn", func = "require('navigator.rename').rename()"},
      {key = "<Leader>gi", func = "incoming_calls()"}, {key = "<Leader>go", func = "outgoing_calls()"},
      {key = "gi", func = "implementation()"},
      {key = "gL", func = "require('navigator.diagnostics').show_line_diagnostics()"},
      {key = "gG", func = "require('navigator.diagnostics').show_diagnostic()"},
      {key = "]d", func = "diagnostic.goto_next({ border = 'rounded', max_width = 80})"},
      {key = "[d", func = "diagnostic.goto_prev({ border = 'rounded', max_width = 80})"},
      {key = "]r", func = "require('navigator.treesitter').goto_next_usage()"},
      {key = "[r", func = "require('navigator.treesitter').goto_previous_usage()"}
   },
   lsp = {
      disable_lsp = {"clangd"},
      gopls = {usePlaceholders = false},
      sumneko_lua = {
         sumneko_root_path = sumneko_root_path,
         sumneko_binary = sumneko_binary,
         on_attach = function(client, bufnr) client.resolved_capabilities.document_formatting = false end
      },
      tsserver = {on_attach = function(client, bufnr) client.resolved_capabilities.document_formatting = false end},
      efm = {
         on_attach = function(client, bufnr) client.resolved_capabilities.document_formatting = true end,
         init_options = {documenFormatting = true, codeAction = false, document_formatting = true},
         filetypes = {
            "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescript.tsx", "typescriptreact",
            "less", "scss", "css", "lua"
         },

         settings = {
            log_level = 1,
            log_file = '~/efm.log',
            languages = {
               less = {prettier},
               css = {prettier},
               html = {prettier},
               javascript = {prettier, eslint},
               javascriptreact = {prettier, eslint},
               json = {prettier},
               lua = {luaformatter},
               markdown = {prettier},
               scss = {prettier},
               typescript = {prettier, eslint},
               typescriptreact = {prettier, eslint},
               yaml = {prettier},
               ["javascript.jsx"] = {prettier, eslint},
               ["typescript.tsx"] = {prettier, eslint}
            }
         }
      }
   }
})

api.nvim_command("hi default LspReferenceRead cterm=bold gui=Bold ctermbg=yellow guifg=none guibg=Black")
api.nvim_command("hi default LspReferenceText cterm=bold gui=Bold ctermbg=yellow guifg=none guibg=Black")
api.nvim_command("hi default LspReferenceWrite cterm=bold gui=Bold ctermbg=yellow guifg=none guibg=Black")
api.nvim_command(
    "hi default GHListHl guifg=#eceff4 ctermfg=189 guibg=#2d3439 ctermbg=238 gui=bold,italic cterm=bold,italic")
