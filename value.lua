--gets values from token
local get = {}
get.hex = {["0"] = 0,["1"] = 1,["2"] = 2,["3"] = 3,["4"] = 4,["5"] = 5,["6"] = 6,["7"] = 7,["8"] = 8,["9"] = 9,A = 10,B = 11,C = 12,D = 13,E = 14,F = 15}
local mouse = {0,0}
local funcs = {}
--pull event filter
local function filter(excepted)
local got = {os.pullEventRaw()}
while not excepted[got[1]] do
got = {os.pullEventRaw()}
end
return table.unpack(got)
end
--function type values
function funcs.key()
local env,key = os.pullEvent("key")
return key
end
function funcs.time()
return os.time()
end
--[[
function funcs.mx()
local env,_,x,y = filter(mouse_click = true,mouse_up = true,mouse_drag = true})
mouse = {x,y}
return mouse[1]
end
function funcs.my()
--]]
function get.find(value,cpu)
cpu = cpu or {}
if type(value) == "number" then
return value
end
if type(value) == "table" then
return textutils.serialise(value)
end
--hex
if value:sub(1,2) == "0x" then
return tonumber(value)
end
--if can be converted to number
if tonumber(value) then
return tonumber(value)
end
--storage locations
if value:sub(1,1) == "!" then
if value:sub(2,3) == "0x" then
value = "!"..get.find(value:sub(4,-1),cpu)
end
return cpu.getSto(tonumber(value:sub(2,-1)))
elseif cpu.variables[value] then
return cpu.variables[value]
elseif value:sub(1,1) == "?" then
return loadstring(value)()
elseif value == "nil" then
return nil
elseif cpu.getVar(value) then
return cpu.getVar(value)
elseif funcs[value] then
return funcs[value]()
else
return value
end
end
return get
