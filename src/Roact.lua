local container = script.Parent.Parent
local Roact = container:FindFirstChild("Roact")
    or container:FindFirstChild("roact")
    or container.Parent:FindFirstChild("Roact")
    or container.Parent:FindFirstChild("roact")

if not Roact then
		error("Roact Router failed to find Roact. Did you make sure Roact is in the same folder?")
end

return require(Roact)
