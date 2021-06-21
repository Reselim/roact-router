local function getComponentName(component)
	if component.name then
		return component
	end

	if type(component) == "function" then
		-- selene: allow(incorrect_standard_library_use)
		local name = debug.info(component, "n")
		if name then
			return name
		else
			return "<anonymous>"
		end
	end

	return "<unknown>"
end

return getComponentName