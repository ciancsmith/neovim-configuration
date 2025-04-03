return {
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- list everything else EXCEPT "rust_analyzer"
        "lua_ls",
        -- ...
      },
      handlers = {
        -- prevent mason-lspconfig from setting up rust_analyzer
        rust_analyzer = function() end,
      },
    },
  },

  { "hrsh7th/nvim-cmp", event = "InsertEnter", enabled = true },
  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = { "hrsh7th/nvim-cmp" },
  },
  {
    "hrsh7th/cmp-buffer",
    dependencies = { "hrsh7th/nvim-cmp" },
  },
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    dependencies = { "hrsh7th/nvim-cmp" },
  },
  {
    "hrsh7th/cmp-path",
    dependencies = { "hrsh7th/nvim-cmp" },
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
  },
  { "rafamadriz/friendly-snippets" },
}
