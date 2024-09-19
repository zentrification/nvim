return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "bash",
        "c",
        "css",
        "elixir", 
        "haskell",
        "heex", 
        "html",
        "javascript", 
        "json",
        "lua",
        "query", 
        "ruby", 
        "scss",
        "terraform",
        "typescript",
        "vim",
        "vimdoc", 
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end
}
