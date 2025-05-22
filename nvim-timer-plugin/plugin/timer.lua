-- nvim-timer-plugin/plugin/timer.lua

local timer = require('timer')

-- Key Mappings
vim.keymap.set('n', '<leader>ts', function()
  timer.start()
  -- Feedback is already provided by the timer.start() function itself
end, { noremap = true, silent = true, desc = "Timer: Start" })

vim.keymap.set('n', '<leader>tp', function()
  timer.pause()
  -- Feedback is already provided by the timer.pause() function itself
end, { noremap = true, silent = true, desc = "Timer: Pause" })

vim.keymap.set('n', '<leader>tx', function()
  timer.stop()
  -- Feedback is already provided by the timer.stop() function itself
end, { noremap = true, silent = true, desc = "Timer: Stop/Cancel" })

-- User Commands
vim.api.nvim_create_user_command('TimerStart', function()
  timer.start()
end, { desc = "Timer: Start" })

vim.api.nvim_create_user_command('TimerPause', function()
  timer.pause()
end, { desc = "Timer: Pause" })

vim.api.nvim_create_user_command('TimerStop', function()
  timer.stop()
end, { desc = "Timer: Stop/Cancel" })

-- Optional: A command to display current time (if not using lualine or for quick check)
vim.api.nvim_create_user_command('TimerShow', function()
  local elapsed_seconds = timer.get_elapsed_time()
  local hours = math.floor(elapsed_seconds / 3600)
  local minutes = math.floor((elapsed_seconds % 3600) / 60)
  local seconds = math.floor(elapsed_seconds % 60)
  print(string.format("Timer: %02d:%02d:%02d", hours, minutes, seconds))
end, { desc = "Timer: Show current time" })

-- Ensure the plugin is loaded (this file acts as the entry point)
-- No explicit return is needed for plugin files.
-- We can print a message to confirm loading if desired for debugging.
-- print("Timer plugin loaded. Mappings and commands set.")
