# dotfile

### Setup

Just execute the command below. It will create symbolic link in your XDG_CONFIG_HOME

> ./setup.sh

### Tips

- After editing plugins.lua, use :PackerCompile to correctly setup config
- To update prefer using :PackerSync instead of :PackerUpdate, it will do a :PackerCompile in the same time

### Git hooks
`git config --local core.hooksPath .githooks`
