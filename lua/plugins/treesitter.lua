return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'main',
    lazy = false,
    build = ":TSUpdate",
    main = "nvim-treesitter",
    init = function()
        local ensureInstalled = {
            "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "rust"
        }
        local alreadyInstalled = require('nvim-treesitter.config').get_installed()
        local parsersToInstall = vim.iter(ensureInstalled)
            :filter(function(parser)
                return not vim.tbl_contains(alreadyInstalled, parser)
            end)
            :totable()
        require('nvim-treesitter').install(parsersToInstall)

        vim.api.nvim_create_autocmd('FileType', {
            callback = function(args)
                -- highlight
                local ok, _ = pcall(vim.treesitter.start, args.buf)
                if not ok then
                    -- ignore
                    return
                end 

                -- Indentation
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

                -- folds
                vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                vim.wo[0][0].foldmethod = 'expr'
                vim.wo[0][0].foldlevel = 99
            end,
        })
    end
}
