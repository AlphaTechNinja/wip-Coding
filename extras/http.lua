--adds web support
--WARNING: can be potentially used
--for malicious things
local web = {}
local cmds = {}
local function setCmds(cmd)
cmds = cmd
end
local function g(v)
return cmds.cpu.getValue(v,cmds.find)
end
--main
function web.fetch(cpu,url,out)
local response = http.get(url).readAll()
if not response then
error("failed to request webpage")
end
cpu.setValue(out,response)
end
function web.socket(cpu,url,out)
cpu.setValue(out,http.websocket(url))
end
--websockets
function web.Sread(cpu,socket,out)
cpu.setValue(out,g(socket).read())
end
function web.Swrite(cpu,socket,value)
g(socket).write(value)
end
return web,setCmds,{}
