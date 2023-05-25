vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
    end

    -- new file
    bind('n', '%')

    -- fixing <C-r> in harpoon - workaround
    bind('<C-r>', '<C-f1>')
    bind('<C-l>', '<C-f2>')
    bind('<C-d>', '<C-f3>')
  end
})

-- sets `a` to go to parent directory
vim.cmd([[
  au FileType netrw nmap <buffer> a -
]])

-- set working directory lcd
vim.keymap.set('n', '<leader>gd', function()
  if vim.bo.filetype == "netrw" then
    local netrw_path = vim.fn.expand("%:p:h")
    vim.cmd("lcd " .. vim.fn.fnameescape(netrw_path))
    print("Working directory set to: " .. netrw_path)
  else
    print("Not in a netrw buffer.")
  end
end)

-- set working directory cd
vim.keymap.set('n', '<leader>gg', function()
  if vim.bo.filetype == "netrw" then
    local netrw_path = vim.fn.expand("%:p:h")
    vim.cmd("cd " .. vim.fn.fnameescape(netrw_path))
    print("Working directory set to: " .. netrw_path)
  else
    print("Not in a netrw buffer.")
  end
end)





