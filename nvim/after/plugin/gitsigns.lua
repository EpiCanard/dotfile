require("gitsigns").setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map("n", "<leader>hj", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    map("n", "<leader>hk", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    -- Actions
    -- Stage
    map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
    map("n", "<leader>hS", gs.stage_buffer)

    -- Stage
    map("n", "<leader>hu", gs.undo_stage_hunk)
    map("n", "<leader>hU", ":Gitsigns reset_buffer_index<CR>")

    -- Reset
    map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
    map("n", "<leader>hR", gs.reset_buffer)

    -- Preview
    map("n", "<leader>hh", function()
      gs.toggle_linehl()
      gs.toggle_deleted()
    end)

    -- Blame
    map("n", "<leader>hb", function()
      gs.blame_line({ full = true })
    end)
    map("n", "<leader>hB", gs.toggle_current_line_blame)

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end,
  current_line_blame_opts = {
    delay = 100,
  },
  preview_config = {
    row = 1,
  },
})
