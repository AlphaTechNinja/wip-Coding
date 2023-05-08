--adds logic
local logic = {}
local cmds = {}
local function setCmds(cmd)
cmds = cmd
end
local function g(v)
return cmds.cpu.getValue(v,cmds.find)
end
--main
function logic.jump(cpu,pos)
cpu.jump(pos)
end
function logic.jie(cpu,a,b,c)
if g(a) == g(b) then
cpu.jump(c)
end
end
function logic.jin(cpu,a,b,c)
if g(a) ~= g(b) then
cpu.jump(c)
end
end
function logic.jlt(cpu,a,b,c)
if g(a) < g(b) then
cpu.jump(c)
end
end
function logic.jgt(cpu,a,b,c)
if g(a) > g(b) then
cpu.jump(c)
end
end
return logic,setCmds,{}
