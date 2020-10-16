return function()
	local History = require(script.Parent.History)

	it("constructor accepts initialEntries and initialIndex", function()
		local test = History.new({ "/a", "/b" }, 1)
		expect(test.location.path).to.equal("/a")
	end)

	it("preserves state", function()
		local test = History.new()

		test:push("/test", { a = "b" })

		expect(test.location.path).to.equal("/test")
		expect(test.location.state.a).to.equal("b")
	end)

	-- TODO: More tests
end