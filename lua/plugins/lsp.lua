return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  require("lspconfig").pyright.setup({}),
  require("lspconfig").java_language_server.setup({}),
  require("lspconfig").markdown_oxide.setup({}),
  require("lspconfig").rust_analyzer.setup({}),
  require("lspconfig").ltex.setup({}),
}
