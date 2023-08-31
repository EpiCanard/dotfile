local nap = require("nap")

nap.setup({
  next_prefix = "<leader><CR>",
  next_repeat = "<c-j>",
  prev_repeat = "<c-k>",
})

local function gitsigns()
  -- Whether we are in a diff mode where "]c" "[c" will likely work better for hunks.
  local function in_diff_mode()
    return vim.wo.diff or vim.bo.filetype == "fugitive" or vim.bo.filetype == "git"
  end
  return {
    next = {
      rhs = function()
        if in_diff_mode() then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk({ preview = false })
        end)
        return "<Ignore>"
      end,
      opts = { desc = "Next diff", expr = true },
    },
    prev = {
      rhs = function()
        if in_diff_mode() then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk({ preview = false })
        end)
        return "<Ignore>"
      end,
      opts = { desc = "Prev diff", expr = true },
    },
    mode = { "n", "x", "o" },
  }
end

nap.map("c", gitsigns())
