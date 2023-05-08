--runs a file
local path = ...
local file = fs.open(path,"r")
local code = file.readAll()
print("data:")
print(code)
file.close()
local cmds = dofile("wip/commands.lua")
--flush file
cmds.flush(code)
--run loop
print("main:")
cmds.run()
