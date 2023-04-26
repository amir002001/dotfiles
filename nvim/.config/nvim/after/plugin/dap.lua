local dap, dapui, dap_vt = require("dap"), require("dapui"), require("nvim-dap-virtual-text")
local dap_go = require("dap-go")

dap_go.setup()

dapui.setup()
---@diagnostic disable-next-line: missing-parameter
dap_vt.setup()

dap.set_log_level("INFO")
-- dap keybinds
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

vim.keymap.set("n", "<leader>;;", function()
    dap.continue()
end)

-- dap ui keybinds
--  open a window for evaluating. will find closest to cursor
vim.keymap.set("n", "<leader>;f", function()
    ---@diagnostic disable-next-line: missing-parameter
    dapui.eval()
end)
