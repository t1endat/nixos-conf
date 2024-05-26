---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      -- vim options can be configured here
      options = {
        opt = { -- vim.opt.<key>

          -- add this file
          colorcolumn = "80"
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
