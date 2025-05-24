return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  keys = {
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    {
      '<leader>S',
      function()
        Snacks.scratch.select()
      end,
      desc = 'Select Scratch Buffer',
    },
  },
  opts = {
    scratch = {
      enabled = true,
      root = vim.fn.getcwd() .. '/.scratch',
      win_by_ft = {
        go = {
          keys = {
            ['source'] = {
              '<cr>',
              function(self)
                vim.cmd('w !go run ' .. vim.api.nvim_buf_get_name(self.buf))
              end,
              desc = 'Run GO Code',
              mode = { 'n' },
            },
          },
        },
        python = {
          keys = {
            ['source'] = {
              '<cr>',
              function(self)
                vim.cmd 'w !python'
              end,
              desc = 'Run Python Code',
              mode = { 'n' },
            },
          },
        },
      },
    },
    styles = {
      scratch = {
        width = 100,
        height = 30,
        bo = { buftype = '', buflisted = false, bufhidden = 'hide', swapfile = false },
        minimal = false,
        noautocmd = false,
        -- position = "right",
        zindex = 20,
        wo = { winhighlight = 'NormalFloat:Normal' },
        border = 'rounded',
        title_pos = 'center',
        footer_pos = 'center',
        keys = {
          ['close'] = {
            '<esc>',
            'close',
            desc = 'close',
            mode = { 'n' },
          },
        },
      },
    },
  },
}
