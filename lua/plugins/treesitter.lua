return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline"},

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        -- List of parsers to ignore installing (or "all")
        ignore_install = { --
        -- repo doesn't exist anymore
        "ipkg", -- 
        -- This version of Tree-sitter can only generate parsers with ABI version 13 - 14, not 15
        "scfg", "ocamllex", "teal", "unison", "swift", "latex", "mlir"},

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        }
    }
}
