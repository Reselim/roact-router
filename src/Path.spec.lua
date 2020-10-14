return function()
	local Path = require(script.Parent.Path)

	it("enforces exact paths", function()
		local test = Path.new("/test")
		
		local match = test:match("/test/hello", {
			exact = true
		})

		expect(match).to.equal(nil)
	end)

	it("matches non-exact paths", function()
		local test = Path.new("/test")
		
		local match = test:match("/test/hello", {
			exact = false
		})

		expect(type(match)).to.equal("table")
	end)

	it("maps captures to their names", function()
		local test = Path.new("/:hello/:world")

		local match = test:match("/abc/xyz")

		expect(match.hello).to.equal("abc")
		expect(match.world).to.equal("xyz")
	end)
end