--adds graphics
local graphics = {}
local cmds = {}
local function setCmds(cmd)
cmds = cmd
end
local function g(v)
return cmds.cpu.getValue(v,cmds.find)
end
--main
function graphics.pixel(cpu,x,y,col)
if not term.getGraphicsMode() then
term.setCursorPos(g(x),g(y))
term.setBackgroundColor(g(col))
term.write(" ")
else
term.setPixel(g(x),g(y),g(col))
end
end
function graphics.setGraphic(cpu,mode)
term.setGraphicsMode(mode)
end
function graphics.getSize(cpu,w,h)
local sw,sh = term.getSize()
cpu.setValue(w,sw)
cpu.setValue(h,sh)
end
function graphics.clear()
term.clear()
end
function graphics.setColor(cpu,r,g,b,index)
local packed = colors.packRGB(r / 255,g / 255,b / 255)
term.setPaletteColor(index,packed)
end
return graphics,setCmds,{}
