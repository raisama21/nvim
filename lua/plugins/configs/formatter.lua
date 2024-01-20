local null_ls = require("null-ls")

local options = {
	sources = {
		null_ls.builtins.formatting.stylua,

		null_ls.builtins.formatting.prettierd,

		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.goimports_reviser,
		null_ls.builtins.formatting.golines,
	},
}

return options
