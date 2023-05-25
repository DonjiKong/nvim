-- run current python code
vim.api.nvim_set_keymap('n', '<leader>py', ':sp<CR>:term python3 %<CR>', {noremap = true, silent = true})

