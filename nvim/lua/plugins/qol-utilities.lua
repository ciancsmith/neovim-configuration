return {
  { "tpope/vim-fugitive" }, -- Git integration
  { "tpope/vim-surround" }, -- Modify surrounding characters
  { "tpope/vim-commentary", lazy = true }, -- Comment code easily
  { "tpope/vim-eunuch" }, -- Unix commands in Vim
  { "machakann/vim-highlightedyank" },
  { "lewis6991/gitsigns.nvim" }, -- Show Git diffs in the gutter
  {
   "windwp/nvim-autopairs",
   event = "InsertEnter",
   config = function()
     require("nvim-autopairs").setup({
       map_cr = false, -- disables Enter remap
     })
   end,
  },
  { "akinsho/git-conflict.nvim", lazy = true }, -- VSCode-style Git conflict resolution
  { "tpope/vim-abolish" }, -- Enhanced substitutions
  { "nmac427/guess-indent.nvim" }, -- Auto-detect indentation
  { 'MunifTanjim/prettier.nvim' }, -- Prettier support
  { "folke/noice.nvim", event = "VeryLazy", dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } },
  { "folke/trouble.nvim", cmd = "Trouble" }, -- diagnostics list
  { "folke/todo-comments.nvim" }, -- highlight TODO/FIXME
}
