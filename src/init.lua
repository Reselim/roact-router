if not script.Parent:FindFirstChild("Roact") then
	error("Roact must be in the same directory as roact-router!")
end

return {
	Router = require(script.Router),
	Route = require(script.Route),
	Link = require(script.Link)
}