return {
    'mfussenegger/nvim-dap',
    dependencies = { -- dap ui
    'nvim-neotest/nvim-nio', 'rcarriga/nvim-dap-ui', 'theHamsta/nvim-dap-virtual-text', -- langs
    'mfussenegger/nvim-dap-python'},
    config = function()
        -- DAP UI
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        -- dap.listeners.before.event_terminated.dapui_config = function()
        --     dapui.close()
        -- end
        -- dap.listeners.before.event_exited.dapui_config = function()
        --     dapui.close()
        -- end

        -- DAP Virtual Text
        require("nvim-dap-virtual-text").setup()

        -- Python
        require("dap-python").setup("uv")
    end
}
