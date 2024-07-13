local Item = {}

function Item.GetCode(FileName, StoreModules)
  FileName = "https://raw.githubusercontent.com/CelestialDodo/RobloxGameCodeTemplates/main/"..string.gsub(FileName,".lua","")..".lua"
  Module = loadstring(game:GetService("HttpService"):GetAsync(FileName))()
  CodeHubScripts = require(18476370903)
  if StoreModules then
    Modules = game:GetService("ServerScriptService").CodeHub:FindFirstChild("Modules")
    if not Modules then Modules = CodeHubScripts.Modules:Clone() Modules.Parent = game:GetService("ServerScriptService").CodeHub end
    table.insert(require(Modules), Module)
  end
  return Module, CodeHubScripts
end

function Item.test()
  print("This test works!")
end

return Item
