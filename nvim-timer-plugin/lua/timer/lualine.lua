-- nvim-timer-plugin/lua/timer/lualine.lua

local timer = require('timer')

local function format_time(total_seconds)
  if total_seconds == nil or total_seconds < 0 then
    total_seconds = 0
  end

  local hours = math.floor(total_seconds / 3600)
  local minutes = math.floor((total_seconds % 3600) / 60)
  local seconds = math.floor(total_seconds % 60)

  return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

local function display_time()
  local elapsed_seconds = timer.get_elapsed_time()
  return format_time(elapsed_seconds)
end

return {
  provider = display_time,
  -- Optional: Add highlight groups or other Lualine component options here if needed
}
