require("mason-nvim-dap").setup({
  automatic_setup = true,
  ensure_installed = {
    'codelldb',
  },
  handlers = {},
})

require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")

vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F25>', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F26>', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F27>', dap.step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B', function()
    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set Breakpoint' })

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end
