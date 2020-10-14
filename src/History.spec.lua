return function()
	local History = require(script.Parent.History)

	it("constructor accepts initialEntries and initialIndex", function()
		local test = History.new({ "/a", "/b" }, 1)
		expect(test.location.path).to.equal("/a")
	end)

	-- TODO: More tests
end