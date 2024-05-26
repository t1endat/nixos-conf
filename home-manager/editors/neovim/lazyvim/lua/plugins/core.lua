return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  { 
    "max397574/better-escape.nvim",
    opts = function()
      require("better_escape").setup()
    end,
  },
}
