--adds logic to my coding
local logic = {}
local cmds = {}
local function setCmds(cmd)
cmds = cmd
end
local function g(v)
return cmds.cpu.getValue(v,cmds.find)
end
--main
function logic.jmp(cpu,a)
cpu.pos = g(a)
end
function logic.jie(cpu,a,b,c)
if g(a) == g(b) then
cpu.pos = g(c)
end
end
function logic.jin(cpu,a,b,c)
if g(a) ~= g(b) then
cpu.pos = g(c)
end
end
function logic.jlt(cpu,a,b,c)
if g(a) < g(b) then
cpu.pos = g(c)
end
end
function logic.jgt(cpu,a,b,c)
if g(a) > g(b) then
cpu.pos = g(c)
end
end
function logic.jis(cpu,statement,b)
if loadstring(statement)() then
cpu.pos = b
end
end
--contiune below
function logic.cbe(cpu,a,b)
if g(a) ~= g(b) then
cpu.pos = cpu.pos + 1
end
end
function logic.cbn(cpu,a,b)
if g(a) == g(b) then
cpu.pos = cpu.pos + 1
end
end
function logic.cbl(cpu,a,b)
if not (g(a) < g(b)) then
cpu.pos = cpu.pos + 1
end
end
function logic.cbg(cpu,a,b)
if not (g(a) > g(b)) then
cpu.pos = cpu.pos + 1
end
end
return logic,setCmds,{}

