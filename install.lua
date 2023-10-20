local filesystem = require("filesystem")
local http = require("http") or component.internet
--install template
local function download(url,path,b,bu)
print(bu..url.."->"..b..path)
local file = filesystem.open(b..path,"w")
local data = http.get(bu..url)
file.write(data.readAll())
file.close()
end
--roots
local base = "wip/"
local baseurl = "https://raw.githubusercontent.com/AlphaTechNinja/wip-Coding/main/"
--file
local function file(name)
download(name,name,base,baseurl)
end
--main
print("installing...")
file("cpu.lua")
file("value.lua")
file("commands.lua")
file("test.wip")
file("run.lua")
--next dir
file("addons/math.lua")
file("addons/logic.lua")
file("addons/string.lua")
file("addons/table.lua")
file("addons/io.lua")
file("addons/info.lua")
file("addons/functions.lua")
--next
file("extras/fs.lua")
file("extras/graphics.lua")
file("extras/http.lua")
file("extras/term.lua")
--demos
file("demo/graphics.lua")
file("demo/load.wip")
file("demo/test.lua")
--end
print("finished")
