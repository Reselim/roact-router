local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Roact = require(ReplicatedStorage.Roact)
local RoactRouter = require(ReplicatedStorage.RoactRouter)

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

local function Navbar()
	return Roact.createElement(RoactRouter.Context.Consumer, {
		render = function(context)
			local history = context.history

			return Roact.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 30),
				BackgroundTransparency = 1
			}, {
				BackButton = Roact.createElement("TextButton", {
					Text = "<",
					TextSize = 18,
					Size = UDim2.new(0, 30, 0, 30),
					BackgroundColor3 = Color3.new(1, 1, 1),
					LayoutOrder = 1,

					[Roact.Event.Activated] = function()
						history:goBack()
					end
				}),

				ForwardButton = Roact.createElement("TextButton", {
					Text = ">",
					TextSize = 18,
					Size = UDim2.new(0, 30, 0, 30),
					BackgroundColor3 = Color3.new(1, 1, 1),
					LayoutOrder = 2,

					[Roact.Event.Activated] = function()
						history:goForward()
					end
				}),
		
				Layout = Roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder
				})
			})
		end
	})
end

local function HomePage()
	return Roact.createElement(RoactRouter.Route, {
		path = "/",
		exact = true,
		render = function(routeProps)
			return Roact.createFragment({
				Text = Roact.createElement("TextLabel", {
					Text = "Home",
					Size = UDim2.new(1, 0, 0, 14),
					LayoutOrder = 1,
					BackgroundTransparency = 1
				}),
		
				Page1Button = Roact.createElement("TextButton", {
					Text = "Go to page 1",
					TextSize = 16,
					Size = UDim2.new(0, 150, 0, 35),
					LayoutOrder = 2,
					BackgroundColor3 = Color3.new(0.5, 0.75, 1),
		
					[Roact.Event.Activated] = function()
						routeProps.history:push("/one")
					end
				}),

				Page2Button = Roact.createElement("TextButton", {
					Text = "Go to page 2",
					TextSize = 16,
					Size = UDim2.new(0, 150, 0, 35),
					LayoutOrder = 3,
					BackgroundColor3 = Color3.new(1, 0.75, 0.75),
		
					[Roact.Event.Activated] = function()
						routeProps.history:push("/two")
					end
				})
			})
		end
	})
end

local function Page1()
	return Roact.createElement(RoactRouter.Route, {
		path = "/one",
		exact = true,
		render = function(routeProps)
			return Roact.createFragment({
				Text = Roact.createElement("TextLabel", {
					Text = "Page 1",
					TextSize = 28,
					Size = UDim2.new(1, 0, 0, 28),
					LayoutOrder = 1,
					BackgroundTransparency = 1
				}),
		
				Page2Button = Roact.createElement("TextButton", {
					Text = "Go to page 2",
					TextSize = 16,
					Size = UDim2.new(0, 150, 0, 35),
					LayoutOrder = 3,
					BackgroundColor3 = Color3.new(1, 0.75, 0.75),
		
					[Roact.Event.Activated] = function()
						routeProps.history:push("/two")
					end
				})
			})
		end
	})
end

local function Page2()
	return Roact.createElement(RoactRouter.Route, {
		path = "/two",
		exact = true,
		render = function()
			return Roact.createFragment({
				Text = Roact.createElement("TextLabel", {
					Text = "Page 2",
					TextSize = 60,
					TextColor3 = Color3.new(1, 0, 0),
					Size = UDim2.new(1, 0, 0, 60),
					LayoutOrder = 1,
					BackgroundTransparency = 1
				})
			})
		end
	})
end

local function Root()
	return Roact.createElement(RoactRouter.Router, nil, {
		Demo = Roact.createElement("ScreenGui", {
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Container = Roact.createElement("Frame", {
				Size = UDim2.new(0, 400, 0, 300),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1
			}, {
				Navbar = Roact.createElement(Navbar),

				PageContainer = Roact.createElement("Frame", {
					Size = UDim2.new(1, 0, 1, -30),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundColor3 = Color3.new(1, 1, 1)
				}, {
					Roact.createElement(HomePage),
					Roact.createElement(Page1),
					Roact.createElement(Page2),

					Layout = Roact.createElement("UIListLayout", {
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 10)
					})
				})
			})
		})
	})
end

local element = Roact.createElement(Root)
Roact.mount(element, playerGui)