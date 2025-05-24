return {
  'folke/trouble.nvim',
  opts = {
    modes = {
      floating_diagnostics = {
        desc = 'diagnostics',
        filter = {
          any = {
            {
              severity = vim.diagnostic.severity.ERROR,
              -- limit to files in the current project
              function(item)
                return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
              end,
            },
          },
        },
        events = { 'DiagnosticChanged', 'BufEnter' },
        -- Trouble classic for other buffers,
        -- but only if they are in the current directory
        source = 'diagnostics',
        groups = {
          -- { format = "{hl:Special}󰚢 {hl} {hl:Title}Diagnostics{hl} {count}" },
          -- { "severity", format = "{severity_icon} {severity} {count}" },
          -- { "dirname", format = "{hl:Special} {hl} {dirname} {count}" },
          { 'directory' },
          { 'filename', format = '{file_icon} {basename} {count}' },
        },
        sort = { 'severity', 'filename', 'pos', 'message' },
        format = '{severity_icon} {message:md} {item.source} {code} {pos}',
        preview = {
          type = 'float',
          relative = 'editor',
          border = 'rounded',
          title = 'Preview',
          title_pos = 'center',
          position = { 0, -2 },
          size = { width = 0.5, height = 0.5 },
          zindex = 200,
        },
      },
    },
  },
  event = 'VeryLazy',
  keys = {
    {
      '<leader>xt',
      '<cmd>Trouble todo toggle<cr>',
      desc = "TODO's (Trouble)",
    },
    {
      '<leader>xx',
      '<cmd>Trouble floating_diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xX',
      '<cmd>Trouble floating_diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>cl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>xL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>xQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
  },
}
