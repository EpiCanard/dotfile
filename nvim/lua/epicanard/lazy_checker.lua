return function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  local entrypoint = lazypath .. "/lua/lazy/init.lua"
  if not vim.uv.fs_stat(entrypoint) then
    if vim.uv.fs_stat(lazypath) then
      vim.notify(
        "Incomplete lazy.nvim installation at " .. lazypath .. ". Reinstall it before restarting Neovim.",
        vim.log.levels.ERROR
      )
      return false
    end
    if vim.fn.executable("git") ~= 1 then
      vim.notify("Cannot install lazy.nvim: Git is missing from PATH.", vim.log.levels.ERROR)
      return false
    end

    local ok, output = pcall(vim.fn.system, {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      lazypath,
    })
    if not ok or vim.v.shell_error ~= 0 or not vim.uv.fs_stat(entrypoint) then
      vim.notify(
        "Failed to install lazy.nvim at "
          .. lazypath
          .. ":\n"
          .. tostring(output)
          .. "\nCheck Git/network access and reinstall any incomplete checkout.",
        vim.log.levels.ERROR
      )
      return false
    end
  end
  vim.opt.rtp:prepend(lazypath)
  return true
end
