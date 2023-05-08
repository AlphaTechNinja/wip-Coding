--gives information about hardware
local info = {}
local cmds = {}
local function setCmds(cmd)
cmds = cmd
end
--main
function info.space(cpu,out)
cpu.setValue(out,#cpu.storage)
end
function info.time(cpu,out)
cou.setValue(out,os.time())
end
function info.type(cpu,out)
--1 = basic,2 = advanced
cpu.setValue(out,2 - (term.isColor() and 1))
end
return info,setCmds,{}

