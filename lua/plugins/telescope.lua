return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input('Grep For > ') })
        end)
        vim.keymap.set('n', '<leader>ts', builtin.grep_string, {});
        vim.keymap.set('n', '<leader>td', builtin.diagnostics, {})

        local telescope = require('telescope')

        telescope.setup {
            defaults = {
                layout_strategy = 'horizontal',
                layout_config = { height = 0.95 },
            },
            -- other configuration values here
            pickers = {
                find_files = {
                    -- theme = "dropdown",
                    layout_config = {
                        width = 0.95,
                    },
                },

                buffers = {
                    -- theme = "dropdown",
                    layout_config = {
                        width = 0.95,
                    },
                },

                live_grep = {
                    -- theme = "dropdown",
                    layout_config = {
                        width = 0.95,
                    },
                },
            },
        }

    end
}
