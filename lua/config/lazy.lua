-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.lazyvim_check_order = false

require('lazy').setup {
  spec = {
    { import = 'plugins' }, -- import/override with your plugins
  },
  defaults = {
    lazy = false, -- have all your custom plugins lazy-loaded by default.
    version = false, -- always use the latest git commit
  },
  install = {
    missing = true, -- install missing plugins on startup
  },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  },
  change_detection = {
    enabled = false, -- automatically check for config file changes and reload the ui
    notify = false, -- get a notification when changes are found
  },
  rocks = {
    enabled = false,
  },
  performance = {
    rtp = { -- disable some rtp plugins
      disabled_plugins = {
        'gzip',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}
