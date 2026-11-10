return {
  -- Handle connection to database
  { "ViSHNUPrABU/vim-dadbod", cmd = "DB" },

  -- UI design for dadbod
  {
    "ViSHNUPrABU/vim-dadbod-ui",
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
    dependencies = { "ViSHNUPrABU/vim-dadbod" },
  },

  -- Auto-completion for dadbod
  {
    "ViSHNUPrABU/vim-dadbod-completion",
    ft = { "sql", "mysql", "plsql" },
    dependencies = { "ViSHNUPrABU/vim-dadbod" },
  },
}
