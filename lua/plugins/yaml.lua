-- ~/.config/nvim/lua/plugins/yaml.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                enable = false,
                url = "",
              },
              schemas = {
                kubernetes = "*.yaml",
              },
            },
          },
        },
      },
    },
  },
}
