-- stylua: ignore start
return function (theme)
  return {
    -- Git
    ["gitcommitComment"]        = { fg = theme.comment_fg },
    ["gitcommitUnmerged"]       = { fg = theme.red },
    ["gitcommitOnBranch"]       = { fg = theme.fg },
    ["gitcommitBranch"]         = { fg = theme.purple },
    ["gitcommitDiscardedType"]  = { fg = theme.red },
    ["gitcommitSelectedType"]   = { fg = theme.green },
    ["gitcommitHeader"]         = { fg = theme.fg },
    ["gitcommitUntrackedFile"]  = { fg = theme.cyan },
    ["gitcommitDiscardedFile"]  = { fg = theme.red },
    ["gitcommitSelectedFile"]   = { fg = theme.green },
    ["gitcommitUnmergedFile"]   = { fg = theme.yellow },
    ["gitcommitFile"]           = { fg = theme.fg },

    ["gitcommitNoBranch"]       = "gitcommitBranch",
    ["gitcommitUntracked"]      = "gitcommitComment",
    ["gitcommitDiscarded"]      = "gitcommitComment",
    ["gitcommitSelected"]       = "gitcommitComment",
    ["gitcommitDiscardedArrow"] = "gitcommitDiscardedFile",
    ["gitcommitSelectedArrow"]  = "gitcommitSelectedFile",
    ["gitcommitUnmergedArrow"]  = "gitcommitUnmergedFile",

    -- GitGutter
    ["GitGutterAdd"]            = { fg = theme.green,   bg = theme.gutter_bg },
    ["GitGutterDelete"]         = { fg = theme.red,     bg = theme.gutter_bg },
    ["GitGutterChange"]         = { fg = theme.yellow,  bg = theme.gutter_bg },
    ["GitGutterChangeDelete"]   = { fg = theme.red,     bg = theme.gutter_bg },

    -- Fugitive
    ["diffAdded"]   = { fg = theme.green },
    ["diffRemoved"] = { fg = theme.red },

    -- Neogit
    ["NeogitNotificationInfo"]    = {fg = theme.green},
    ["NeogitNotificationWarning"] = {fg = theme.yellow},
    ["NeogitNotificationError"]   = {fg = theme.red},
  }
end
-- stylua: ignore end
