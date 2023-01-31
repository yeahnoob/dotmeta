return {
  -- add gruvbox & papercolor
  { "lifepillar/vim-gruvbox8" },
  { "gongxgong/papercolor-theme" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox8",
    },
  },
}
