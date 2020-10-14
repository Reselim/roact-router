return function()
	local merge = require(script.Parent.merge)

	it("merges tables", function()
		local test = merge({ value1 = "a" }, { value2 = "b" })

		expect(test.value1).to.equal("a")
		expect(test.value2).to.equal("b")
	end)

	it("merges tables in-order", function()
		local test = merge({ value = 1 }, { value = 2 })
		
		expect(test.value).to.equal(2)
	end)

	it("creates a shallow copy", function()
		local original = {}
		local merged = merge(original)

		expect(original == merged).to.equal(false)
	end)
end