local telescope = require("telescope")

local function map(mode, mapping, cmd)
  vim.api.nvim_set_keymap(mode, mapping, cmd, { noremap = true, silent = true })
end

local function display_path(_, path)
  path = path:gsub("^%./", "")
  local prefix = path:match("applications?/([%w-_]+)/") or path:match("modules/([%w-_]+)/")
  local short_path = path:match("scala/[%w-_]+/[%w-_]+/[%w-_]+/(.*)") or path:match("resources/.*") or path
  prefix = prefix and prefix .. " | " or ""

  return prefix .. short_path
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
        ["<C-j>"] = require("telescope.actions").cycle_history_next,
        ["<C-k>"] = require("telescope.actions").cycle_history_prev,
      },
    },
  },
  extensions = {
    project = {
      base_dirs = {
        "~/Projects",
      },
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("project")
telescope.load_extension("metals")
telescope.load_extension("neoclip")
telescope.load_extension("docker")

map("n", "<C-p>", ":lua require'telescope'.extensions.project.project{}<CR>")
map("n", "<C-n>", ":lua require'telescope'.extensions.metals.commands{}<CR>")
