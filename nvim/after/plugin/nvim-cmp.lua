local cmp = require("cmp")
local lspkind = require("lspkind")

local function next_item(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    fallback()
  end
end

local function prev_item(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
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
  ["<Tab>"] = next_item,
  ["<Down>"] = next_item,
  ["<S-Tab>"] = prev_item,
  ["<Up>"] = prev_item,
}

-- Setup
cmp.setup({
  preselect = cmp.PreselectMode.None,
  completion = {
    completeopt = "menu,menuone,noinsert,preview",
    autocomplete = true,
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
    { name = "vsnip" },
    { name = "nvim_lsp_signature_help" },
  },
  snippet = {
    expand = function(args)
      -- Comes from vsnip
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp_mappings,
})
