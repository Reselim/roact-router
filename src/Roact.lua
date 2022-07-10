local container = script.Parent.Parent
local Roact = container:FindFirstChild("Roact")
    or container:FindFirstChild("roact")
    or container.Parent:FindFirstChild("Roact")
    or container.Parent:FindFirstChild("roact")

if Roact and Roact:IsA("Folder") then
    Roact = Roact:FindFirstChildOfClass("ModuleScript")
end

if not Roact then
    error("Roact Router failed to find Roact. Did you make sure Roact is in the same folder?")
end

return require(Roact)
