local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init

local options = {
  server = {
    on_attach = on_attach,
    on_init = on_init,
  },
}

return options
