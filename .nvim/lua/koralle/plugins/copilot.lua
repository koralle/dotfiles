---@type LazySpec
local spec = {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      ensure("copilot", function(m)
        m.setup({
          suggestion = {
            enabled = false,
            auto_trigger = true,
          },
          filetypes = {
            yaml = true,
            markdown = true,
            gitcommit = true,
            gitrebase = true,
          },
          panel = {
            enabled = false,
          },
        })
      end)
    end,
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     ensure("copilot", function(m)
  --       m.setup({
  --         suggestion = { enabled = false },
  --         panel = { enabeld = false },
  --       })
  --     end)
  --   end,
  -- },
}

return spec
