---@type LazySpec
return {
  "kyoh86/ddu-source-git_branch",
  name = "ddu-source_git_branch",
  dependencies = {
    "ddu.vim",
  },
  config = function()
    local helpers = require("helpers.ddu")

    helpers.patch_local("ff:git_branch", {
      sources = {
        {
          name = "git_branch",
          columns = {
            "git_branch_head",
            "git_branch_remote",
            "git_branch_name",
            "git_branch_upstream",
            "git_branch_author",
          },
        },
      },
      sourceOptions = {
        ["git_branch"] = {
          volatile = true,
          matchers = {
            "matcher_fzf",
          },
        },
      },
      kindOptions = {
        ["git_branch"] = {
          defaultAction = "switch",
        },
      },
    })
  end,
}
