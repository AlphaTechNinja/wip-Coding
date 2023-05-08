--handles strings
local strings = {}
local cmds = {}
local function setCmds(cmd)
cmds = cmd
end
local function g(v)
cmds.cpu.getValue(v,cmds.find)
end
local function s(a,v)
cpu.setValue(s,v)
end
--main
function strings.concat(cpu,a,b,out)
s(out,g(a)..g(b))
end
function strings.split(cpu,a,b,out)
s(out,g(a):gmatch(g(b)))
end
return strings,setCmds,{}
