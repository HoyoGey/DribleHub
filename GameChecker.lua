spawn(function()
	if game.PlaceId == 893973440 then
		loadstring(game:HttpGet('https://raw.githubusercontent.com/HoyoGey/DribleHub/main/Games/FleeTheFacility.lua'))()
	if game.PlaceId == 621129760 then
		loadstring(game:HttpGet('https://raw.githubusercontent.com/HoyoGey/DribleHub/main/Games/KAT.lua'))()
	else
		local Noti = loadstring(game:HttpGet "https://raw.githubusercontent.com/HoyoGey/My-Lua-Project/main/UiLibs/StrikeUiLib.txt")()
		Noti:Notif({ Name = "Game Not Supported", Content = "Check All Supported Games On Discord Server", Time = 5,Icon = "https://www.roblox.com/headshot-thumbnail/image?userId=" ..game.Players.LocalPlayer.UserId .. "&width=420&height=420&format=png" })
	end
end)
