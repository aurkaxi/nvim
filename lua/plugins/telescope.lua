return {{
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {'nvim-lua/plenary.nvim', {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    }},
    opts = {
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case" -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }

    },
    config = function(self, opts)
        require('telescope').setup(opts)
        require('telescope').load_extension("fzf")
    end,
    keys = {{
        "<leader>ff",
        function()
            require("telescope.builtin").find_files()
        end,
        desc = "Telescope find files"
    }, {
        "<leader>fg",
        function()
            require("telescope.builtin").live_grep()
        end,
        desc = "Telescope live grep"
    }, {
        "<leader>fb",
        function()
            require("telescope.builtin").buffers()
        end,
        desc = "Telescope buffers"
    }, {
        "<leader>fh",
        function()
            require("telescope.builtin").help_tags()
        end,
        desc = "Telescope help tags"
    }}
}}
