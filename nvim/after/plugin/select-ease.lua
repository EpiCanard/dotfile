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

local queries = {
  lua = lua_query,
  scala = scala_query,
}

local function map(mapping, previous, vertical, current)
  vim.keymap.set({ "n", "s", "i" }, mapping, function()
    select_ease.select_node({
      queries = queries,
      direction = previous and "previous" or "next",
      vertical_drill_jump = vertical,
      current_line_only = current,
    })
  end)
end

map("<C-A-h>", true, false, true)
map("<C-A-j>", false, true, false)
map("<C-A-k>", true, true, false)
map("<C-A-l>", false, false, true)

-- vim.keymap.set({ "n", "s", "i" }, "<C-A-k>", function()
--   select_ease.select_node({
--     queries = queries,
--     direction = "previous",
--     vertical_drill_jump = true,
--   })
-- end, {})
-- vim.keymap.set({ "n", "s", "i" }, "<C-A-j>", function()
--   select_ease.select_node({
--     queries = queries,
--     direction = "next",
--     vertical_drill_jump = true,
--   })
-- end, {})
-- vim.keymap.set({ "n", "s", "i" }, "<C-A-h>", function()
--   select_ease.select_node({
--     queries = queries,
--     direction = "previous",
--     current_line_only = true,
--   })
-- end, {})
-- vim.keymap.set({ "n", "s", "i" }, "<C-A-l>", function()
--   select_ease.select_node({
--     queries = queries,
--     direction = "next",
--     current_line_only = true,
--   })
-- end, {})
--
-- vim.keymap.set({ "n", "s", "i" }, "<C-A-p>", function()
--   select_ease.select_node({ queries = queries, direction = "previous" })
-- end, {})
-- vim.keymap.set({ "n", "s", "i" }, "<C-A-n>", function()
--   select_ease.select_node({ queries = queries, direction = "next" })
-- end, {})
