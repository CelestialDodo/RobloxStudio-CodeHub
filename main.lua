local Item = {}

function Item.GetCode(FileName, StoreModules)
	if StoreModules == nil then StoreModules = false end
	FileName = string.gsub(FileName,".lua","")
	local File = "https://raw.githubusercontent.com/CelestialDodo/RobloxGameCodeTemplates/main/"..FileName..".lua"
	local loadstring = loadstring
	if script.Parent:FindFirstChild("Loadstring") then
		print(":)")
		loadstring = require(script.Parent:FindFirstChild("Loadstring"))
	end
	local Module = loadstring(game:GetService("HttpService"):GetAsync(File))()
	local CodeHubScripts = require(18476370903)
	if StoreModules then
		local Modules = game:GetService("ReplicatedStorage"):FindFirstChild("Modules")
		if not Modules then Modules = CodeHubScripts.Modules:Clone() Modules.Parent = game:GetService("ReplicatedStorage") end
		require(Modules)[tostring(FileName)] = Module
		return Module, CodeHubScripts, Modules
	end
	return Module, CodeHubScripts
end

function Item.test()
	print("This test works!")
end

return Item
