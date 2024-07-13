-- THIS CODE IS IN TESTING, DO NOT EXPECT IT ALL TO WORK
local dodo = {}
dodo.New = {}

function dodo.New.Window()
	local GUI = Instance.new("ScreenGui")
	local Bar = Instance.new("Frame")
	local Window = Instance.new("Frame")
	local ButtonBar = Instance.new("ScrollingFrame")
	local Actions = Instance.new("ScrollingFrame")
	local Draggable = require(workspace.CodeHubScripts.MainModule).Draggable:Clone()
	local Padding = Instance.new("UIPadding")
	local ListLayout = Instance.new("UIListLayout")
	local FixScript = require(workspace.CodeHubScripts.MainModule).FixSizes:Clone() FixScript.Parent = Window
	GUI.IgnoreGuiInset = true
	Window.Parent = Bar
	Bar.Parent = GUI
	Draggable.Parent = Bar
	ButtonBar.Parent = Window
	Actions.Parent = Window
	ButtonBar.ScrollBarThickness = 0
	
	ListLayout.FillDirection = Enum.FillDirection.Vertical
	ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
	
	ButtonBar.Name = "ButtonBar"
	Actions.Name = "Actions"
	
	Bar.Size = UDim2.new(0.65,0,0.065,0)
	Window.Size = UDim2.new(1,0,7.5,0)
	Window.Position = UDim2.new(0,0,1,0)
	
	ButtonBar.Size = UDim2.new(0.1,0,1,0)
	ButtonBar.CanvasSize = UDim2.new(0,0,1,0)
	Actions.Size = UDim2.new(0.9,0,1,0)
	Actions.Position = UDim2.new(0.1,0,0,0)
	
	Padding.Parent = ButtonBar
	ListLayout.Parent = ButtonBar
	
	dodo.FixSizes(Window, {Padding, ListLayout})
	
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

function dodo.New.Catagory(Name, Window, Tab)
	local Catagory = Instance.new("Frame")
	local TL = Instance.new("TextLabel") 
	
	TL.parent = Catagory
	TL.Text = tostring(Name)
	Catagory.Name = tostring(Name)
	Catagory.Parent = Window.Actions:FindFirstChild(Tab.Name)
	
	return Catagory, Catagory
end 

function dodo.New.Tab(img, Name, window)
	local tab = Instance.new("Frame")
	local tabButton = Instance.new("ImageButton") 
	
	tab.Name = Name
	tabButton.Name = Name
	tab.Parent = window.Actions
	tabButton.Parent = window.ButtonBar
	
	tabButton.SizeConstraint = Enum.SizeConstraint.RelativeXX
	tabButton.Size = UDim2.new(0.8,0,0.8,0)
	
	
	
	return tab, tabButton
end 

return dodo
