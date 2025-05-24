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
  ---@type snacks.Config
  opts = {
    -- Efficient animations including over 45 easing functions (library)
    animate = { enabled = false }, ---@diagnostic disable-line: missing-fields
    -- Deal with big files
    bigfile = { enabled = true },
    -- Delete buffers without disrupting window layout
    bufdelete = { enabled = false },
    -- Beautiful declarative dashboards
    dashboard = { enabled = false },
    -- Pretty inspect & backtraces for debugging
    debug = { enabled = true },
    -- Focus on the active scope by dimming the rest
    dim = { enabled = false },
    -- A file explorer (picker in disguise)
    explorer = { enabled = false },
    -- Git utilities
    git = { enabled = false },
    -- Open the current file, branch, commit, or repo in a browser (e.g. GitHub, GitLab, Bitbucket)
    gitbrowse = { enabled = false },
    -- Indent guides and scopes
    indent = { enabled = false },
    -- Better vim.ui.input
    input = { enabled = false },
    -- Window layouts
    layout = { enabled = false },
    -- Open LazyGit in a float, auto-configure colorscheme and integration with Neovim
    lazygit = { enabled = false },
    -- Pretty vim.notify
    notifier = { enabled = false },
    -- Utility functions to work with Neovim's vim.notify
    notify = { enabled = false },
    -- Picker for selecting items
    picker = { enabled = false },
    -- Neovim lua profiler
    profiler = { enabled = false }, ---@diagnostic disable-line: missing-fields
    -- When doing nvim somefile.txt, it will render the file as quickly as possible, before loading your plugins.
    quickfile = { enabled = false },
    -- LSP-integrated file renaming with support for plugins like neo-tree.nvim and mini.files.
    rename = { enabled = false },
    -- Scope detection, text objects and jumping based on treesitter or indent
    scope = { enabled = false },
    -- Scratch buffers with a persistent file
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
    -- Smooth scrolling
    scroll = { enabled = false },
    -- Pretty status column
    statuscolumn = { enabled = false },
    -- Create and toggle floating/split terminals
    terminal = { enabled = false },
    -- Toggle keymaps integrated with which-key icons / colors
    toggle = { enabled = false }, ---@diagnostic disable-line: missing-fields
    -- Utility functions for Snacks (library)
    util = { enabled = false },
    -- Create and manage floating windows or splits
    win = { enabled = false }, ---@diagnostic disable-line: missing-fields
    -- Auto-show LSP references and quickly navigate between them
    words = { enabled = false },
    -- Zen mode • distraction-free coding
    zen = { enabled = false }, ---@diagnostic disable-line: missing-fields
  },
}
