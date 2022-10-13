local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

local function nkeymap(key, map)
	keymap('n', key, map, opts)
end

-- make x act like delete
keymap('n', 'x', '"_x', opts)
keymap('v', 'x', '"_d', opts)

-- move selected line / block of text in visual mode
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)
keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("v", "<A-j>", ":m '>+1<CR>gv-gv", opts)
-- keymap("v", "<A-k>", ":m '<-2<CR>gv-gv", opts)


-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
nkeymap("<Space>", "")

-- Normal --
-- switch between windows
nkeymap('<C-h>', '<C-w>h')
nkeymap('<C-l>', '<C-w>l')
nkeymap('<C-j>', '<C-w>j')
nkeymap('<C-k>', '<C-w>k')

-- nvim tree
nkeymap("<leader>e", ":NvimTreeToggle<CR>")

-- lsp
nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
-- nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gr', ':lua require("telescope.builtin").lsp_references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('<leader>a', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
nkeymap('<leader>fm', ':lua vim.lsp.buf.format({ async = true })<cr>')
nkeymap("[d", ':lua vim.diagnostic.goto_prev()<cr>')
nkeymap("]d", ':lua vim.diagnostic.goto_next()<cr>')
nkeymap("K", ":lua vim.lsp.buf.hover()<cr>")
vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)

-- telescope
nkeymap("<leader>ff", ":lua require('telescope.builtin').find_files()<cr>")
nkeymap('<leader>fg', ":lua require('telescope.builtin').live_grep()<cr>")
nkeymap('<leader>fb', ":lua require('telescope.builtin').buffers()<cr>")

-- Unity
nkeymap('<leader>fs', ":lua require('user.telescope').search_unity_scripts()<cr>")

-- terminal
nkeymap('<leader>tt', ":ToggleTerm<cr>")
nkeymap('<leader>th', ":ToggleTerm direction=horizontal<cr>")
nkeymap('<leader>tv', ":ToggleTerm direction=vertical<cr>")

-- jdtls
-- test
nkeymap('<leader>jt', ":lua require'jdtls'.test_nearest_method()<CR>")
nkeymap('<leader>jT', ":lua require'jdtls'.test_class()<CR>")

-- refactoring
nkeymap('<leader>jv', ":lua require'jdtls'.extract_variable(true)<CR>")
nkeymap('<leader>jc', ":lua require'jdtls'.extract_constant(true)<CR>")
nkeymap('<leader>jm', ":lua require'jdtls'.extract_method(true)<CR>")

-- dap (debugging)
nkeymap('<leader>b', ":lua require'dap'.toggle_breakpoint()<CR>")
nkeymap('<leader>n', ":lua require'dap'.continue()<CR>")
nkeymap('<leader>dg', ":lua require'dap'.step_into()<CR>")

-- harpoon man
nkeymap('<C-e>', ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
nkeymap('<leader>mm', ":lua require('harpoon.mark').add_file()<CR>")
nkeymap('<leader>z', ":lua require('harpoon.ui').nav_file(1)<CR>")
nkeymap('<leader>x', ":lua require('harpoon.ui').nav_file(2)<CR>")
nkeymap('<leader>c', ":lua require('harpoon.ui').nav_file(3)<CR>")
nkeymap('<leader>v', ":lua require('harpoon.ui').nav_file(4)<CR>")

-- diffview
nkeymap('<leader>gd', ":DiffviewOpen<CR>")
nkeymap('<leader>gq', ":DiffviewClose<CR>")
