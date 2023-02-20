local data, n, dir, p, pe = {}, 0, shell.dir(), print, os.pullEvent

local filename = assert(..., "Expected filename.")
filename = fs.combine(dir, filename)

p(("Writing to: %s"):format(filename))
p "Press 'q' to stop and write the file."
p "Hold ctrl+t to cancel."

parallel.waitForAny(
  function()
    while true do
      data[#data + 1] = select(2, pe "paste")
    end
  end,
  function()
    repeat
      local _, key = pe "key"
    until key == keys.q
  end
)

local h, err = fs.open(filename, 'w')
if not h then
  error(("Failed to write file: %s"):format(err))
end

for _, line in ipairs(data) do
  h.writeLine(line)
end
h.close()
p "Done."

sleep() -- eat any remaining events in the queue
