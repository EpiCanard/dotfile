local lualine = require("lualine")
local navic = require("nvim-navic")
local link = require("epicanard/color_utils").link
local hif = require("epicanard/color_utils").hif
local tag = ""

local colors = {
  yellow = "#e9b143",
  cyan = "#008080",
  green = "#b0b846",
  orange = "#f28534",
  violet = "#d3869b",
  magenta = "#c678dd",
  blue = "#80aa9e",
  red = "#f2594b",
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
}

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    local version = vim.system({ "git", "describe", "--tags" }):wait().stdout or ""
    if #version == 0 then
      tag = ""
    end
    local splitted = vim.split(version:gsub("\n", ""), "-")

    tag = splitted[1] .. (#splitted > 1 and ("+" .. splitted[2]) or "")
  end,
})

-- Config
local config = {
  options = {
    globalstatus = true,
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = "oneduck",
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  winbar = {
    lualine_a = {
      function()
        if navic.is_available() then
          return navic.get_location() or ""
        end
        return ""
      end,
    },
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left({
  function()
    if #vim.lsp.buf_get_clients() >= 1 then
      link("EvilineLeftBar", "EvilineLeftBarConnected")
    else
      link("EvilineLeftBar", "EvilineLeftBarDefault")
    end
    return "▊"
  end,
  color = "EvilineLeftBar",
  padding = { left = 0, right = 1 },
})

ins_left({
  -- mode component
  function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [""] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [""] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.red,
      t = colors.red,
    }
    hif("EvilineMode", mode_color[vim.fn.mode()], {}, false)
    --return ""
    return ""
  end,
  color = "EvilineMode",
  padding = { right = 1 },
})

ins_left({
  "filesize",
  cond = conditions.buffer_not_empty,
})

ins_left({
  "filename",
  cond = conditions.buffer_not_empty,
  color = "EvilineFileName",
})

ins_left("location")

ins_left({ "progress", color = "EvilineProgress" })

ins_left({
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    error = "EvilineDiagnosticError",
    warn = "EvilineDiagnosticWarn",
    info = "EvilineDiagnosticInfo",
    hint = "EvilineDiagnosticHint",
  },
})

ins_left({
  function()
    return vim.g["metals_status"] or ""
  end,
})

ins_left("%=")

-- Right section

ins_right({
  function()
    local current_function = vim.b.lsp_current_function
    if current_function and current_function ~= "" then
      return " " .. current_function
    end
    return ""
  end,
})

ins_right({
  "o:encoding",
  fmt = string.upper,
  cond = conditions.hide_in_width,
  color = "EvilineEncoding",
})

ins_right({
  "fileformat",
  symbols = {
    unix = "", -- e712
    dos = "", -- e70f
    mac = "", -- e711
  },
  fmt = string.upper,
  icons_enabled = true,
  color = "EvilineFileFormat",
})

ins_right({
  function()
    return tag
  end,
  color = "EvilineBranch",
})

ins_right({
  "branch",
  icon = "",
  color = "EvilineBranch",
})

ins_right({
  "diff",
  symbols = { added = " ", modified = "柳", removed = " " },
  diff_color = {
    added = "EvilineDiffAdd",
    modified = "EvilineDiffChange",
    removed = "EvilineDiffDelete",
  },
  cond = conditions.hide_in_width,
})

ins_right({
  function()
    return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  end,
  color = "EvilineFileName",
})

lualine.setup(config)
