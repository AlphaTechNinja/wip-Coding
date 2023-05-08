--adds math to my programing language
local lib = {}
local cmds = {}
local function setCmds(cmd)
cmds = cmd
end
local function g(v)
return cmds.cpu.getValue(v,cmds.find)
end
local function s(n,v)
cmds.cpu.setValue(n,v)
end
function lib.add(_,a,b,out)
s(out,g(a) + g(b))
end
function lib.sub(_,a,b,out)
s(out,g(a) - g(b))
end
function lib.mul(_,a,b,out)
s(out,g(a) * g(b))
end
function lib.div(_,a,b,out)
s(out,g(a) / g(b))
end
function lib.pow(_,a,b,out)
s(out,g(a)^g(b))
end
function lib.sqrt(_,a,out)
s(out,math.sqrt(a))
end
--rounding
function lib.flr(_,a,out)
s(out,math.floor(g(a)))
end
function lib.cel(_,a,out)
s(out,math.ceil(g(a)))
end
--trigonometry
function lib.sin(_,a,out)
s(out,math.sin(g(a)))
end
function lib.cos(_,a,out)
s(out,math.cos(g(a)))
end
function lib.tan(_,a,out)
s(out,math.tan(g(a)))
end
--reverse
function lib.asin(_,a,out)
s(out,math.asin(g(a)))
end
function lib.acos(_,a,out)
s(out,math.acos(g(a)))
end
function lib.atan(_,a,out)
s(out,math.atan(g(a)))
end
--logarithmic
function lib.log(_,a,out)
s(out,math.log(g(a)))
end
--alog is not a normal math function basically log but log(x)-1
function lib.alog(_,a,out)
s(out,math.log(g(a)) * -1)
end
--fraction type stuff
function lib.modf(_,a,out,out2)
local whole,decimal = math.modf(g(a))
s(out,whole)
s(out2,decimal)
end
return lib,setCmds,{}
