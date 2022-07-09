local container = script.Parent.Parent
local roactModule = container:FindFirstChild("Roact")
local Roact = nil

if not roactModule then
	-- If the rbx-ts runtime is around, try loading with that
	local rbxts = game:GetService("ReplicatedStorage"):FindFirstChild("rbxts_include")
	if rbxts ~= nil then
		local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
		Roact = TS.import(script, TS.getModule(script, "roact").src)
	else
		local TS = require(container.Parent.Parent.RuntimeLib)
		Roact = TS.import(script, TS.getModule(script, "roact").src)
	end
else
	Roact = require(roactModule)
end

return Roact
