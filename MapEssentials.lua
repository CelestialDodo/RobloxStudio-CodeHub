
local MapEssentials = {}

MapEssentials.Map = nil
MapEssentials.CurrentMap = nil
MapEssentials.Debounce = false

function MapEssentials.RandomMap(Maps)
	Maps = Maps:GetChildren()
	MapEssentials.Map = Maps[math.random(1,#Maps)]
end

function MapEssentials.PlaceMap(Location, MapParent)
	if not MapParent then
		MapParent = Location
	end
	if MapEssentials.Debounce then
		return
	else
		MapEssentials.Debounce = true
	end
	if MapEssentials.CurrentMap then
		MapEssentials.CurrentMap:destroy()
	end
	local map = MapEssentials.Map:Clone()
	map:PivotTo(Location.CFrame)
	map.Name = "Map"
	map.Parent = MapParent
	MapEssentials.CurrentMap = map
	MapEssentials.Debounce = false
end

return MapEssentials
