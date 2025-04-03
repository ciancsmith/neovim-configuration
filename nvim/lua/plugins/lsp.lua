return {
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },
  { "hrsh7th/nvim-cmp", event = "InsertEnter", enabled = true},
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

