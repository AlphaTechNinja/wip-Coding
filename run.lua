--runs a file
local args = {...}
local path = table.remove(args,1)
local file = fs.open(path,"r")
local code = file.readAll()
print("data:")
print(code)
file.close()
local cmds = dofile("wip/commands.lua")
--flush file
cmds.flush(code)
if #args > 0 then print("included:") end
for i,v in ipairs(args) do
if fs.isDir(v) then
print(v.." (dir)")
cmds.execute("lib "..v)
else
print(v.." (file)")
cmds.execute("include "..v)
end
end
--run loop
print("main:")
cmds.run()
