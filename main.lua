local Item = {}

function Item.GetCode(FileName)
  FileName = "https://raw.githubusercontent.com/CelestialDodo/RobloxGameCodeTemplates/main/"..string.gsub(FileName,".lua","")..".lua"
  return(loadstring(game:GetService("HttpService"):GetAsync(FileName))())
end

function Item.test()
  print("This test works!")
end

return Item
