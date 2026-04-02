---@module 'lazy'
---@type LazySpec
return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-neotest/neotest-go',
      'nvim-neotest/neotest-python',
      'nvim-neotest/neotest-jest',
      'rouge8/neotest-rust',
    },
    keys = {
      {
        '<leader>tr',
        function() require('neotest').run.run() end,
        desc = 'Test nearest',
      },
      {
        '<leader>tR',
        function() require('neotest').run.run(vim.fn.expand '%') end,
        desc = 'Test file',
      },
      {
        '<leader>ta',
        function() require('neotest').run.run(vim.fn.getcwd()) end,
        desc = 'Test all',
      },
      {
        '<leader>td',
        function() require('neotest').run.run { strategy = 'dap' } end,
        desc = 'Debug nearest test',
      },
      {
        '<leader>ts',
        function() require('neotest').summary.toggle() end,
        desc = 'Test summary',
      },
      {
        '<leader>to',
        function() require('neotest').output_panel.toggle() end,
        desc = 'Test output panel',
      },
      {
        '<leader>tO',
        function() require('neotest').output.open { enter = true, auto_close = true } end,
        desc = 'Test output',
      },
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require('neotest-python') {
            runner = 'pytest',
            dap = { justMyCode = false },
          },
          require 'neotest-go',
          require('neotest-jest') {
            jestCommand = 'npm test --',
            env = { CI = true },
            cwd = function() return vim.fn.getcwd() end,
          },
          require 'neotest-rust',
        },
      }
    end,
  },
}
