-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.colorcolumn = '80,120'
vim.opt.tabstop = 4

-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open File Explorer' })
vim.keymap.set('n', '<leader>pv', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- autocmd TextChanged,TextChangedI <buffer> silent write
-- vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
--   buffer = 0,
--   callback = function(args)
--     vim.cmd 'silent write'
--     print(args)
--   end,
-- })

-- diffview
vim.keymap.set('n', '<leader>do', vim.cmd.DiffviewOpen, { desc = 'Open Diffview' })
vim.keymap.set('n', '<leader>dc', vim.cmd.DiffviewClose, { desc = 'Close Diffview' })

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { desc = 'Move focus to the upper window' })

return {
  {
    'sindrets/diffview.nvim',
  },
  {
    'tpope/vim-fugitive',
  },
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   config = function()
  --     vim.cmd 'colorscheme rose-pine'
  --   end,
  -- },
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'Mofiqul/vscode.nvim',
    name = 'vscode',
    config = function()
      vim.cmd 'colorscheme vscode'
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },
  {
    'github/copilot.vim',
  },
  --   {
  --     'rcarriga/nvim-dap-ui',
  --     dependencies = {
  --       'mfussenegger/nvim-dap',
  --       'nvim-neotest/nvim-nio',
  --     },
  --   },
  {
    'David-Kunz/jester',

    config = function()
      local jester = require 'jester'

      jester.setup {
        regexStartEnd = false,
      }

      vim.keymap.set('n', '<leader>tr', function()
        jester.run {
          cmd = 'npm run test:unit -- --runTestsByPath "$file" -t "$result"',
          regexStartEnd = false,
          escapeRegex = false,
          terminal_cmd = ':split | terminal',
        }
      end)

      vim.keymap.set('n', '<leader>tf', function()
        jester.run {
          cmd = 'npm run test:unit -- --runTestsByPath "$file"',
          regexStartEnd = false,
          escapeRegex = false,
          terminal_cmd = ':split | terminal',
        }
      end)

      vim.keymap.set('n', '<leader>td', function()
        jester.debug {
          -- cmd = 'npm run test:unit -- --selectProjects api --runTestsByPath "$file" -t "$result"',
          regexStartEnd = false,
          escapeRegex = false,
          terminal_cmd = ':split | terminal',
          dap = {
            type = 'pwa-node',
            sourceMaps = true,
          },
        }
      end)
    end,
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  {
    'wellle/context.vim',
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  {
    'kevinhwang91/nvim-ufo',
  },
}
