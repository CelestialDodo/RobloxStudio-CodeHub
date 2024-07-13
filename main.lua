local Item = {}

function Item.GetCode(FileName, StoreModules)
  if StoreModules == nil then StoreModules = false end
  FileName = string.gsub(FileName,".lua","")
  File = "https://raw.githubusercontent.com/CelestialDodo/RobloxGameCodeTemplates/main/"..FileName..".lua"
  Module = loadstring(game:GetService("HttpService"):GetAsync(File))()
  CodeHubScripts = require(18476370903)
  if StoreModules then
    Modules = game:GetService("ServerScriptService").CodeHub:FindFirstChild("Modules")
    if not Modules then Modules = CodeHubScripts.Modules:Clone() Modules.Parent = game:GetService("ServerScriptService").CodeHub end
    temp = {
      FileName = require(Module)
    }
    table.insert(require(Modules), temp)
  end
  return Module, CodeHubScripts
end

function Item.test()
  print("This test works!")
end

return Item
