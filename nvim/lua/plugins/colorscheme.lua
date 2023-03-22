return {
  -- Noobs' favorit dark colorscheme
  { "lifepillar/vim-gruvbox8" },
  -- Noobs' working colorscheme, for the hometown Chengdu
  { "yeahnoob/chengdu-west.nvim" },
  -- colorscheme in journey
  { "NLKNguyen/papercolor-theme" },
  { "https://gitlab.com/yorickpeterse/happy_hacking.vim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "chengdu-west-moon",
    },
  },
}
