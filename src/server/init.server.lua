--// Cosmo

--|| Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

--|| Modules
local Matter = require(ReplicatedStorage.Modules.Matter)

local world = Matter.World.new()
local loop = Matter.loop.new()

local systems = {}

for _, child in ipairs(script.Systems:GetChildren()) do
    if child:IsA("ModuleScript") then
        table.insert(systems, require(child))
    end
end


loop:scheduleSystems(systems)
loop:begin({
    default = RunService.Heartbeat
})