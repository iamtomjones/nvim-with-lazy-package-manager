return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
        -- Add dependency on your timer plugin
        { dir = '~/.config/nvim/nvim-timer-plugin' }
    },
    opts = function()
        return {
            --[[add your custom lualine config here]]
            options = {
                -- ... your other Lualine options
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = {
                    -- Add the timer component here
                    {
                        require('timer.lualine').provider,
                        -- Optional: Add Lualine conditions or colors if needed
                        -- cond = nil,
                        -- color = { fg = colors.green, gui = 'bold' },
                    },
                    'encoding',
                    'fileformat',
                    'filetype'
                },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = {}
        }
    end,
}
