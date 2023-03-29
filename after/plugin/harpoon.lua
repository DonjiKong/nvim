local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require("harpoon.term")

vim.keymap.set("n", "<leader>e", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set({ "n", "t" }, "<C-r>", function() ui.nav_file(1) end)
vim.keymap.set({ "n", "t" }, "<C-n>", function() ui.nav_file(2) end)
vim.keymap.set({ "n", "t" }, "<C-t>", function() ui.nav_file(3) end)
vim.keymap.set({ "n", "t" }, "<C-s>", function() ui.nav_file(4) end)
--vim.keymap.set({ "n", "t" }, "<C-g>", function() ui.nav_file(5) end)

vim.keymap.set({ "n", "t" }, "<C-l>", function() term.gotoTerminal(1) end)
vim.keymap.set({ "n", "t" }, "<C-d>", function() term.gotoTerminal(2) end)


vim.keymap.set({ "n", "t" }, "<C-f1>", function() ui.nav_file(1) end) --fix for <C-r> in netrw
vim.keymap.set({ "n", "t" }, "<C-f2>", function() term.gotoTerminal(1) end) --fix for <C-l> in netrw
vim.keymap.set({ "n", "t" }, "<C-f3>", function() term.gotoTerminal(2) end) --fix for <C-d> in netrw

