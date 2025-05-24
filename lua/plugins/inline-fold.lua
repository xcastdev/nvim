return {
  'malbertzard/inline-fold.nvim',

  config = function()
    require('inline-fold').setup {
      defaultPlaceholder = '…',
      queries = {
        svelte = {
          { pattern = 'class="([^"]*)"' },
        },
        html = {
          { pattern = 'class="([^"]*)"' },
        },
      },
    }

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
      pattern = { '*.html', '*.tsx', '*.svelte' },
      callback = function(_)
        if not require('inline-fold.module').isHidden then
          vim.cmd 'InlineFoldToggle'
        end
      end,
    })
  end,
}
