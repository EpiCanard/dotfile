local nmap = require("epicanard.api.map").nmap

nmap("<leader>fds", "<cmd>Trouble symbols toggle win.position=bottom focus=true<cr>")

nmap("<leader>fa", "", {
  callback = function()
    require("telescope.builtin").lsp_document_symbols({ symbols = { "method" } })
  end,
})
