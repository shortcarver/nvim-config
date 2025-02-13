return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-jest',
    'marilari88/neotest-vitest',
  },
  keys = {
    {
      '<leader>td',
      function()
        require('neotest').run.debug { strategy = 'dap' }
      end,
      desc = 'Run Last Test',
    },
  },
  opts = function(_, opts)
    if not opts.adapters then
      opts.adapters = {}
    end
    table.insert(
      opts.adapters,
      require 'neotest-jest' {
        jestCommand = 'npm test --',
        jestConfigFile = 'jest.config.cjs',
        env = { CI = true },
        cwd = function()
          return vim.fn.getcwd()
        end,
      }
    )
    table.insert(opts.adapters, require 'neotest-vitest')
  end,
}
