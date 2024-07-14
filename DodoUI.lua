local dodo = {}
dodo.New = {}

local function stringToEnum(enumString)
	local enumType, enumName = enumString:match("Enum%.(.+)%.(.+)")
	return Enum[enumType][enumName]
end

function dodo.New.Window(AutoGiveGUI)
	local GUI = Instance.new("ScreenGui")
	local Bar = Instance.new("Frame")
	local Window = Instance.new("Frame")
	local ButtonBar = Instance.new("ScrollingFrame")
	local Actions = Instance.new("ScrollingFrame")
	local ActionsHolder = Instance.new("Frame")
	local Draggable = require(18476370903).Draggable:Clone()
	local Padding = Instance.new("UIPadding")
	local ListLayout = Instance.new("UIListLayout")
	local KeyScript = require(18476370903).KeyCodeScript:Clone()
	local Keycode = Instance.new("StringValue") Keycode.Value = ""
	GUI.IgnoreGuiInset = true
	Draggable.Enabled = true

	-- Parent and position elements
	Bar.Parent = GUI
	KeyScript.Parent = GUI
	Keycode.Parent = GUI
	Window.Parent = Bar
	Draggable.Parent = Bar
	ButtonBar.Parent = Window
	ActionsHolder.Parent = Window
	Actions.Parent = ActionsHolder
	ButtonBar.ScrollBarThickness = 0

	-- Configure ListLayout
	ListLayout.FillDirection = Enum.FillDirection.Vertical
	ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ListLayout.VerticalAlignment = Enum.VerticalAlignment.Top

	-- Set names
	ButtonBar.Name = "ButtonBar"
	Actions.Name = "Example"
	ActionsHolder.Name = "Actions"
	Keycode.Name = "KeyCode"
	
	Actions.Visible = false

	-- Set sizes and positions
	Bar.Size = UDim2.new(0.65, 0, 0.065, 0)
	Window.Size = UDim2.new(1, 0, 7.5, 0)
	Window.Position = UDim2.new(0, 0, 1, 0)

	ButtonBar.Size = UDim2.new(0.1, 0, 1, 0)
	ButtonBar.CanvasSize = UDim2.new(0, 0, 1, 0)
	Actions.Size = UDim2.new(1, 0, 1, 0)
	Actions.Position = UDim2.new(0, 0, 0, 0)
	ActionsHolder.Size = UDim2.new(0.9, 0, 1, 0)
	ActionsHolder.Position = UDim2.new(0.1, 0, 0, 0)

	-- Parent padding and layout
	Padding.Parent = ButtonBar
	ListLayout.Parent = ButtonBar

	-- Fix sizes
	dodo.FixSizes(Window, {Padding, ListLayout})
	local FixScript = require(18476370903).FixSizes:Clone()
	FixScript.Enabled = true
	FixScript.Parent = Window
	
	if AutoGiveGUI then
		local AutoGive = require(18476370903).AddGUI:Clone()
		AutoGive.Window.Value = GUI
		AutoGive.Parent = game:GetService("ServerScriptService")
	end

	return GUI, Window
end

function dodo.FixSizes(Window, data)
	local ButtonBar = Window.ButtonBar
	local Padding = data[1]
	local ListLayout = data[2]
	local canvasSizeY = ButtonBar.CanvasSize.Y.Scale
	local fixedGap = 0.03
	local paddingFormula = fixedGap / canvasSizeY

	Padding.PaddingTop = UDim.new(paddingFormula, 0)
	ListLayout.Padding = UDim.new(paddingFormula, 0)
end

function dodo.New.Category(Name, Window, Tab)
	local Category = Instance.new("Frame")
	local TL = Instance.new("TextLabel") 

	TL.Parent = Category
	TL.Text = tostring(Name)
	Category.Name = tostring(Name)
	Category.Parent = Window.Actions:FindFirstChild(Tab.Name)

	return Category, Category
end 

function dodo.New.Tab(window, TabData, BtnData)
	if BtnData[3] > 1 or BtnData[3] < 0 or BtnData[3] == nil then
		BtnData[3] = 1
	end
	if BtnData[1] then
		BtnData[1] = "rbxassetid://"..tostring(BtnData[1])
	end
	local Name = TabData[1]
	local tab = window.Actions.Example:Clone()
	local tabButton = Instance.new("ImageButton") tabButton.BackgroundTransparency = BtnData[3] tabButton.BackgroundColor3 = BtnData[2]
	local tabObject = Instance.new("ObjectValue") tabObject.Name = "ConnectedTab" tabObject.Value = tab tabObject.Parent = tabButton
	local TabScript = require(18476370903).Tabs:Clone() TabScript.Parent = tabButton
	
	if BtnData[4] then
		local Rounded = Instance.new("UICorner") Rounded.CornerRadius = UDim.new(0,8) Rounded.Parent = tabButton
	end
	
	tab.BackgroundColor3 = TabData[2]

	tab.Name = Name
	tabButton.Name = Name
	tab.Parent = window.Actions
	tabButton.Parent = window.ButtonBar
	
	tab.Visible = false

	tabButton.SizeConstraint = Enum.SizeConstraint.RelativeXX
	tabButton.Size = UDim2.new(0.8, 0, 0.8, 0)

	return tab, tabButton
end 

return dodo
