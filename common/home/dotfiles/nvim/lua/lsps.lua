local lspconfig = require("lspconfig")
lspconfig.nixd.setup({
   settings = {
      nixd = {
         formatting = {
            command = { "nixfmt" },
         },
      },
   },
})
