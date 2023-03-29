---@type LazySpec
local spec = {
  {
    "rbgrouleff/bclose.vim",
    lazy = true,
  },
  {
    "iberianpig/tig-explorer.vim",
    dependencies = {
      "rbgrouleff/bclose.vim",
    },
    config = function()
      vim.keymap.set("n", "<leader>", "<cmd>TigOpenProjectRootDir<cr>", { noremap = true })

      if vim.fn.has("nvim") then
        if vim.fn.has("nvr") then
          vim.cmd("let $GIT_EDITOR = 'nvr -cc split --remote-wait'")
          vim.cmd("autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete")
        end
      end
    end,
  },
}

return spec
