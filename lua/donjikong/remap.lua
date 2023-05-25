vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--control u is undo
vim.api.nvim_set_keymap("n", "<C-u>", "<C-r>", { noremap = true }) --Make <C-u> copy

-- lets me escape terminal mode
function _G.explore_project_root()
    local handle = io.popen('git rev-parse --show-toplevel 2> /dev/null')
    local git_root = handle:read('*a'):gsub('%s+$', '')
    handle:close()

    if git_root ~= '' then
        vim.cmd('Explore ' .. git_root)
    else
        print('Not in a Git repository')
    end
end

-- Make <C-c> work the same as esc in Insert Mode
-- vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>', { noremap = true })




-- leader y yank to clipboard
vim.api.nvim_set_keymap('n', '<leader>y', ':%y+<CR>', { noremap = true, silent = true })



-------- <C-g> goes to working directory ---------------

-- Store the initial working directory
vim.g.initial_working_directory = vim.fn.getcwd()

-- Custom function to open netrw in the current buffer at the active working directory
function _G.explore_initial_directory()
    vim.cmd('edit ' .. vim.fn.getcwd())
    vim.cmd('filetype detect') -- Detect filetype to ensure netrw is activated
end

-- Key binding for the custom function
vim.api.nvim_set_keymap('n', '<C-g>', '<Cmd>lua explore_initial_directory()<CR>', { noremap = true, silent = true })

-- Key binding for the custom function in Terminal mode
vim.api.nvim_set_keymap('t', '<C-g>', '<C-\\><C-n><Cmd>lua explore_initial_directory()<CR>',
    { noremap = true, silent = true })

--------------------------------------------------------------


vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- Move the selected lines down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- Move the selected lines up in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.api.nvim_set_keymap('n', 'J', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', ':m .-2<CR>==', { noremap = true, silent = true })


-- delete below the current line in normal mode
-- vim.keymap.set("n", "<C-x>", "mzJ`z") -- <C-x> is decriment so I cannot use it
-- Scroll down half a page and center the cursor line
vim.keymap.set("n", "<C-j>", "<C-d>zz")
-- Scroll up half a page and center the cursor line
vim.keymap.set("n", "<C-k>", "<C-u>zz")
-- Search for the next match and center the cursor line
vim.keymap.set("n", "n", "nzzzv")
-- Search for the previous match and center the cursor line
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever:
--  this key mapping allows you to cut the visually selected text
--  and paste it before the cursor position without affecting
--  the unnamed register's content. Instead, it uses the
--  black hole register to temporarily store the deleted text.
--      _d: This command deletes the visually selected text and stores it in the black hole register ("_).
--      The black hole register is used when you want to delete text without affecting the contents of other registers.
--      P: This command pastes the contents of the unnamed register before the cursor position.
vim.keymap.set("x", "<leader>p", [["_dP]])

-- allows you to copy text to the system clipboard with the <leader>y shortcut.
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- yanks the current line to the system clipboard.
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- deletes the current text selection or line (depending on the mode) without
-- affecting the unnamed register's content by using the black hole register.
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])


-- In normal mode, pressing Ctrl+k goes to the next item in the quickfix list,
-- then centers the cursor vertically within the window (zz).
--vim.keymap.set("n", "<C-w>", "<cmd>cnext<CR>zz")
-- In normal mode, pressing Ctrl+j goes to the previous item in the quickfix list,
-- then centers the cursor vertically within the window (zz).
--vim.keymap.set("n", "<C-b>", "<cmd>cprev<CR>zz")
-- In normal mode, pressing <leader>k goes to the next item in the location list,
-- then centers the cursor vertically within the window (zz).
vim.keymap.set("n", "<leader>w", "<cmd>lnext<CR>zz")
-- In normal mode, pressing <leader>j goes to the previous item in the location list,
-- then centers the cursor vertically within the window (zz).
vim.keymap.set("n", "<leader>b", "<cmd>lprev<CR>zz")


-- Format the current buffer with LSP
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- nvim-spider
vim.keymap.set({"n", "o", "x"}, "w", function() require("spider").motion("w") end, { desc = "Spider-w" })
vim.keymap.set({"n", "o", "x"}, "e", function() require("spider").motion("e") end, { desc = "Spider-e" })
vim.keymap.set({"n", "o", "x"}, "b", function() require("spider").motion("b") end, { desc = "Spider-b" })
vim.keymap.set({"n", "o", "x"}, "ge", function() require("spider").motion("ge") end, { desc = "Spider-ge" })

-- fn
vim.keymap.set("n", "<leader>pp", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>pa", "<cmd>CellularAutomaton game_of_life<CR>")

-- force close the current buffer
vim.api.nvim_set_keymap('n', '<C-W>', ':bd!<CR>', {noremap = true, silent = true})

-- switch buffers
vim.api.nvim_set_keymap('n', '<leader><leader>', ':bnext<CR>', {noremap = true, silent = true})

