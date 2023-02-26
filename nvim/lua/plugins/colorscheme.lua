return {
  -- add gruvbox & papercolor
  { "lifepillar/vim-gruvbox8" },
  { "gongxgong/papercolor-theme" },
  { "yeahnoob/chengdu-west.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "chengdu-west-moon",
    },
  },
}
