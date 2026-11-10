return {

  -- Easily move anywhere in the file
  { "smoka7/hop.nvim", version = "*" },

  -- Easily move between diagnostics / git hunk / etc
  "liangxianzhe/nap.nvim",

  -- Smoothe page move
  "psliwka/vim-smoothie",

  -- Select increasingly larger regions
  "terryma/vim-expand-region",

  -- Add many text objs
  {
    "chrisgrieser/nvim-various-textobjs",
    main = "various-textobjs",
    opts = {
      keymaps = {
        useDefaults = true,
        disabledDefaults = { "gc" },
      },
    },
  },
}
