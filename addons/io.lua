--adds input output for my coding language
local lib = {}
local cmds = {}
local function setCmds(cmd)
cmds = cmd
end
function lib.out(cpu,value)
print(cpu.getValue(value,cmds.find))
end
function lib.input(cpu,to)
local evn,key = os.pullEvent("key")
cpu.setValue(to,key)
end
return lib,setCmds,{}




