local Places = {
	--[] = {Script = "",Name = ""},
	[1962086868] = {Script = "https://raw.githubusercontent.com/DailyRBLX/sine-hub/main/Tower%20of%20Hell.lua",Name = "Tower of Hell"},
	[3582763398] = {Script = "https://raw.githubusercontent.com/DailyRBLX/sine-hub/main/Tower%20of%20Hell.lua",Name = "Tower of Hell"},
	[5253186791] = {Script = "https://raw.githubusercontent.com/DailyRBLX/sine-hub/main/Tower%20of%20Hell.lua",Name = "Tower of Hell"},
	[2603725502] = {Script = "https://raw.githubusercontent.com/DailyRBLX/sine-hub/main/a%20bizarre%20day.lua",Name = "A Bizarre Day Modded"},
}

local Info = TweenInfo.new()
local TweenService = game:GetService("TweenService")
local scrngui = Instance.new("ScreenGui")
local textlabel = Instance.new("TextLabel")
textlabel.BackgroundTransparency = 1
textlabel.TextScaled = true;
textlabel.Font = Enum.Font.SourceSansSemibold
textlabel.TextColor3 = Color3.new(1,1,1)
textlabel.TextTransparency = 1;
textlabel.AnchorPoint = Vector2.new(0.5,0.5)
textlabel.Position = UDim2.new(0.5,0,0.5,0)
textlabel.Size = UDim2.new(0.45,0,0.065,0)
textlabel.Parent = scrngui
scrngui.Parent = game:GetService("Players").LocalPlayer.PlayerGui

local TextTransparency0 = TweenService:Create(textlabel,Info,{TextTransparency = 0})
local TextTransparency1 = TweenService:Create(textlabel,Info,{TextTransparency = 1})

function initplace()
	if Places[game.PlaceId] then
		local info = Places[game.PlaceId]
		local script = info.Script
		local gamename = info.Name
		textlabel.Text = string.format("%s %s","Game:",gamename)
		wait(2)
		TextTransparency0:Play()

		wait(5)
		TextTransparency1:Play()
		TextTransparency1.Completed:Wait()
		loadstring(game:HttpGet(script))()
		scrngui:Destroy()
	elseif not Places[game.PlaceId] then
		textlabel.Text = "Game not found"
		wait(2)
		TextTransparency0:Play()

		wait(5)
		TextTransparency1:Play()
		TextTransparency1.Completed:Wait()
		scrngui:Destroy()
	end
end

initplace()
