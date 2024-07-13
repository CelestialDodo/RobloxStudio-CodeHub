[Playlist](https://www.youtube.com/playlist?list=PLIqujbGBd-7k21-vbTrn4oblYl5prVEkz) (Includes Tutorial Videos)

# This is a list of code for roblox games

This code was made for the convinience of Roblox Game Developers and may NOT UNDER ANY CIRCUMSTANCE BE USED FOR HACKS/EXPLOITS


## How To Setup [Tutorial Video](https://www.youtube.com/watch?v=nLzPYYK4Sfo&list=PLIqujbGBd-7k21-vbTrn4oblYl5prVEkz&index=1)

DO THESE FIRST, NOTHING WILL WORK WITHOUT THIS!!!
Step 1: Go to your games settings, then go to "Security", and enable "Allow HTTP Requests" The code will not work without this
Step 2: Select ServerScriptService (Located in your explorer window) then locate the property named "LoadStringEnabled", make sure that its enabled

Disclaimer:
When you enable LoadStringEnabled it makes your game slightly more vaulnerable to hackers, this is because you might not always be using a completely trusted web source, in this case we are using github so we will be fine

### Manually

Step 1: Open ServerScriptService
Step 2: Create a new server script and place in ServerScriptService (MUST BE SERVER SCRIPT)
Step 3: Put this code into the script
```luau
  local Code = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/CelestialDodo/RobloxGameCodeTemplates/main/main.lua"))()
```
Step 4: Name your script "CodeHub" so you dont confuzed later

### Command Bar

Step 1: Copy this line of code
```luau
  local Script = Instance.new("Script") Script.Name = "CodeHub" Script.Source = [[local Code = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/CelestialDodo/RobloxGameCodeTemplates/main/main.lua"))()]] Script.Parent = game:GetService("ServerScriptService")
```
Step 2: Locate the command bar at the bottom of your roblox studio that says "Run a command", if it isnt there then go to the "View" tab, then enable "Command Bar"
Step 3: Paste the code that you copied into this line, then press enter, it should make a new script called "CodeHub" in ServerScriptService


### With My Plugin

Step 1: Get The Plugin, [Click Me For The Plugin](https://create.roblox.com/store/asset/18465056276/CodeHub)
Step 2: Go to plugins page and press "Make CodeHub"

Ignore this for now please

## How to use the code [Tutorial Video](https://youtu.be/4A7fbqnlxTc?si=GwNlSPpF5_SCjH6n)

Open your CodeHub script, We have lots of Modules for you to pick from, to use them you need to Inport them with another line of code
Assuming you did exactly what the instructions say and nothing nor less, this line of code should work
```luau
  Example = Code.GetCode("Example")
```
This newly added code Imports our "Example" module, Each module has a bunch of code in it, the example module has a function in it called "Print", this does the exact same thing as if you were to just use print() but its an Example, so it doesnt have to do anything unique
To use the "Print" function you do this code
```luau
  Example.Print("You can put whatever text you want here, you can even add a variable")
```
So if you followed the exact steps so far your code should look somewhat like this
```luau
local Code = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/CelestialDodo/RobloxGameCodeTemplates/main/main.lua"))()

Example = Code.GetCode("Example.lua")

Example.Print("You can put whatever text you want here, you can even add a variable")
```
When you run your code you should get this in the output
```txt
You can put whatever text you want here, you can even add a variable
```

Once i start adding stuff ill link a playlist here so people have instructions on how to use everything
