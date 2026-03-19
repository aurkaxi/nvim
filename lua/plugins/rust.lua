return {
	{
		"rust-lang/rust.vim",
		init = function()
			vim.g.rustfmt_autosave = 1
		end
	},
	{
		'mrcjkb/rustaceanvim',
		version = '^8', -- Recommended
		lazy = false, -- This plugin is already lazy
	}
}
