--adds the file system to my coding language
--WARNING: this can potentially
--be used for malicious things
local files = {}
local open
local cmds = {}
local function setCmds(cmd)
cmds = cmd
end
function files.open(_,path,mode)
if not open then
open = fs.open(path,mode or "r")
end
end
function files.close()
if open then
open.close()
open = nil
end
end
function files.read(cpu,out)
local char = open.read()
cpu.setValue(out,char)
end
function files.readLine(cpu,out)
local line = open.readLine()
cpu.setValue(out,line)
end
function files.write(value)
open.write(value)
end
function files.readAll(cpu,out)
cpu.setValue(out,open.readAll())
end
function files.dofile(cpu,path,out)
cpu.setValue(out,dofile(path))
end
--for looping purposes
--if there is data jump and read line
function files.jid(cpu,a,out)
local line = open.readLine()
if line then
cpu.setValue(out,line)
cpu.pos = cpu.getValue(a,cmds.find)
end
end
return files,setCmds,{}
