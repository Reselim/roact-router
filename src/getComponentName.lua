local function getComponentName(component)
	if component then
		if type(component) == "function" then
			-- selene: allow(incorrect_standard_library_use)
			local name = debug.info(component, "n")
			if name then
				return name
			else
				return "<anonymous>"
			end
		else
			if component.__componentName then
				return component.__componentName
			end
		end
	end

	return "<unknown>"
end

return getComponentName