local filesystem = require("filesystem")
--debug version
--points to the fail location
--runs a file
local args = {...}
local path = table.remove(args,1)
local file = filesystem.open(path,"r")
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
local _,err = pcall(cmds.run)
if err then
local errpos = cmds.cpu.pos - 1
print("error:")
print("message:")
print(err)
print("debug:")
for i,v in ipairs(cmds.cpu.buffer) do
if i == errpos then
print(v..":<-- here")
else
print(v..":")
end
end
end
