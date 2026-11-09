return {
  "DNLHC/glance.nvim",
  cmd = "Glance",
  main = "glance",
  opts = {
    border = {
      enable = true,
    },
    folds = {
      fold_closed = "",
      fold_open = "",
      folded = false,
    },
    hooks = {
      before_open = function(results, open, jump)
        if #results == 1 then
          jump(results[1])
        else
          open(results)
        end
      end,
    },
  },
}
