require("donjikong")
-- print("hello")



vim.o.winbar = "%{%v:lua.require('donjikong.win').eval()%}"


vim.cmd.packadd('nvim-treeclimber') 
require('nvim-treeclimber').setup()

