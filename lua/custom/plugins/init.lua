-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
	{
		'numToStr/Comment.nvim',
		opts = {},
	},

	{
		'folke/trouble.nvim',
		cmd = 'Trouble',
		opts = {},
		keys = {
			{ '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
			{ '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
			{ '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols (Trouble)' },
			{ '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', desc = 'LSP Definitions / references' },
			{ '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
			{ '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
		},
	},

	{
		'folke/flash.nvim',
		event = 'VeryLazy',
		opts = {},
		keys = {
			{
				'<leader>j',
				mode = { 'n', 'x', 'o' },
				function() require('flash').jump() end,
				desc = 'Flash Jump',
			},
			{
				'<leader>J',
				mode = { 'n', 'x', 'o' },
				function() require('flash').treesitter() end,
				desc = 'Flash Treesitter',
			},
		},
	},

	{
		'akinsho/toggleterm.nvim',
		version = '*',
		opts = {
			direction = 'float',
			shade_terminals = true,
			float_opts = {
				border = 'rounded',
			},
		},
		keys = {
			{ '<leader>tt', '<cmd>ToggleTerm direction=float<cr>', desc = 'Terminal (float)' },
			{ '<leader>tH', '<cmd>ToggleTerm size=15 direction=horizontal<cr>', desc = 'Terminal (horizontal)' },
			{ '<leader>tV', '<cmd>ToggleTerm size=50 direction=vertical<cr>', desc = 'Terminal (vertical)' },
		},
	},

	{
		'folke/persistence.nvim',
		event = 'BufReadPre',
		opts = {},
		keys = {
			{ '<leader>qs', function() require('persistence').load() end, desc = 'Restore Session' },
			{ '<leader>qS', function() require('persistence').select() end, desc = 'Select Session' },
			{ '<leader>ql', function() require('persistence').load { last = true } end, desc = 'Restore Last Session' },
			{ '<leader>qd', function() require('persistence').stop() end, desc = 'Stop Session Saving' },
		},
	},
}
