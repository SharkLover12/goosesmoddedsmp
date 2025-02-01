local camera = peripheral.wrap("right")
local array = " .,-=+xX#"
local monitor = peripheral.wrap("monitor_0")
local yp = 1
monitor.clear()
monitor.setTextScale(0.5)
monitor.setCursorPos(1,1)

for j = -0.35,0.25,0.025 do
  for i = -1,1,0.036 do
    local d = camera.distance(i, 0-j)
    local a = 1
    if d > 0 then a = 2 + (8 - math.min(8, (d/1.2))) end
    monitor.write(string.sub(array, a, a))
  end
  yp=yp+1
  monitor.setCursorPos(1,yp)
end
