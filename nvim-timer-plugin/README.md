# Neovim Timer Plugin

## Description

Neovim Timer Plugin is a simple yet effective timer integrated directly into your Neovim editor. It provides functionalities to start, pause, and stop a timer, with its current status displayed in Lualine. This plugin is ideal for tracking time spent on tasks, Pomodoro sessions, or any other time-sensitive activities without leaving your editor.

## Features

*   **Core Timer Functionality**: Start, pause, and stop a timer.
*   **Lualine Integration**: Displays the current timer value (HH:MM:SS) in your Lualine status bar.
*   **Key Mappings**: Convenient default key mappings for quick timer control.
*   **User Commands**: Editor commands for timer operations, suitable for custom mappings or direct execution.

## Installation

This plugin can be installed using your favorite Neovim plugin manager. Assuming the plugin is located in a directory named `nvim-timer-plugin` that is accessible to your plugin manager (e.g., `~/.config/nvim/pack/plugins/start/nvim-timer-plugin` or if you're using a manager that handles git repos directly).

**Packer.nvim**

```lua
use {
  'your-username/nvim-timer-plugin', -- Replace with the actual path/URL if hosted
  -- Or if locally managed:
  -- 'nvim-timer-plugin', 
  -- opt = true, -- Optional: if you want to lazy load
  -- config = function() require('timer.lualine') end -- Or setup lualine here
}
```

**vim-plug**

```vim
Plug 'your-username/nvim-timer-plugin' " Replace with the actual path/URL if hosted
" Or if locally managed:
" Plug '~/path/to/your/nvim-timer-plugin' 
```

**lazy.nvim**

```lua
{
  'your-username/nvim-timer-plugin', -- Replace with the actual path/URL if hosted
  -- Or if locally managed:
  -- dir = '~/path/to/your/nvim-timer-plugin', -- if it's a local plugin
  -- lazy = false, -- Load it on startup or define triggers
  -- config = function()
  --   -- Optional: Lualine setup can be done here or in your Lualine config
  -- end
}
```
*Note: Replace `'your-username/nvim-timer-plugin'` with the actual GitHub repository path if you host it (e.g., `'smithbm/nvim-timer-plugin'`) or the local path if you are managing it locally.*

After adding the plugin to your configuration, make sure to run the appropriate install command for your plugin manager (e.g., `:PackerSync`, `:PlugInstall`).

## Configuration

To display the timer in Lualine, you need to add its component to your Lualine configuration. The timer plugin exposes a Lualine component via `require('timer.lualine').provider`.

Here's an example of how to add it to the `lualine_x` section:

```lua
-- In your lualine setup file (e.g., lua/custom/lualine.lua)

require('lualine').setup {
  options = {
    -- ... your other Lualine options
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
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
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
```

Remember to adjust the section (`lualine_x`, `lualine_y`, `lualine_z`, etc.) according to your preferences.

## Usage

The plugin provides both key mappings and user commands for controlling the timer.

### Key Mappings

The default key mappings are:

*   `<leader>ts`: **S**tart the timer.
*   `<leader>tp`: **P**ause the timer.
*   `<leader>tx`: S**t**op (cancel and reset) the timer.

*(Note: `<leader>` is typically `\` by default but can be remapped).*

### User Commands

The following user commands are available:

*   `:TimerStart`: Starts the timer.
*   `:TimerPause`: Pauses the timer.
*   `:TimerStop`: Stops and resets the timer.
*   `:TimerShow`: Shows the current timer value in the command line (e.g., "Timer: 00:05:30").

These commands can be executed directly or used to create custom key mappings.

---

Enjoy using the Neovim Timer Plugin!
```
