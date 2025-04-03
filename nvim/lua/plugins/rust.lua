return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = "rust",
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
                for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = bufnr })) do
                  if client.supports_method("textDocument/codeAction") then
                    vim.lsp.buf.code_action({
                      context = {
                        only = { "source.organizeImports" },
                        diagnostics = {},
                      },
                    })
                  end
                end
              end,
            })
          end,
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = { command = "clippy" },
              cargo = { allFeatures = true },
              procMacro = { enable = true },
            },
          },
        },
      }
    end,
  },
}
