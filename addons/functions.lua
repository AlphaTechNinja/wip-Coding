--adds call and ret command
local funcs = {}
local cmds = {}
local function setCmds(cmd)
cmds = cmd
end
--main lib
function funcs.call(cpu,title)
local index = cpu.labels[title]
cpu.pushTrace(cpu.pos + 1)
cpu.pos = index
end
function funcs.ret(cpu)
cpu.ret()
end
function funcs.goto(cpu,label)
cpu.pos = cpu.labels[label]
end
return funcs,setCmds,{}
