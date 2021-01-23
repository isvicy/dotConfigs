local g = vim.g

require('fzf_lsp').setup()

g['fzf_lsp_layout'] =  { window = { width = 0.9, height =  0.6, highlight =  Todo  }   }
g['fzf_preview_window'] = { 'up:62%', 'ctrl-/' }
