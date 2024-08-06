-- Autoformat
return {
    "stevearc/conform.nvim",
    lazy = true,
    event = "InsertEnter",
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format { async = true, lsp_fallback = true }
            end,
            desc = "[F]ormat buffer",
        },
    },
    opts = {
        log_level = vim.log.levels.ERROR,
        notify_on_error = true,
        format_on_save = function(bufnr)
            -- Disable "format_on_save lsp_fallback" for languages that don't
            -- have a well standardized coding style. You can add additional
            -- languages here or re-enable it for the disabled ones.
            -- local disable_filetypes = { c = true, cpp = true }
            return {
                timeout_ms = 500,
                lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
            }
        end,
        -- Conform can also run multiple formatters sequentially
        formatters_by_ft = {
            lua = { "stylua" },
            python = { { "ruff_format", "black" } },
            javascript = { { "prettierd", "prettier" } },
            typescript = { { "prettierd", "prettier" } },
            c = { { "clang_format" } },
            cpp = { { "clang_format" } },
        },
    },
}
