--[[
    Creates the Matter ECS components
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Matter = require(ReplicatedStorage.lib.Matter)

local COMPONENTS = {
    "Model",
    "IsPoisoned",
    "Health",
    "WalkSpeed",
    "JumpPower"
}
type ComponentTypes = {
    Model: ({model:Model}) -> (),
    IsPoisoned: ({value:boolean}) -> (),
    Health: ({value:number}) -> (),
    WalkSpeed: ({value:number}) -> (),
    JumpPower: ({value:number}) -> ()
}

local components: ComponentTypes = {}

for _, name in ipairs(COMPONENTS) do
	components[name] = Matter.component(name)
end

return components