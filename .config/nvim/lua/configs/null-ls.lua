local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
  formatting.prettier,
  formatting.stylua,
  formatting.gofumpt,
  formatting.goimports_reviser,
  formatting.golines,
  -- null_ls.builtins.diagnostics.black,
  null_ls.builtins.diagnostics.mypy,
  null_ls.builtins.diagnostics.ruff,
}

null_ls.setup {
  debug = true,
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format { async = false, bufnr = bufnr }
        end,
      })
    end
  end,
}
