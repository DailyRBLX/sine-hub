local Places = {
	--[] = {Script = "",Name = ""},
	[1962086868] = {Script = "https://raw.githubusercontent.com/DailyRBLX/sine-hub/main/Tower%20of%20Hell.lua",Name = "Tower of Hell"},
}

function initplace()
	if Places[game.PlaceId] then
		local info = Places[game.PlaceId]
		local script = info.Script
		local gamename = info.Name
		local scrngui = Instance.new("ScreenGui")
		local textlabel = Instance.new("TextLabel")
		textlabel.BackgroundTransparency = 1
		textlabel.TextScaled = true;
		textlabel.Font = Enum.Font.SourceSansSemibold
		textlabel.TextColor3 = Color3.new(1,1,1)
		textlabel.TextTransparency = 1;
		textlabel.Text = string.format("%s %s","Game:",gamename)
		textlabel.AnchorPoint = Vector2.new(0.5,0.5)
		textlabel.Position = UDim2.new(0.5,0,0.5,0)
		textlabel.Size = UDim2.new(0.45,0,0.09,0)

		textlabel.Parent = scrngui
		scrngui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
		for i = 1,0,0.1 do
			textlabel.TextTransparency = i
			wait(0.01)
		end

		wait(10)
		for i = 0,1,0.1 do
			textlabel.TextTransparency = i
			wait(0.05)
		end

		loadstring(game:HttpGet(script))()
		scrngui:Destroy()
	end
end

initplace()