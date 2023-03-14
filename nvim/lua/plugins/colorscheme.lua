return {
  -- Noobs' favorit dark colorscheme
  { "lifepillar/vim-gruvbox8" },
  -- Noobs' working colorscheme, for the hometown Chengdu
  { "yeahnoob/chengdu-west.nvim" },
  -- colorscheme in journey
  {
    "Mofiqul/vscode.nvim",
    opts = function()
      local c = require('vscode.colors').get_colors()
      return {
        style="light",
        group_overrides = {
          -- this supports the same val table as vim.api.nvim_set_hl
          -- use colors from this colorscheme by requiring vscode.colors!
          Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
        },
      }
    end
  },
  { "https://gitlab.com/yorickpeterse/happy_hacking.vim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
