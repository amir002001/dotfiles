local dap, dapui, dap_go, dap_vt = require("dap"), require("dapui"), require("dap-go"), require("nvim-dap-virtual-text")
dapui.setup()
dap_vt.setup({})
-- listeners to open dap ui
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- dap keybinds
vim.keymap.set("n", "<leader>;d", function()
    dap.continue({})
end)

vim.keymap.set("n", "<leader>;j", function()
    dap.step_over()
end)

vim.keymap.set("n", "<leader>;i", function()
    dap.step_into()
end)

vim.keymap.set("n", "<leader>;k", function()
    dap.step_back()
end)

vim.keymap.set("n", "<leader>;o", function()
    dap.step_out()
end)

vim.keymap.set("n", "<leader>;b", function()
    dap.set_breakpoint()
end)

vim.keymap.set("n", "<leader>;bc", function()
    dap.set_breakpoint(vim.fn.input("Condition 🤓 : "))
end)

-- dap ui keybinds
--  open a window for evaluating. will find closest to cursor
vim.keymap.set("n", "<leader>;f", function()
    ---@diagnostic disable-next-line: missing-parameter
    dapui.eval()
end)

-- dap-go
dap_go.setup()

vim.keymap.set("n", "<leader>;t", function()
    dap_go.debug_test()
end)
