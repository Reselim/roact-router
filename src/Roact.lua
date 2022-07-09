local container = script.Parent.Parent
local roactModule = container:FindFirstChild("Roact")
local Roact = nil

if not roactModule then
	-- If the rbx-ts runtime is around, try loading with that
	local rbxts = game:GetService("ReplicatedStorage"):FindFirstDescendant("RuntimeLib") or container:FindFirstAncestor("RuntimeLib")
	if rbxts ~= nil then
		local TS = require(rbxts)
		Roact = TS.import(script, TS.getModule(script, "roact").src)
	else
		error("Roact Router failed to find Roact. Did you make sure Roact is in the same folder?")
	end
else
	Roact = require(roactModule)
end

return Roact
