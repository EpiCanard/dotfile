return function()
  local telescope = require("telescope")

  local function display_path(_, path)
    local is_test_file = path:find("src/test", 1, true) ~= nil
    path = path:gsub("^%./", "")
    local prefix = path:match("applications?/([%w-_]+)/") or path:match("modules/([%w-_]+)/")
    local short_path = path:match("scala/[%w-_]+/[%w-_]+/[%w-_]+/(.*)") or path:match("resources/.*") or path
    prefix = prefix and prefix .. " | " or ""

    local formatted_path = prefix .. short_path
    local highlights
    if is_test_file then
      highlights = { { { 0, #formatted_path }, "TelescopeTestFile" } }
    end

    return formatted_path, highlights
  end

  telescope.setup({
    defaults = {
      path_display = display_path,
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        n = {
          ["dd"] = require("telescope.actions").delete_buffer,
          ["pp"] = require("telescope.actions.layout").toggle_preview,
        },
        i = {
          ["<C-d>"] = require("telescope.actions").delete_buffer,
          ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
          ["<C-n>"] = require("telescope.actions.layout").cycle_layout_next,
          ["<C-j>"] = require("telescope.actions").cycle_history_next,
          ["<C-k>"] = require("telescope.actions").cycle_history_prev,
        },
      },
    },
    pickers = {
      git_status = {
        path_display = { "truncate" },
      },
    },
    extensions = {
      project = {
        base_dirs = {
          vim.fs.normalize(vim.env.BASE_PROJECTS or vim.fn.expand("~/Projects")),
        },
      },
      smart_open = {
        match_algorithm = "fzf",
      },
    },
  })

  telescope.load_extension("fzf")
  telescope.load_extension("smart_open")
  telescope.load_extension("project")
  if package.loaded.metals then
    telescope.load_extension("metals")
  end
  telescope.load_extension("neoclip")
end
