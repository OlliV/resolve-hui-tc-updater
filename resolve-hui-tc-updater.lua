resolve = Resolve()
pm = resolve:GetProjectManager()

function tc_update ()
  local proj = pm:GetCurrentProject()
  local tm = proj:GetCurrentTimeline()
  local code = tm:GetCurrentTimecode()
  if code then
    codehex = string.gsub(code, ":", ""):reverse():gsub(".", "%1 "):sub(1,-2)
    os.execute("/Users/hbp/sendmidi-macos-1.0.15/sendmidi dev 'X-Touch One' hex syx 00 00 66 05 00 11 " ..codehex)
  end
end

if not running then
  hui_tc_update_running = true
  while hui_tc_update_running do
    tc_update()
    os.execute("sleep 0.2")
  end
end
