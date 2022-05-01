resolve = Resolve()
pm = resolve:GetProjectManager()

function tc_update ()
  local proj = pm:GetCurrentProject()
  local tm = proj:GetCurrentTimeline()
  local code = tm:GetCurrentTimecode()
  if code then
    mid = string.gsub(code, ":", ""):reverse():gsub(".", "%1 "):sub(1,-2)
    array = {}
    for d in mid:gmatch("%w+") do
    table.insert(array, d)
    end
    local d1 = (array [1]) + 48
    local d2 = (array [2]) + 48
    local d3 = (array [3]) + 112
    local d4 = (array [4]) + 48
    local d5 = (array [5]) + 112
    local d6 = (array [6]) + 48
    local d7 = (array [7]) + 112
    local d8 = (array [8]) + 48
    
    tcout = " cc 64 00" .. " cc 65 " .. d1 .. " cc 66 " .. d2 .. " cc 67 " .. d3 .. " cc 68 " .. d4 .. " cc 69 " .. d5 .. " cc 70 " .. d6 .. " cc 71 " .. d7 .. " cc 72 " .. d8
    os.execute("/Applications/sendmidi dev 'X-Touch One'" .. tcout)
    print (tcout)
  end
end

if not running then
  hui_tc_update_running = true
  while hui_tc_update_running do
    tc_update()
    os.execute("sleep 0.2")
  end
end
