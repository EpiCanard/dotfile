return {

  -- Easily move anywhere in the file
  { "phaazon/hop.nvim", branch = "v2" },

  -- Easily move between treesiter node
  "ziontee113/SelectEase",

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
      useDefaultKeymaps = true,
      disabledKeymaps = { "gc" },
    },
  },
}
