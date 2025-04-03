return {
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "MunifTanjim/nui.nvim" },
  { "nvim-treesitter/nvim-treesitter", event = "BufReadPost" },
  { "folke/tokyonight.nvim", priority = 1000 },
  { "nvim-lualine/lualine.nvim" },
  { "akinsho/bufferline.nvim" },
  { "rcarriga/nvim-notify" },
  { "lukas-reineke/indent-blankline.nvim" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = { preset = "modern" },
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      {
        "<leader>e",
        function()
          -- Open Neo-tree rooted at cwd
          require("neo-tree.command").execute({ toggle = true, dir = vim.fn.getcwd() })
        end,
        desc = "Toggle Neo-tree (cwd)",
      },
      {
        "<leader>fe",
        function()
          -- Focus Neo-tree on current file
          require("neo-tree.command").execute({ action = "focus", dir = vim.fn.getcwd() })
        end,
        desc = "Focus Neo-tree",
      },
    },
    opts = {
      enable_git_status = true,
      enable_diagnostics = true,
      sources = { "filesystem", "buffers", "git_status" }, -- enable git view
      default_source = "filesystem",
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        use_libuv_file_watcher = true,
        hijack_netrw_behavior = "open_current",
      },
      window = {
        mappings = {
          -- Show git status in left pane
          ["gs"] = "show_git_status",
        },
      },
    },
  },
}
