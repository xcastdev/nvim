return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      keymaps = {
        ['<BS>'] = 'actions.parent',
        ['<leader>cc'] = {
          mode = 'n',
          desc = 'Copy File Contents',
          callback = function()
            local oil = require 'oil'
            local entry = oil.get_cursor_entry() -- Get the current entry
            local dir = oil.get_current_dir()
            if entry and dir and entry.name then
              local path = dir .. entry.name -- Path of the hovered file
              local filename = vim.fn.fnamemodify(path, ':t') -- Extract the filename
              local contents = vim.fn.readfile(path) -- Read the file contents
              local joined_contents = table.concat(contents, '\n') -- Join the lines into a single string

              -- Add prefix with filename and separator
              local prefixed_contents = string.format('%s\n--------------------------\n%s', filename, joined_contents)

              vim.fn.setreg('+', prefixed_contents) -- Copy to the system clipboard
              vim.notify('File contents copied to clipboard!', vim.log.levels.INFO)
            else
              vim.notify('No file selected or hovered!', vim.log.levels.WARN)
            end
          end,
        },
      },
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
          local hidden_names = {
            '..',
            '.git',
            '.DS_Store',
            '__pycache__',
            'node_modules',
            '.venv',
            '.scratch',
          }
          for _, hidden_name in ipairs(hidden_names) do
            if name == hidden_name then
              return true
            end
          end
          return false
        end,
      },
    }
  end,
}
