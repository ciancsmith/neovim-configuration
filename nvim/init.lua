-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.keymaps")
require("lazy").setup({
  { import = "plugins.core" },
  { import = "plugins.lsp" },
  { import = "plugins.dap" },
  { import = "plugins.rust" },
  { import = "plugins.docker" },
  { import = "plugins.ai" },
  { import = "plugins.qol-utilities" },
})
