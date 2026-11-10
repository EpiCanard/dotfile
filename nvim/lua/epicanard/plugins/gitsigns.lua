return function()
  local gitsigns = require("gitsigns")

  gitsigns.setup({
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

  local Hydra = require("hydra")
  local hint = [[
        _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
        _K_: prev hunk   _u_: undo stage hunk   _p_: preview hunk   _B_: blame show full
        _x_: reset hunk  _S_: stage buffer      ^ ^                 _/_: show base file
        ^
        ^ ^              _<Enter>_: Neogit              _q_: exit
        ]]

  Hydra({
    hint = hint,
    config = {
      color = "pink",
      invoke_on_body = true,
      hint = {
        position = "bottom",
        float_opts = {
          border = "rounded",
        },
      },
      on_enter = function()
        gitsigns.toggle_linehl(true)
      end,
      on_exit = function()
        gitsigns.toggle_linehl(false)
        gitsigns.toggle_deleted(false)
      end,
    },
    mode = { "n", "x" },
    body = "<leader>ha",
    heads = {
      {
        "J",
        function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gitsigns.next_hunk()
          end)
          return "<Ignore>"
        end,
        { expr = true },
      },
      {
        "K",
        function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gitsigns.prev_hunk()
          end)
          return "<Ignore>"
        end,
        { expr = true },
      },
      { "x", gitsigns.reset_hunk },
      { "s", ":Gitsigns stage_hunk<CR>", { silent = true } },
      { "u", gitsigns.undo_stage_hunk },
      { "S", gitsigns.stage_buffer },
      { "p", gitsigns.preview_hunk },
      { "d", gitsigns.toggle_deleted, { nowait = true } },
      { "b", gitsigns.blame_line },
      {
        "B",
        function()
          gitsigns.blame_line({ full = true })
        end,
      },
      { "/", gitsigns.show, { exit = true } },
      { "<Enter>", "<cmd>Neogit<CR>", { exit = true } },
      { "q", nil, { exit = true, nowait = true } },
    },
  })
end
