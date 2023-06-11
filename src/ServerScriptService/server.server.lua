--[[
    Initializes all systems
]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")

local Matter = require(ReplicatedStorage.lib.Matter)
local Components = require(ReplicatedStorage.Modules.Components)

-- local world = Matter.World.new()
local loop = Matter.Loop.new()

local systems = {}

for _, module in ipairs(ServerStorage.Modules.Systems:GetDescendants()) do
    if (module:IsA("ModuleScript")) then
        table.insert(systems, require(module))
    end
end

loop:scheduleSystems(systems)
loop:begin({
    default = RunService.Heartbeat
})