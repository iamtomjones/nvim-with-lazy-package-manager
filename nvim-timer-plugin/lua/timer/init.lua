-- nvim-timer-plugin/lua/timer/init.lua

local M = {}

local state = "stopped" -- running, paused, stopped
local start_time = 0
local paused_elapsed_time = 0

local function start()
  if state == "running" then
    return -- Already running
  end

  if state == "paused" then
    -- Resuming from pause
    start_time = vim.fn.reltimefloat(vim.fn.reltime()) - paused_elapsed_time
  else
    -- Starting fresh or from stopped state
    start_time = vim.fn.reltimefloat(vim.fn.reltime())
    paused_elapsed_time = 0
  end
  state = "running"
  print("Timer started")
end

local function pause()
  if state ~= "running" then
    return -- Can only pause if running
  end
  paused_elapsed_time = vim.fn.reltimefloat(vim.fn.reltime()) - start_time
  state = "paused"
  print("Timer paused")
end

local function stop()
  state = "stopped"
  start_time = 0
  paused_elapsed_time = 0
  print("Timer stopped")
end

local function get_elapsed_time()
  if state == "running" then
    return vim.fn.reltimefloat(vim.fn.reltime()) - start_time
  elseif state == "paused" then
    return paused_elapsed_time
  else -- stopped
    return 0
  end
end

M.start = start
M.pause = pause
M.stop = stop
M.get_elapsed_time = get_elapsed_time

return M
