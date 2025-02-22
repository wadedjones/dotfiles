return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	defaults = {
	},
	opts = {
	},
	winopts = {
		backdrop = 100,
	},
	fzf_opts = {
		['--layout'] = 'reverse-list',
	},
	config = function()
		require('fzf-lua').setup({
			winopts = {
				backdrop = 100,
			},
			fzf_opts = {
				['--layout'] = 'default'
			},
			vim.keymap.set('n', '<leader>sf', require('fzf-lua').files, {desc = '[S]earch [F]iles'}),
			vim.keymap.set('n', '<leader><space>', require('fzf-lua').buffers, {desc = 'Find existing buffers'}),
			vim.keymap.set('n', '<leader>g', require('fzf-lua').grep, {desc = '[G]rep current directory'}),
			vim.keymap.set('n', '<leader>/', require('fzf-lua').grep_curbuf, {desc = '[/] grep current file'}),
			vim.keymap.set('n', '<leader>fx', require('fzf-lua').quickfix, {desc = 'Open quick [f]i[x] menu'}),
			vim.keymap.set('n', 'gd', require('fzf-lua').lsp_definitions),
			vim.keymap.set('n', 'gp', require('fzf-lua').lsp_implementations),
		})
	end
}
