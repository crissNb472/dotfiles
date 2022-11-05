local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then
	return
end

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.on_attach = function(client, bufnr)
	-- lsp signature
	require "lsp_signature".on_attach({
		bind = true,
		handler_opts = {
			border = "rounded"
		}
	}, bufnr)

	-- navic
	-- if client.server_capabilities.documentSymbolProvider then
	-- 	require("nvim-navic").attach(client, bufnr)
	-- end

	if client.name == "jdtls" then
		vim.lsp.codelens.refresh()
		require("jdtls").setup_dap { hotcodereplace = "auto" }
		require("jdtls.dap").setup_dap_main_class_configs()
	end
end


nvim_lsp['sumneko_lua'].setup {
	capabilities = M.capabilities;
	on_attach = M.on_attach,
}

nvim_lsp["omnisharp"].setup {
	capabilities = M.capabilities,
	on_attach = M.on_attach,
	-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc'),
    cmd = { "/Users/semi/.local/share/nvim/mason/bin/omnisharp-mono", "--languageserver", "--hostPID", tostring(pid) },
}

nvim_lsp["clangd"].setup {
	capabilities = M.capabilities;
	on_attach = M.on_attach;
}

nvim_lsp["rust_analyzer"].setup {
	capabilities = M.capabilities;
	on_attach = M.on_attach;
}

nvim_lsp["pyright"].setup {
	capabilities = M.capabilities;
	on_attach = M.on_attach;
}

nvim_lsp["bashls"].setup {
	capabilities = M.capabilities;
	on_attach = M.on_attach;
}

return M
