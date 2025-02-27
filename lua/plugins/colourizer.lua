return {
    'norcalli/nvim-colorizer.lua',
    opts = {
        '*',               -- Highlight all files, but customize some others.
        css = {
            rgb_fn = true, -- Enable parsing rgb(...) functions in css.
            hsl_fn = true, -- Enable parsing hsl(...) functions in css.
            css = true,    -- Enable parsing css definitions (works only in html files or files that starts with a css selector).
            css_fn = true, -- Enable parsing any CSS selector as function.
        },
    }
}
