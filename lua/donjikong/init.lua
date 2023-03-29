require('donjikong.remap')
require('donjikong.set')

print("hello from donjikong")



vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])


vim.api.nvim_set_hl(0, 'Winbar', {
    bg = '#3c3836',
    fg = '#272727',
})

vim.api.nvim_set_hl(0, 'WinbarNC', {
    bg = '#272727',
    fg = '#272727',
})

vim.cmd('highlight SignColumn guibg=272727')



