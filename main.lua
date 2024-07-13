local Item = {}

function Item.GetCode(FileName, StoreModules)
  FileName = "https://raw.githubusercontent.com/CelestialDodo/RobloxGameCodeTemplates/main/"..string.gsub(FileName,".lua","")..".lua"
  Module = loadstring(game:GetService("HttpService"):GetAsync(FileName))()
  if StoreModules then
    Modules = script:FindFirstChild("Modules")
    if not Modules then Modules = CodeHubScripts.Modules:Clone() Modules.Parent = script end
    table.insert(Modules, require(Module))
  end
  return Module, require(18476370903)
end

function Item.test()
  print("This test works!")
end

return Item
