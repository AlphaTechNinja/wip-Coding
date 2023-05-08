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
term.setCursorPos(g(x),g(y))
end
function lib.setBackgroundColor(cpu,col)
term.setBackgroundColor(g(col))
end
function lib.setTextColor(cpu,col)
term.setTextColor(g(col))
end
function lib.write(cpu,...)
local args = {...}
for i,v in ipairs(args) do
args[i] = g(v)
end
term.write(table.concat(args," "))
end
function lib.getBackgroundColor(cpu,out)
cpu.setValue(out,term.getBackgroundColor())
end
function lib.getTextColor(cpu,out)
cpu.setValue(out,term.getTextColor())
end
function lib.getSize(cpu,outw,outh)
local w,h = term.getSize()
cpu.setValue(outw,w)
cpu.setValue(outh,h)
end
function lib.getCursorPos(cpu,outx,outy)
local x,y = term.getCursorPos()
cpu.setValue(outx,x)
cpu.setValue(outy,y)
end
return lib,setCmds,{}




