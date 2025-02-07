-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.opt.relativenumber = true
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open File Explorer' })
-- diffview
vim.keymap.set('n', '<leader>do', vim.cmd.DiffviewOpen, { desc = 'Open Diffview' })
vim.keymap.set('n', '<leader>dc', vim.cmd.DiffviewClose, { desc = 'Close Diffview' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

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
  {
    'mfussenegger/nvim-dap',
  },
  {
    'mfussenegger/nvim-dap',
    config = function()
      require('dap').adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'node',
          -- 💀 Make sure to update this path to point to your installation
          args = { '/Users/michaelcarver/.config/nvim/js-debug/src/cdapDebugServer.js', '${port}' },
        },
      }

      require('dap').configurations.javascript = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
        },
      }
    end,
  },
}
