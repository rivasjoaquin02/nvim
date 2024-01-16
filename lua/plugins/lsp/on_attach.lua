return {
    on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
            if desc then
                desc = "LSP: " .. desc
            end

            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        local telescope_builtin = require("telescope.builtin")

        nmap("gd", telescope_builtin.lsp_definitions, "Goto Definition")
        nmap("gr", telescope_builtin.lsp_references, "Goto References")
        nmap("gi", telescope_builtin.lsp_implementations, "Goto Implementation")
        nmap("go", telescope_builtin.lsp_type_definitions, "Type Definition")
        nmap("<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

        nmap("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
        nmap("<leader>.", vim.lsp.buf.code_action)

        nmap("K", vim.lsp.buf.hover, "Hover Documentation")
        nmap("gs", vim.lsp.buf.signature_help, "Signature Documentation")
        nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")

        nmap("<leader>rn", vim.lsp.buf.rename, "Rename Variable")
        -- nmap("<leader>Wa", vim.lsp.buf.add_workspace_folder, "Workspace Add Folder")
        -- nmap("<leader>Wr", vim.lsp.vimbuf.remove_workspace_folder, "Workspace Remove Folder")
        -- nmap("<leader>Wl", function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, "Workspace List Folders")

        nmap("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")
    end
}
