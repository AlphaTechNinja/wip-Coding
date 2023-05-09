--idk what to call this coding language
local cpu = {}
cpu.storage = {}
cpu.variables = {}
cpu.variables["nil"] = nil
cpu.pos = 1
cpu.labels = {}
cpu.buffer = {}
cpu.trace = {}
cpu.stack = {}
cpu.empty = false
function cpu.init()
cpu.storage = {}
for i=1,16^4 do
table.insert(cpu.storage,0)
end
--core varaibles
cpu.variables._ticks = 0
end
--get
function cpu.getSto(index)
return cpu.storage[index]
end
function cpu.getVar(name)
return cpu.variables[name]
end
function cpu.getValue(unkown,val)
return val(unkown,cpu)
end
--set
function cpu.setSto(index,value)
cpu.storage[index] = value
end
function cpu.setVar(name,value)
cpu.variables[name] = value
end
function cpu.setValue(a,b)
if a:sub(1,1) == "!" then
cpu.setSto(tonumber(a:sub(2,-1)),b)
elseif cpu.getVar(a) then
cpu.setVar(a,b)
end
end
--jump
function cpu:jump(location)
self.pos = location
end
--code buffer
function cpu.setBuffer(code)
cpu.empty = false
local lines = {}
for match in code:gmatch("[^%:]+") do
table.insert(lines,match)
end
cpu.buffer = lines
cpu.pos = 1
end
function cpu.nextInst()
local got = cpu.buffer[cpu.pos]
if got == nil then
cpu.empty = true
return false,"no more data"
else
cpu.pos = cpu.pos + 1
return got
end
end
--stack
function cpu.push(value)
return table.insert(cpu.stack,value)
end
function cpu.pop()
return table.remove(cpu.stack)
end
--trace
function cpu.pushTrace(index)
assert(type(index) == "number","trace stack is purely ment for functions")
table.insert(cpu.trace,index)
end
function cpu.ret()
cpu.pos = table.remove(cpu.trace)
end
--label
function cpu.label(index,name)
cpu.labels[name] = index
end
--end bye
return cpu
