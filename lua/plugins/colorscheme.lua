-- https://github.com/rose-pine/neovim

return {
  "folke/tokyonight.nvim",

  opts = function()
    return {
      -- not working ?!
      style = "night",
      transparent = true
    }
  end,

  -- wtf is this not working with lazy.vim
  config = function()
    vim.cmd[[colorscheme tokyonight-night]]
  end
}
