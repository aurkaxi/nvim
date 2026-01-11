return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.config('ruff', {
			-- init_options = {
			--     settings = {
			--         -- Ruff language server settings go here
			--     }
			-- }
		})
		vim.lsp.config('lua_ls', {})


		vim.lsp.enable('ruff')
		vim.lsp.enable("pyright")
		vim.lsp.enable('lua_ls')


		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup('UserLspConfig', {
				clear = true
			}),
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client == nil then
					return
				end

				-- Disable hover in favor of Pyright
				if client.name == 'ruff' then
					client.server_capabilities.hoverProvider = false
				end

				-- Format on save
				if not client:supports_method('textDocument/willSaveWaitUntil') and client:supports_method('textDocument/formatting') then
					vim.api.nvim_create_autocmd(
						'BufWritePre', {
							group = vim.api.nvim_create_augroup(
								'UserLspConfig', {
									clear = false
								}
							),
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({
									bufnr = args.buf,
									id = client.id,
									timeout_ms = 3000,
								})
							end,

						}
					)
				end
			end,
			desc = 'LSP: Disable hover capability from Ruff'
		})
	end
}
