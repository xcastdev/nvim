return {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gosum' },
  root_markers = {
    'go.mod',
    'go.sum',
  },
  settings = {
    gopls = {
      analyses = {
        fillstruct = true,
        printf = true,
        nilness = true,
        unusedwrite = true,
        useany = true,
        unusedparams = true,
        fieldalignment = true,
        inferTypeArgs = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      usePlaceholders = true,
      completeUnimported = true,
      directoryFilters = { '-.git', '-.vscode', '-.idea', '-.vscode-test', '-node_modules', '-.nvim' },
      staticcheck = true,
      gofumpt = true,
      semanticTokens = true,
    },
  },
}
