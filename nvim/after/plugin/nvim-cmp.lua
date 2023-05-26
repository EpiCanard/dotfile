local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function next_item(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end

local function prev_item(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end

-- Mapping
local cmp_mappings = {
  ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  -- None of this made sense to me when first looking into this since there
  -- is no vim docs, but you can't have select = true here _unless_ you are
  -- also using the snippet stuff. So keep in mind that if you remove
  -- snippets you need to remove this select
  ["<CR>"] = cmp.mapping.confirm({ select = true }),
  ["<ESC>"] = cmp.mapping.abort(),
  ["<Tab>"] = cmp.mapping(next_item, { "i", "s" }),
  ["<S-Tab>"] = cmp.mapping(prev_item, { "i", "s" }),
}

-- Setup
cmp.setup({
  preselect = cmp.PreselectMode.None,
  completion = {
    completeopt = "menu,menuone,noinsert,preview",
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = lspkind.cmp_format({
      with_text = true, -- do not show text alongside icons
      maxwidth = 75, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip" },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp_mappings,
})
