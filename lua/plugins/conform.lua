return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "eslint", "prettier" },
			javascriptreact = { "eslint", "prettier" },
			typescript = { "eslint", "prettier" },
			typescriptreact = { "eslint", "prettier" },
			vue = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			less = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
			handlebars = { "prettier" },
		},
		-- Set up format-on-save
		format_on_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return {
				timeout_ms = 3000,
				lsp_fallback = true,
			}
		end,
		-- Customize formatters
		formatters = {
			prettier = {
				-- Look for config files in order of preference
				require_cwd = false,
				-- Additional args to ensure config is used
				args = function(self, ctx)
					local args = { "--stdin-filepath", "$FILENAME" }
					local localPrettierConfig = vim.fs.find({
						".prettierrc",
						".prettierrc.json",
						".prettierrc.yml",
						".prettierrc.yaml",
						".prettierrc.json5",
						".prettierrc.js",
						".prettierrc.cjs",
						".prettierrc.mjs",
						"prettier.config.js",
						"prettier.config.cjs",
						"prettier.config.mjs",
					}, { upward = true, path = ctx.dirname })[1]

					if localPrettierConfig then
						vim.list_extend(args, { "--config", localPrettierConfig })
					end

					return args
				end,
			},
		},
	},
	init = function()
		-- If you want to see what formatters are available for a filetype
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

		-- Create commands to toggle format-on-save
		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})

		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}

