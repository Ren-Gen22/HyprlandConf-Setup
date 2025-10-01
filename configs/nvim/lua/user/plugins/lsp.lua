return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.on_attach(function(client, bufnr)
				-- Keymaps for LSP actions
				-- See :help lsp-zero-keybindings for more information
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			require("mason").setup({})
			require("mason-lspconfig").setup({
				-- A list of servers to install automatically
				ensure_installed = {"eslint", "lua_ls", "pyright", "jdtls", "clangd", "gopls", "rust_analyzer"},
				handlers = {
					lsp_zero.default_setup,
				},
			})

			local cmp = require("cmp")
			local cmp_action = require("lsp-zero").cmp_action()

			
            cmp.setup({
                mapping = {
                        -- Remove Tab and Shift-Tab mapping
        -- ["<Tab>"] = cmp.mapping.select_next_item(),
        -- ["<S-Tab>"] = cmp.mapping.select_prev_item(),

        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),

        ["<C-n>"] = cmp_action.luasnip_jump_forward(),
        ["<C-p>"] = cmp_action.luasnip_jump_backward(),
    },
})

		end,
	},
}
