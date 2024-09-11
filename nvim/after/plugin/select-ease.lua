local select_ease = require("SelectEase")

local lua_query = [[
            ;; query
            ((identifier) @cap)
            ("string_content" @cap)
            ((true) @cap)
            ((false) @cap)
        ]]
local scala_query = [[
            ;; query
            ((identifier) @cap)
        ]]
local java_query = [[
            ;; query
            ((identifier) @cap)
        ]]
local javascript_query = [[
            ;; query
            ((identifier) @cap)
        ]]
local typescript_query = [[
            ;; query
            ((identifier) @cap)
        ]]

local queries = {
  lua = lua_query,
  scala = scala_query,
  java = java_query,
  javascript = javascript_query,
  typescript = typescript_query,
}

local function map(mapping, previous, vertical, current, swap)
  vim.keymap.set({ "n", "s", "i" }, mapping, function()
    local params = {
      queries = queries,
      direction = previous and "previous" or "next",
      vertical_drill_jump = vertical,
      current_line_only = current,
    }
    if swap then
      select_ease.swap_nodes(params)
    else
      select_ease.select_node(params)
    end
  end)
end

map("<A-h>", true, false, true, false)
map("<A-j>", false, true, false, false)
map("<A-k>", true, true, false, false)
map("<A-l>", false, false, true, false)
map("<C-A-h>", true, false, true, true)
map("<C-A-j>", false, true, false, true)
map("<C-A-k>", true, true, false, true)
map("<C-A-l>", false, false, true, true)
