return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  cmd = "Dbee",
  build = function()
    require("dbee").install("curl")
  end,
  config = function()
    local sources = {}
    local staging_url = os.getenv("DBEE_STAGING_URL")
    if staging_url and staging_url ~= "" then
      table.insert(sources, {
        name = "SQLStaging",
        type = "sqlserver",
        url = staging_url,
      })
    end
    local local_url = os.getenv("DBEE_LOCAL_URL")
    if local_url and local_url ~= "" then
      table.insert(sources, {
        name = "Local",
        type = "sqlserver",
        url = local_url,
      })
    end

    require("dbee").setup({
      sources = {
        require("dbee.sources").MemorySource:new(sources),
      },
    })
  end,
}
