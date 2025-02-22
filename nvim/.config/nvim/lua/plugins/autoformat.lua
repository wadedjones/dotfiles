-- autoformat.lua
--
-- Use your language server to automatically format your code on save.
-- Adds additional commands as well to manage the behavior

return {
	'stevearc/conform.nvim',
	opts = {
		vim.api.nvim_create_user_command('Format', function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					['end'] = { args.line2, end_line:len() },
				}
			end
			require('conform').format { async = true, lsp_format = 'fallback', range = range }
			-- vim.cmd 'normal! gg'
			-- vim.cmd 'normal! =G'
		end, { range = true }),
		notify_on_error = false,
		-- format_on_save = {
		--   timeout_ms = 500,
		--   lsp_fallback = true,
		-- },
		formatters_by_ft = {
			clang_format = {
				preprend_args = { '-style="{IndentWidth: 4}"' },
			},
			lua = { 'stylua' },
			c = { 'clang-format' },
			-- Conform can also run multiple formatters sequentially
			python = { 'isort', 'black' },
			--
			-- You can use a sub-list to tell conform to run *until* a formatter
			-- is found.
			javascript = { { 'prettierd', 'prettier' } },
		},
	},
}
