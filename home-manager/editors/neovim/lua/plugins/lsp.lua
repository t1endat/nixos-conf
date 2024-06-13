return {
  -- disable mason for can not work in NixOS
  { "williamboman/mason-lspconfig.nvim", enabled = false },
  { "williamboman/mason.nvim",           enabled = false },

  -- work with nixOS
  {
    "dundalek/lazy-lsp.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings to learn the available actions
        lsp_zero.default_keymaps({
          buffer = bufnr,
          preserve_mappings = false
        })
      end)

      require("lazy-lsp").setup {
        -- By default all available servers are set up. Exclude unwanted or misbehaving servers.
        excluded_servers = {
          -- c
          "clangd",
          "ccls",
          "sourcekit",

          -- python
          "jedi_language_server",
          "pylsp",
          "pylyzer",
          "ruff_lsp",

          -- rust
          "rust-analyzer",

          -- nix
          "rnix",
        },
      }
    end,
  },
}
