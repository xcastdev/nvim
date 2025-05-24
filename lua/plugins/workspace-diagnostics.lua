return {
  'artemave/workspace-diagnostics.nvim',
  dependencies = {
    'folke/trouble.nvim',
  },
  keys = {
    {
      '<leader>xA',
      function()
        for _, client in ipairs(vim.lsp.get_clients()) do
          require('workspace-diagnostics').populate_workspace_diagnostics(client, 0)
        end
      end,
      desc = 'Workspace Diagnostics (Trouble)',
    },
  },
}
