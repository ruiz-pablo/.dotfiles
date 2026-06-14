vim.pack.add({ { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") } })

require("blink.cmp").setup({
	keymap = {
		preset = "default",
	},

	appearance = {
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},

	completion = {
		-- Do not show documentation while typing
		documentation = { auto_show = true },
	},

	sources = {
		default = { "lsp", "path", "snippets" },
	},

	fuzzy = { implementation = "lua" },

	signature = { enabled = true },
})
