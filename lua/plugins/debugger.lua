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
    end,
    keys = { -- DAP Keymaps
    {
        "<leader>db",
        function()
            require("dap").toggle_breakpoint()
        end,
        desc = "Debug: Toggle Breakpoint"
    }, {
        "<leader>dc",
        function()
            require("dap").continue()
        end,
        desc = "Debug: Continue"
    }, {
        "<leader>dr",
        function()
            require("dap").terminate()
        end,
        desc = "Debug: Restart"
    }, {
        "<leader>dq",
        function()
            require("dap").terminate()
        end,
        desc = "Debug: Terminate"
    }, {
        "<leader>dn",
        function()
            require("dap").step_over()
        end,
        desc = "Debug: Step Over"
    }, {
        "<leader>di",
        function()
            require("dap").step_into()
        end,
        desc = "Debug: Step Into"
    }, {
        "<leader>do",
        function()
            require("dap").step_out()
        end,
        desc = "Debug: Step Out"
    }, -- DAP UI Keymaps
    {
        "<leader>du",
        function()
            require("dapui").toggle()
        end,
        desc = "Debug: Toggle UI"
    }, {
        "<leader>de",
        function()
            require("dapui").eval()
        end,
        desc = "Debug: Eval",
        mode = {"n", "v"}
    }}
}
