local M = {}

local function keymaps()
  local keymap = require("utils").set_keymap
  keymap("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files({hidden=true})<CR>")
  keymap("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>")
  keymap("n", "ga", "<cmd>lua require'telescope.builtin'.lsp_code_actions()<CR>")
  keymap("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>")
  keymap("n", "gvd", "<cmd>lua require'telescope.builtin'.lsp_type_definitions()<CR>")
  keymap("n", "gi", "<cmd>lua require'telescope.builtin'.lsp_implementations()<CR>")
  keymap("n", "gsb", "<cmd>lua require'telescope.builtin'.lsp_document_symbols()<CR>")
  keymap("n", "gsw", "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols()<CR>")
  keymap("n", "gsdw", "<cmd>lua require'telescope.builtin'.lsp_dynamic_workspace_symbols()<CR>")
end

-- Custom actions
local transform_mod = require("telescope.actions.mt").transform_mod
local path_actions = transform_mod {
  file_path = function(prompt_bufnr)
    -- Get selected entry and the file full path
    local content = require("telescope.actions.state").get_selected_entry()
    local full_path = content.cwd .. require("plenary.path").path.sep .. content.value

    -- Yank the path to unnamed and clipboard registers
    vim.fn.setreg('"', full_path)
    vim.fn.setreg("+", full_path)

    -- Close the popup
    require("utils").info "File path is yanked "
    require("telescope.actions").close(prompt_bufnr)
  end,
}

-- trouble.nvim
local trouble = require "trouble.providers.telescope"

function M.setup()
  local actions = require "telescope.actions"
  local telescope = require "telescope"

  -- Custom previewer
  local previewers = require "telescope.previewers"
  local Job = require "plenary.job"
  local preview_maker = function(filepath, bufnr, opts)
    filepath = vim.fn.expand(filepath)
    Job
      :new({
        command = "file",
        args = { "--mime-type", "-b", filepath },
        on_exit = function(j)
          local mime_type = vim.split(j:result()[1], "/")[1]

          if mime_type == "text" then
            -- Check file size
            vim.loop.fs_stat(filepath, function(_, stat)
              if not stat then
                return
              end
              if stat.size > 500000 then
                return
              else
                previewers.buffer_previewer_maker(filepath, bufnr, opts)
              end
            end)
          else
            vim.schedule(function()
              vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY FILE" })
            end)
          end
        end,
      })
      :sync()
  end

  telescope.setup {
    defaults = {
      buffer_previewer_maker = preview_maker,
      -- NOTE: make sure you use the correct lua regex syntax, otherwise telescope lsp functions won't func properly, aka no references results when use lsp_references.
      file_ignore_patterns = { "^.git/", "^node_modules/" },
      vimgrep_arguments = {
        "rg",
        "--hidden",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      path_display = { "truncate" },
      layout_config = {
        horizontal = { preview_width = 0.62 },
        vertical = { preview_height = 0.62 },
        bottom_pane = {
          height = 25,
          preview_width = 0.62,
          prompt_position = "top",
        },
      },
      mappings = {
        i = {
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,
          ["<c-z>"] = trouble.open_with_trouble,
        },
      },
    },
    pickers = {
      find_files = {
        theme = "ivy",
        mappings = {
          n = {
            ["y"] = path_actions.file_path,
          },
          i = {
            ["<C-y>"] = path_actions.file_path,
          },
        },
      },
      git_files = {
        theme = "dropdown",
        mappings = {
          n = {
            ["y"] = path_actions.file_path,
          },
          i = {
            ["<C-y>"] = path_actions.file_path,
          },
        },
      },
    },
  }

  telescope.load_extension "fzf"
  telescope.load_extension "project" -- telescope-project.nvim
  telescope.load_extension "repo"
  telescope.load_extension "file_browser"
  -- telescope.load_extension "projects" -- project.nvim
  telescope.load_extension "dap"
  telescope.load_extension "frecency"

  keymaps()
end

return M
