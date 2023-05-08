--makes tables work
local tables = {}
local cmds = {}
local function setCmds(cmd)
cmds = cmd
end
local function g(v)
return cmds.cpu.getValue(v,cmds.find)
end
--main
function tables.pack(cpu,out,...)
local fixed = {...}
for i,v in ipairs(fixed) do
fixed[i] = g(v)
end
cpu.setValue(out,fixed)
end
function tables.item(cpu,a,index,out)
cpu.setValue(out,g(a)[g(index)])
end
function tables.pop(cpu,a,out)
local tab = g(a)
cpu.setValue(out,table.remove(tab))
cpu.setValue(a,tab)
end
return tables,setCmds,{}


