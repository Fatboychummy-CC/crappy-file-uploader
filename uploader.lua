local data, n, dir = {}, 0, shell.dir()

--- Receive data and store it in the table.
local function receive_data()
  local _, y = term.getCursorPos()
  while true do
    data[#data + 1] = select(2, os.pullEvent "paste")
    term.clearLine()
    term.setCursorPos(1, y)
    term.write(tostring(#data))
  end
end

--- Wait for the Q key to be pressed
local function wait_for_quit()
  repeat
    local _, key = os.pullEvent "key"
  until key == keys.q
end

--- Write the file.
---@param filename string The file to be written to.
local function write(filename)
  local h, err = io.open(filename, 'w')
  if not h then
    error("Failed to open file to write: " .. tostring(err), 0)
  end

  for _, line in ipairs(data) do
    h:write(line .. '\n')
  end
  h:close()
end

local function confirm(filename)
  print(("\nPlease confirm the following:\n\nLines received: %d\n\nFilename: %s\n\nY/N: ?"):format(#data, filename))

  repeat
    local _, key = os.pullEvent "key"
    if key == keys.y then
      return true
    elseif key == keys.n then
      return false
    end
  until false
end

local filename = ...
if not filename then
  error("Expected filename as argument.", 0)
end
filename = fs.combine(dir, filename)

print("Ready to receive data. Press 'q' to stop.")

parallel.waitForAny(receive_data, wait_for_quit)

if confirm(filename) then
  write(filename)
  print("Written.")
end

sleep() -- eat any key events remaining
