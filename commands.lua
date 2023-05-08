--handles commands
local cmds = {}
local commands = {}
cmds.cpu = dofile("wip/cpu.lua")
cmds.cpu.init()
cmds.find = dofile("wip/value.lua").find
cmds.commands = commands
cmds.addonsVar = {}
function commands.set(cpu,a,b)
cpu.setValue(a,cpu.getValue(b,cmds.find))
end
function commands.include(cpu,path,name)
local addon,setCore,appVars = dofile(path)
if setCore then
setCore(cmds)
end
if name then
for n,v in pairs(addon) do
commands[name.."."..n] = v
end
cmds.addonsVar[name] = appVars
else
for n,v in pairs(addon) do
commands[n] = v
end
for n,v in pairs(appVars) do
if not cmds[n] then
cmds[n] = v
end
end
end
end
function commands.label(cpu,name)
cpu.label(name,cpu.pos + 2)
end
function commands.define(cpu,name,value)
cpu.variables[name] = value or 0
end
--loads a whole dictonary
function commands.lib(cpu,dictonary,name)
local names = fs.list(dictonary)
local paths = {}
for i,v in ipairs(names) do
table.insert(paths,fs.combine(dictonary,v))
end
if name then
for i,v in ipairs(paths) do
commands.include(cmds.cpu,v,name.."."..names[i])
end
else
for i,v in ipairs(paths) do
commands.include(cmds.cpu,v)
end
end
end
--execute commands
function cmds.next()
return cmds.cpu.nextInst()
end
function cmds.execute(line)
if line == false then return true end
local tokens = {}
for match in line:gmatch("[^%s]+") do
table.insert(tokens,match)
end
local command = table.remove(tokens,1)
if commands[command] then
commands[command](cmds.cpu,unpack(tokens))
end
return {command,unpack(tokens)}
end
function cmds.tick()
return cmds.execute(cmds.next())
end
function cmds.flush(file)
if type(file) == "file" then
cmds.cpu.setBuffer(file.readAll())
file.close()
else
cmds.cpu.setBuffer(file)
end
end
--addons
function cmds.getVars(name)
return cmds.addonsVar[name]
end
function cmds.setVars(name,new)
cmds.addonsVar[name] = new
end
function cmds.getVar(addon,name)
return cmds.addonsVar[addon][name]
end
function cmds.setVar(addon,name,value)
cmds.addonsVar[addon][name] = value
end
--test
--[[
local file = fs.open("wip/test.wip","r")
local data = file.readAll():gsub("%\\","")
print("data:")
print(data)
print("main:")
cmds.flush(data)
file.close()
--]]
function cmds.run()
while not cmds.cpu.empty do
cmds.tick()
end
end
--cmds.run()
return cmds
