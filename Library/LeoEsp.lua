-- Made by LeoKhol#9369

local ESP = {}
local P = game:GetService("Players")
local plr = P.LocalPlayer

function getBasePart(model)
	if model:IsA("BasePart") then return model end
	if model.PrimaryPart and model.PrimaryPart:IsA("BasePart") then return model.PrimaryPart end
	for i,v in pairs(model:GetChildren()) do
		if v:IsA("BasePart") then
			return v
		end
	end
end

function update(object,settings,hl,ui)
    local distance
    local part = getBasePart(object)

    distance = part and plr:DistanceFromCharacter(part.Position)
    distance = distance and math.floor(distance*0.28)


	local color = settings.customColor and settings.customColor(object) or settings.Color or Color3.fromRGB(255,0,0)
	
	if ui:FindFirstChild("Distance") then
		ui.Distance.Text = distance and (distance.."m") or ""
		ui.Distance.Visible = settings.distance
		ui.Distance.TextColor3 = color
	end
	if ui:FindFirstChild("Title") then
		ui.Title.Visible = settings.tag
		ui.Title.TextColor3 = color
	end
	if hl then
		-- print(color)
		hl.FillColor = color
		hl.OutlineColor = settings.OutlineColor or settings.outlineSameAsFill and color or Color3.new(1,1,1)
		hl.OutlineTransparency = settings.outline and 0 or 1
	end
end

function ESP:addESP(a,settings)
	settings = settings or {
        Color = nil,
        outline = true,
        tag = false,
        distance = false,
        nolplr = true,
        teamcolor = false,
        outlineSameAsFill = false,
        customColor = nil,
		refreshTime = 1,
    }
	
	local newESP = {
		espList = {},
		
		stop = false,
		connections = {},

        value = true,
	}
	
    settings.Color = settings.Color or Color3.new(1, 1, 1)
	
	local highlight = Instance.new("Highlight")
	highlight.FillColor = settings.Color or highlight.FillColor

	local tag = Instance.new("BillboardGui")
	tag.Size = UDim2.new(1.7,20,0.7,10)
	tag.AlwaysOnTop = true
	local title = Instance.new("TextLabel",tag)
	title.Name = "Title"
	title.Size = UDim2.new(1,0,0.6,0)
	title.BackgroundTransparency = 1
	title.Font = Enum.Font.Gotham
	-- title.TextColor3 = settings.Color or highlight.FillColor
	title.TextScaled = true
	title.TextStrokeTransparency = 0.25
	local distance = Instance.new("TextLabel",tag)
	distance.Name = "Distance"
	distance.Size = UDim2.new(1,0,0.4,0)
	distance.Position = UDim2.new(0,0,0.6,0)
	distance.BackgroundTransparency = 1
	distance.Font = Enum.Font.Gotham
	-- distance.TextColor3 = settings.Color or highlight.FillColor
	distance.TextScaled = true
	distance.TextStrokeTransparency = 0.25
	
	
	
	function newESP:AddObject(object,title)
		if not self.espList[object] then
			-- print(object.Name,object.Parent)
			local hl = highlight:Clone()
			hl.Parent = object
            hl.Enabled = self.value
			
			local ui = tag:Clone()
            ui.Enabled = self.value

			ui.Title.Text = title or object.Name
            ui.Parent = object

			self.espList[object] = {hl=hl,ui=ui}

			update(object,settings,hl,ui)
			
			-- coroutine.wrap(function()
			-- 	while object and self.espList[object] and not self.stop do
			-- 		task.wait(settings.refreshTime or 1)
			-- 		-- if not hl or not ui then self.espList[object] = nil end
			-- 		update(object,settings,hl,ui)
			-- 	end
			-- end)()
		end
	end
	
	function newESP:RemoveObject(object)
		if self.espList[object] then
			self.espList[object].hl:Destroy()
			self.espList[object].ui:Destroy()
			self.espList[object] = nil
		end
	end
	
	function newESP:ChangeSettings(newSettings)
		if newSettings then
            for i,v in pairs(newSettings) do
                settings[i] = v
            end
        end

        if settings.teamcolor then
            settings.customColor = function(char)
                local p = P:GetPlayerFromCharacter(char)
                if p and p.TeamColor then
                    return p.TeamColor.Color
                end
            end
        end

		
		for i,v in pairs(self.espList) do
            update(i,settings,v.hl,v.ui)
            -- v.ui.Title.Visible = settings.tag
            -- v.ui.Distance.Visible = settings.distance

            -- local color = settings.customColor and settings.customColor(i) or settings.Color or Color3.fromRGB(255,0,0)
            -- v.ui.Title.TextColor3 = color
            -- v.ui.Distance.TextColor3 = color
            -- v.hl.FillColor = color
		end
	end
	function newESP:Value(val)
        self.value = val
		for i,v in pairs(self.espList) do
            if v.hl then v.hl.Enabled = val end
            if v.ui then v.ui.Enabled = val end
		end
	end
	
	function newESP:Destroy()
		for i,v in pairs(self.espList) do
			self:RemoveObject(i)
		end
		for i,v in pairs(self.connections) do
			v:Disconnect()
		end
		self.stop = true
	end


	if a == "player" then
        if settings.teamcolor then
            settings.customColor = function(char)
                local p = P:GetPlayerFromCharacter(char)
                if p and p.TeamColor then
                    return p.TeamColor.Color
                end
            end
        end
		local function characterAdded(char,plrN)
			newESP:AddObject(char,plrN)
		end
		table.insert(newESP.connections,
			P.PlayerAdded:Connect(function(p)
				if p.Character then characterAdded(p.Character,p.Name) end
				table.insert(newESP.connections,p.CharacterAdded:Connect(function(c)
                    characterAdded(c,p.Name)
                end))
			end)
		)
		for i,p in pairs(P:GetPlayers()) do
			if settings.nolplr and p ~= plr or not settings.nolplr then
				if p.Character then characterAdded(p.Character,p.Name) end
				table.insert(newESP.connections,p.CharacterAdded:Connect(function(c)
                    characterAdded(c,p.Name)
                end))
			end
		end
    elseif type(a) == "userdata" then
        table.insert(newESP.connections,
            a.ChildAdded:Connect(function(child)
				newESP:AddObject(child)
			end)
		)
        for i,v in pairs(a:GetChildren()) do
            newESP:AddObject(v)
        end
	end

	coroutine.wrap(function()
		while not newESP.stop do
			task.wait(settings.refreshTime or 1)
			for i,v in pairs(newESP.espList) do
				update(i,settings,v.hl,v.ui)
			end
		end
	end)()
	
	return newESP
end

return ESP
