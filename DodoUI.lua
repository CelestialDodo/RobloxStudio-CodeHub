-- THIS CODE IS IN TESTING, DO NOT EXPECT IT ALL TO WORK
local dodo = {} 

function dodo.New(data)
    local GUI = Instance.new("ScreenGui")
    local Bar = Instance.new("Frame")
    local Window = Instance.new("Frame")
    local ButtonBar = Instance.new("ScrollingFrame")
    local Actions = Instance.new("ScrollingFrame")
    Window.parent = Bar
    Bar.parent = GUI
    ButtonBar.parent = Window
    Actions.parent = Window 

    ButtonBar.Name = "ButtonBar"
    Actions.Name = "Actions"
    
    Bar.Size = UDim2.new(0.65,0,0.085,0)
    Window.Size = UDim2.new(1,0,4,0)
    Window.Position = UDim2.new(0,0,0.085,0)
    
    ButtonBar.Size = UDim2.new(0.1,0,1,0)
    Actions.Size = UDim2.new(0.9,0,1,0)
    Actions.Position = UDim2.new(0.1,0,0,0)
    
    return GUI, Window
end 

function dodo.New.Catagory(Name, Window, Tab)
    local Catagory = Instance.new("Frame")
    local TL = Instance.new("TextLabel") 

    TL.parent = Catagory
    TL.Text = tostring(Name)
    Catagory.Name = tostring(Name)
    Catagory.parent = Window.Actions:FindFirstChild(Tab.Name)
    
    return Catagory, Catagory
end 

function dodo.New.Tab(img, Name, window)
    local tab = Instance.new("Frame")
    local tabButton = Instance.new("ImageButton") 

    tab.Name = Name
    tabButton.Name = Name
    tab.Parent = window.Actions
    tabButton.parent = window.ButtonBar 

    return tab, tabButton
end 

return dodo
