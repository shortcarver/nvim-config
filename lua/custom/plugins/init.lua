-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.colorcolumn = '80,120'
vim.opt.tabstop = 4

vim.opt.wrap = false

vim.api.nvim_create_user_command('Q', 'q', { nargs = 0 })
vim.api.nvim_create_user_command('W', 'w', { nargs = 0 })

-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open File Explorer' })
vim.keymap.set('n', '<leader>pv', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- copy current path to clipboard
vim.keymap.set('n', '<leader>yp', "<CMD>let @+ = expand('%:p')<CR>", { desc = '[Y]ank current [p]ath to clipboard' })

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

-- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>cc', vim.cmd.CopilotChatOpen, { desc = '[C]opilot [C]hat Open' })
vim.keymap.set('n', '<leader>cq', vim.cmd.CopilotChatClose, { desc = '[C]opilot [Q]uit Chat' })
vim.keymap.set('n', '<leader>cr', vim.cmd.CopilotChatReset, { desc = '[C]opilot [R]eset Chat' })

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'vscode',
  -- group = ...,
  callback = function()
    vim.api.nvim_set_hl(0, 'CopilotSuggestion', {
      fg = '#55FF55',
      ctermfg = 8,
      force = true,
    })
  end,
})
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
  -- {
  --   'folke/tokyonight.nvim',
  --   priority = 1000, -- Make sure to load this before all the other start plugins.
  --   init = function()
  --     -- Load the colorscheme here.
  --     -- Like many other themes, this one has different styles, and you could load
  --     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  --     vim.cmd.colorscheme 'tokyonight-storm'
  --
  --     -- You can configure highlights by doing something like:
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },
  -- {
  --   'catppuccin/nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd 'colorscheme catppuccin'
  --   end,
  -- },
  {
    'Mofiqul/vscode.nvim',
    name = 'vscode',
    config = function()
      require('vscode').setup {
        transparent = true,
      }
      vim.cmd 'colorscheme vscode'
    end,
  },
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },
  {
    'github/copilot.vim',
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  --   {
  --     'rcarriga/nvim-dap-ui',
  --     dependencies = {
  --       'mfussenegger/nvim-dap',
  --       'nvim-neotest/nvim-nio',
  --     },
  --   },
  {
    'shortcarver/jester',

    config = function()
      local jester = require 'jester'

      jester.setup {
        regexStartEnd = false,
      }

      vim.keymap.set('n', '<leader>ty', function()
        jester.yank {
          cmd = 'npm run test:unit -- --runTestsByPath "$file" -t "$result"',
          regexStartEnd = false,
          escapeRegex = false,
        }
      end, { desc = 'Yank Test Command' })

      vim.keymap.set('n', '<leader>tY', function()
        jester.yank {
          cmd = 'npm run test:unit -- --runTestsByPath "$file"',
          regexStartEnd = false,
          escapeRegex = false,
        }
      end, { desc = 'Yank test file command' })

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
