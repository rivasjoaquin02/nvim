return {
    "mfussenegger/nvim-dap",
    event = "BufRead",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "folke/neodev.nvim",
        "jbyuki/one-small-step-for-vimkind", -- dap for nvim lua
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup({})
        require("neodev").setup({
            library = { plugins = { "nvim-dap-ui" }, types = true },
        })
        require("nvim-dap-virtual-text").setup({})

        -- nvim-dap events to open and close the windows automatically
        dap.listeners.before.attach.dapui_config = dapui.open
        dap.listeners.before.launch.dapui_config = dapui.open
        dap.listeners.before.event_terminated.dapui_config = dapui.close
        dap.listeners.before.event_exited.dapui_config = dapui.close

        -- adapter for c/cpp/rust
        dap.adapters.lldb = {
            type = "executable",
            command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
            name = "lldb",
        }
        dap.adapters.nlua = function(callback, config)
            callback({
                type = "server",
                host = config.host or "127.0.0.1",
                port = config.port or 8086,
            })
        end
        dap.adapters.python = function(cb, config)
            if config.request == "attach" then
                ---@diagnostic disable-next-line: undefined-field
                local port = (config.connect or config).port
                ---@diagnostic disable-next-line: undefined-field
                local host = (config.connect or config).host or "127.0.0.1"
                cb({
                    type = "server",
                    port = assert(port, "`connect.port` is required for a python `attach` configuration"),
                    host = host,
                    options = {
                        source_filetype = "python",
                    },
                })
            else
                cb({
                    type = "executable",
                    command = "path/to/virtualenvs/debugpy/bin/python",
                    args = { "-m", "debugpy.adapter" },
                    options = {
                        source_filetype = "python",
                    },
                })
            end
        end

        -- configurations
        local lldb = {
            name = "Launch lldb",
            type = "lldb", -- matches the adapter
            request = "launch", -- could also attach to a currently running process
            program = "${file}",
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
            runInTerminal = false,
        }
        dap.configurations.c = { lldb }
        dap.configurations.cpp = { lldb }
        dap.configurations.lua = {
            {
                type = "nlua",
                request = "attach",
                name = "Attach to running Neovim instance",
            },
        }
        --https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#python
        dap.configurations.python = {
            {
                -- The first three options are required by nvim-dap
                type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
                request = "launch",
                name = "Launch file",

                -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

                program = "${file}", -- This configuration will launch the current file if used.
                pythonPath = function()
                    -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                    -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                    -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                    local cwd = vim.fn.getcwd()
                    if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                        return cwd .. "/venv/bin/python"
                    elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                        return cwd .. "/.venv/bin/python"
                    else
                        return "/usr/bin/python"
                    end
                end,
            },
        }

        local map = vim.keymap.set
        map("n", "<leader>db", dap.toggle_breakpoint, {}) -- "Breakpoint"
        map("n", "<leader>dc", dap.continue, {})    -- "Continue"
        map("n", "<leader>di", dap.step_into, {})   -- "Into"
        map("n", "<leader>do", dap.step_over, {})   -- "Over"
        map("n", "<leader>dO", dap.step_out, {})    -- "Out"
        map("n", "<leader>dr", dap.repl.toggle, {}) -- "Repl"
        map("n", "<leader>dl", dap.run_last, {})    -- "Last"
        map("n", "<leader>du", dapui.toggle, {})    -- "UI"
        map("n", "<leader>dx", dap.terminate, {})   -- "Exit"
    end,
}
