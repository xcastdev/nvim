return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup({
			-- this config assumes you have OPENAI_API_KEY environment variable set
			openai_params = {
				-- NOTE: model can be a function returning the model name
				-- this is useful if you want to change the model on the fly
				-- using commands
				-- Example:
				-- model = function()
				--     if some_condition() then
				--         return "gpt-4-1106-preview"
				--     else
				--         return "gpt-3.5-turbo"
				--     end
				-- end,
				model = "gpt-4o",
				keys = {
					{ "<leader>cc", "<cmd>ChatGPT<CR>", "ChatGPT" },
					{
						"<leader>cc",
						"<cmd>ChatGPTEditWithInstruction<CR>",
						"Edit with instruction",
						mode = { "n", "v" },
					},
					{
						"<leader>cg",
						"<cmd>ChatGPTRun grammar_correction<CR>",
						"Grammar Correction",
						mode = { "n", "v" },
					},
					{ "<leader>ct", "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
					{ "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
					{ "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
					{ "<leader>ca", "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
					{ "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
					{ "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
					{ "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
					{ "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
					{ "<leader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
					{
						"<leader>cl",
						"<cmd>ChatGPTRun code_readability_analysis<CR>",
						"Code Readability Analysis",
						mode = { "n", "v" },
					},
				},
				frequency_penalty = 0,
				presence_penalty = 0,
				max_tokens = 4095,
				temperature = 0.2,
				top_p = 0.1,
				n = 1,
			},
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim", -- optional
		"nvim-telescope/telescope.nvim",
	},
}
