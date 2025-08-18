return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            panel = {
                enabled = true,
                auto_refresh = false,
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<CR>",
                    refresh = "gr",
                    open = "<M-CR>"
                },
                layout = {
                    position = "bottom", -- | top | left | right | horizontal | vertical
                    ratio = 0.4
                },
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                hide_during_completion = true,
                debounce = 75,
                keymap = {
                    accept = "<C-a>", -- Use control + a to accept the suggestion
                    -- use control + carriage return to accept word
                    -- Note: This is a workaround for the fact that <CR> is used to accept
                    accept_word = "<C-e>",
                    accept_line = false,
                    next = "<M-]>",
                    prev = "<M-[>",
                   dismiss = "<C-]>",
                },
            },
            filetypes = {
                yaml = false,
                markdown = false,
                help = false,
                gitcommit = false,
                gitrebase = false,
                hgcommit = false,
                svn = false,
                cvs = false,
                ["."] = false,
            },
            copilot_node_command = 'node', -- Node.js version must be > 18.x
            server_opts_overrides = {
                settings = {
                    advanced = {
                        listCount = 10,
                        inlineSuggestCount = 3,
                    }
                }
            },
        })
    end,
}
