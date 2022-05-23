local download_packer = function()
  local input = vim.fn.input "Download Packer? [Y/n]: "
  if not input:match("^[yY]?$") then
    return
  end

  local directory = string.format("%s/site/pack/packer/start", vim.fn.stdpath "data")

  vim.fn.mkdir(directory, "p")

  local out = vim.fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
  )

  print(out)
  print "Downloading packer.nvim..."
  print "( You'll need to restart now )"
end

return function()
  if not pcall(require, "packer") then
    download_packer()
    return false
  end
  return true
end
