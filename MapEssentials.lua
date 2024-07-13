-- THIS CODE IS IN TESTING, DO NOT EXPECT IT ALL TO WORK
local MapEssentials = {} 

MapEssentials.Map = nil
MapEssentials.CurrentMap = nil
MapEssentials.Debounce = false 

function MapEssentials.PlaceMap(Location)
    If MapEssentials.Debounce then
        return
    else
        MapEssentials.Debounce = true
    end
    If MapEssentials.CurrentMap then
        MapEssentials.CurrentMap:destroy()
    end
    local map = MapEssentials.Map:Clone()
    map:PivotTo(Location.CFrame)
    MapEssentials.CurrentMap  = map
    MapEssentials.Debounce = false
end 

function MapEssentials.RandomMap(Maps)
    Maps = Maps:GetChildren()
    MapEssentials.Map = Maps[math.random(1,#Maps)]
end 

return MapEssentials
