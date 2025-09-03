-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', ':Neotree toggle<CR>', desc = 'Toggle file [E]xplorer', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show hidden files by default
        hide_dotfiles = false, -- Don't hide dotfiles
        hide_gitignored = false, -- Don't hide gitignored files
        hide_hidden = false, -- This is the key setting for showing hidden files
        hide_by_name = {},
        hide_by_pattern = {},
        always_show = {},
        never_show = {},
      },
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
      window = {
        mappings = {
          ['<leader>e'] = 'close_window',
          ['H'] = 'toggle_hidden', -- Toggle hidden files with 'H'
        },
      },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          -- Change type
          added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted   = "✖",-- this can only be used in the git_status source
          renamed   = "󰁕",-- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored   = "",
          unstaged  = "󰄱",
          staged    = "",
          conflict  = "",
        }
      },
    },
  },
}
