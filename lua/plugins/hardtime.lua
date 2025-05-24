return {
  'm4xshen/hardtime.nvim',
  event = 'VeryLazy',
  dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
  opts = {
    disabled_filetypes = { 'qf', 'netrw', 'NvimTree', 'lazy', 'mason', 'oil' },
    disabled_keys = {
      ['<Up>'] = {},
      ['<Down>'] = {},
      ['<Right>'] = {},
      ['<Left>'] = {},
    },
  },
}
