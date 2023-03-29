-- Set the focus on undotree window when it's toggled
vim.g.undotree_SetFocusWhenToggle = 1

-- Set the custom undotree window width and diff panel height
vim.g.undotree_CustomUndotreeCmd = 'topleft vertical 30 new'
vim.g.undotree_CustomDiffpanelCmd = 'belowright 20 new'


--set the style for the layout
vim.g.undotree_WindowLayout = 3


-- Set the keymap for toggling undotree
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', {noremap = true, silent = true})

