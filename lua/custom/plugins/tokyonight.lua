if true then
  return {}
end

return {
  {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup {
        style = 'moon', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      }
    end,
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'tokyonight-moon',
    },
  },
}
