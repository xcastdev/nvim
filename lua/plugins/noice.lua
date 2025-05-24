-- For routing specific messages to different views
-- https://github.com/gennaro-tedesco/dotfiles/blob/0d09a8d4ea438e97fc273513e7a05b64aabe76d5/nvim/lua/plugins/noice.lua#L108-L116
--
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
	config = function()
		-- cmd and popup together
		require("noice").setup({
			-- @recording in notification box
			routes = {
				{
					view = "notify",
					filter = { event = "msg_showmode" },
				},
			},
		})

		-- search up and down in cmd line
		require("noice").setup({
			cmdline = {
				format = {
					search_down = {
						view = "cmdline",
					},
					search_up = {
						view = "cmdline",
					},
				},
			},
		})
	end,
}
