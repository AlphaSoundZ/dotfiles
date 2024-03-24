local lsp_signature = require "lsp_signature"

lsp_signature.setup {
  on_attach = function(client, bufnr)
    require("lsp_signature").on_attach({
      bind = true,
      handler_opts = {
        border = "single",
      },
    }, bufnr)
  end,
}

return lsp_signature
