-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- project wide
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- bring next line up to this line
vim.keymap.set("n", "J", "mzJ`z")

-- move down the page
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- move up the page
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- next item and center screen
vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete line
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- show diagnostic float
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float)

-- format page
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- next and previous buffers
vim.keymap.set("n", "<S-p>", ":bp<CR>")
vim.keymap.set("n", "<S-n>", ":bn<CR>")

-- Moving chunks of text
vim.keymap.set("v", "<leader>j", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<leader>k", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==")
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==")
vim.keymap.set("i", "<C-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("i", "<C-j>", "<Esc>:m .+1<CR>==gi")

-- Open current file in browser
vim.keymap.set("n", "<leader>o", "<cmd>!open %<CR>", { silent = true })

-- Search and replace all
vim.keymap.set("n", "<S-f>", ":0,$s/")

-- open buffers
vim.keymap.set("n", "<S-b>", ":Telescope buffers<CR>");

-- tailwind toggle show/hide classes
vim.keymap.set("n", "<leader>tt", ":TailwindConcealToggle<CR>",
    { desc = "Toggle Tailwind Classes", noremap = true, silent = true })

vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.mouse = 'a'

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.clipboard:append("unnamedplus")

vim.opt.scrolloff = 15
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.iskeyword:append("-")

vim.opt.updatetime = 50

vim.opt.autoread = true


-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        {
            "folke/tokyonight.nvim",
            config = function() vim.cmd.colorscheme "tokyonight" end
        },
        -- import your plugins
        { import = "plugins" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- automatically check for plugin updates
    checker = { enabled = true },
})
