require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
local map = require("epicanard.api.map").map

local mapOpt = { silent = true }

map("", "f", ":HopWordAC<CR>", mapOpt)
map("o", "f", ":HopChar1CurrentLineAC<CR>", mapOpt)
map("o", "t", ":HopChar1CurrentLineAC<CR>", mapOpt)

map("", "F", ":HopWordBC<CR>", mapOpt)
map("o", "T", ":HopChar1CurrentLineBC<CR>", mapOpt)

map("n", "<leader>k", ":HopLineBC<CR>", mapOpt)
map("n", "<leader>j", ":HopLineAC<CR>", mapOpt)
