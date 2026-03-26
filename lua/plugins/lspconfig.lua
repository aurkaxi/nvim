return {
  "neovim/nvim-lspconfig",
  config = function()
    local lsp_group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true })

    -- python
    vim.lsp.config('ruff', {
      -- init_options = {
      --     settings = {
      --         -- Ruff language server settings go here
      --     }
      -- }
    })
    vim.lsp.enable('ruff')
    vim.lsp.enable('ty')
    vim.lsp.enable("pyright")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = lsp_group,
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == 'ruff' then
          -- Disable ruff hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end
      end,
      desc = 'LSP: Disable specific server capabilities'
    }
    )


    -- lua
    vim.lsp.config('lua_ls', {})
    vim.lsp.enable('lua_ls')

    -- dart
    vim.lsp.enable('dartls')

    -- misc
    -- format on save
    vim.api.nvim_create_autocmd("LspAttach", {
      group = lsp_group,
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- Check if the client supports formatting but not the wait-until method
        if client and
            not client:supports_method('textDocument/willSaveWaitUntil') and client:supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({
                bufnr = args.buf,
                id = client.id,
                timeout_ms = 3000,
              })
            end,
            desc = 'LSP: Format on save',
          })
        end
      end,
      desc = 'LSP: Setup format-on-save'
    })

    -- inlay hints
    vim.lsp.inlay_hint.enable();
  end
}
