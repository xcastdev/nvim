-- For routing specific messages to different views
-- https://github.com/gennaro-tedesco/dotfiles/blob/0d09a8d4ea438e97fc273513e7a05b64aabe76d5/nvim/lua/plugins/noice.lua#L108-L116
--
return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {},
  --stylua: ignore
  keys = {
    { '<leader>nd', function() require('noice').cmd 'dismiss' end, desc = '[D]ismiss Messages' },
    { '<leader>nh', function() require('noice').cmd 'history' end, desc = 'Show [H]istory' },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    -- cmd and popup together
    require('noice').setup {
      -- @recording in notification box
      routes = {
        {
          view = 'notify',
          filter = { event = 'msg_showmode' },
        },
      },
    }

    -- search up and down in cmd line
    require('noice').setup {
      cmdline = {
        format = {
          search_down = {
            view = 'cmdline',
          },
          search_up = {
            view = 'cmdline',
          },
        },
      },
    }
  end,
}
