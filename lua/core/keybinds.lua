-- DAP
local dap = require("dap")
vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {
    desc = "Debug: Toggle Breakpoint"
})
vim.keymap.set("n", "<Leader>dc", dap.continue, {
    desc = "Debug: Continue"
})
vim.keymap.set('n', '<leader>dr', dap.terminate, {
    desc = "Debug: Restart"
})
vim.keymap.set('n', '<leader>dq', dap.terminate, {
    desc = "Debug: Terminate"
})
vim.keymap.set('n', '<leader>dn', dap.step_over, {
    desc = "Debug: Step Over"
})
vim.keymap.set('n', '<leader>di', dap.step_into, {
    desc = "Debug: Step Into"
})
vim.keymap.set('n', '<leader>do', dap.step_out, {
    desc = "Debug: Step Out"
})

-- DAP UI
local dapui = require("dapui")
vim.keymap.set('n', '<leader>du', dapui.toggle, {
    desc = 'Debug: Toggle UI'
})
vim.keymap.set('n', '<leader>de', dapui.eval, {
    desc = 'Debug: Eval under cursor'
})
vim.keymap.set('v', '<leader>de', dapui.eval, {
    desc = 'Debug: Eval under cursor'
})

