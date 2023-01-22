
if game.PlaceId == 893973440 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/HoyoGey/DribleHub/main/Games/FleeTheFacility.lua'))()
elseif game.PlaceId == 621129760 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/HoyoGey/DribleHub/main/Games/KAT.lua'))()
elseif game.PlaceId == 142823291 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/HoyoGey/DribleHub/main/Games/MM2.lua'))()
elseif game.PlaceId == 6284583030 or game.PlaceId == 7722306047 or game.PlaceId == 10321372166 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/HoyoGey/DribleHub/main/Games/PSX.lua'))()
else
	local Noti = loadstring(game:HttpGet "https://raw.githubusercontent.com/HoyoGey/My-Lua-Project/main/UiLibs/StrikeUiLib.txt")()
	Noti:Notif({ Name = "Game Not Supported", Content = "Check All Supported Games On Discord Server", Time = 5,Icon = "rbxassetid://11044015190" })
end
