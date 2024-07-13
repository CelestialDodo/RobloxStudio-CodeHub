local Item = {}

function Item.GetCode(FileName, StoreModules)
	if StoreModules == nil then StoreModules = false end
	FileName = string.gsub(FileName,".lua","")
	local File = "https://raw.githubusercontent.com/CelestialDodo/RobloxGameCodeTemplates/main/"..FileName..".lua"
	local Module = loadstring(game:GetService("HttpService"):GetAsync(File))()
	local CodeHubScripts = require(18476370903)
	if StoreModules then
		print("STORING MODULE...")
		local Modules = game:GetService("ServerScriptService").CodeHub:FindFirstChild("Modules")
		if not Modules then Modules = CodeHubScripts.Modules:Clone() Modules.Parent = game:GetService("ServerScriptService").CodeHub end
		local temp = {
			[tostring(FileName)] = "Test"
		}
		print(temp)
		table.insert(require(Modules), temp)
		print(require(Modules))
	end
	return Module, CodeHubScripts
end

function Item.test()
	print("This test works!")
end

return Item
