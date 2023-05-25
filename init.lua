require("donjikong")
-- print("hello")



vim.o.winbar = "%{%v:lua.require('donjikong.win').eval()%}"

-- If installed as an optional package.
vim.cmd.packadd('nvim-treeclimber')

-- Setup and configuration.
require('nvim-treeclimber').setup()

-- Rest of your configuration.
-- ...


