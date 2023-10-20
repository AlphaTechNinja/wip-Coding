local terminal = require("terminal") or dofile("wip/terminal.lua")
--adds the term API to my coding language
local lib = {}
local cmds = {}
local function setCmds(cmd)
cmds = cmd
end
local function g(v)
cmds.cpu.getValue(v,cmds.find)
end
--main
function lib.setCursorPos(cpu,x,y)
terminal.setPos(g(x),g(y))
end
function lib.setBackgroundColor(cpu,col)
terminal.BackgroundColor(g(col))
end
function lib.setTextColor(cpu,col)
terminal.TextColor(g(col))
end
function lib.write(cpu,...)
local args = {...}
for i,v in ipairs(args) do
args[i] = g(v)
end
term.write(table.concat(args," "))
end
function lib.getBackgroundColor(cpu,out)
cpu.setValue(out,terminal.getBackground())
end
function lib.getTextColor(cpu,out)
cpu.setValue(out,terminal.TextColor())
end
function lib.getSize(cpu,outw,outh)
local w,h = terminal.getSize()
cpu.setValue(outw,w)
cpu.setValue(outh,h)
end
function lib.getCursorPos(cpu,outx,outy)
local x,y = terminal.getPos()
cpu.setValue(outx,x)
cpu.setValue(outy,y)
end
return lib,setCmds,{}




