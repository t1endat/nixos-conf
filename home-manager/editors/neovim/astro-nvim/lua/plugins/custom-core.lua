---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      -- vim options can be configured here
      options = {
        opt = { -- vim.opt.<key>
          colorcolumn = "80",
          mouse = "",
        },
      },
    },

    mappings = {
      i = {
        ["<C-e>"] = { "<BS>",  desc = "delete backward char" },
      },
    },
  },
}
