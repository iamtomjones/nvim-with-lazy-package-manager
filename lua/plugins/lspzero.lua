return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end)

        lsp_zero.set_sign_icons({
            error = '⛔️',
            warn = '⚠️',
            hint = '💡',
            info = 'ℹ️',
        })

        -- Setup Mason
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = { 'ts_ls', 'lua_ls', 'tailwindcss' },
        })

        -- Manually setup TypeScript LSP to ensure it works
        require('lspconfig').ts_ls.setup({
            on_attach = lsp_zero.on_attach,
            capabilities = lsp_zero.get_capabilities(),
            filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
            root_dir = require('lspconfig').util.root_pattern('package.json', 'tsconfig.json', '.git'),
            settings = {
                typescript = {
                    inlayHints = {
                        includeInlayParameterNameHints = 'all',
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    }
                },
                javascript = {
                    inlayHints = {
                        includeInlayParameterNameHints = 'all',
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    }
                }
            }
        })

        -- Setup Tailwind CSS LSP with custom settings
        require('lspconfig').tailwindcss.setup({
            on_attach = lsp_zero.on_attach,
            capabilities = lsp_zero.get_capabilities(),
            settings = {
                tailwindCSS = {
                    experimental = {
                        classRegex = {
                            { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                            { "cx\\(([^)]*)\\)",  "(?:'|\"|`)([^']*)(?:'|\"|`)" }
                        },
                    },
                },
            },
        })

        -- Setup Lua LSP for Neovim
        require('lspconfig').lua_ls.setup({
            on_attach = lsp_zero.on_attach,
            capabilities = lsp_zero.get_capabilities(),
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    diagnostics = {
                        globals = {'vim'},
                    },
                    workspace = {
                        library = {
                            vim.env.VIMRUNTIME,
                        }
                    }
                }
            }
        })
    end,
}
