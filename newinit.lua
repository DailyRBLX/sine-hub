local GUI = game:GetObjects("rbxassetid://6051462819")[1]
GUI.Parent = game.CoreGui
local GUIHolder = GUI:FindFirstChild("Holder")
local GameTitle = GUIHolder:FindFirstChild("GameTitle")
local HubTitle = GUIHolder:FindFirstChild("HubTitle")
local HubTitle_Seperator = HubTitle:FindFirstChild("Seperator")
local ButtonFrame = GUIHolder:FindFirstChild("ButtonFrame")
local Button = ButtonFrame:FindFirstChild("Button")
local TweenService = game:GetService("TweenService")
local MarketPlace = game:GetService("MarketplaceService")
local TweenInfo_Transparency1 = TweenInfo.new(0.75,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0)
local TweenInfo_Transparency2 = TweenInfo.new(0.75,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0)
local list = loadstring(game:HttpGet("https://raw.githubusercontent.com/DailyRBLX/sine-hub/main/newinitplaces.lua",true))()
function TweenTransparency(setting,uiobject,inout)
	if setting and uiobject and inout then
		local selectedtweeninfo = inout == "in" and TweenInfo_Transparency1 or TweenInfo_Transparency2
		local tween = TweenService:Create(uiobject,selectedtweeninfo,{BackgroundTransparency = setting})
		return tween
	end
end
function TweenTextTransparency(setting,uiobject,inout)
	if setting and uiobject and inout then
		local selectedtweeninfo = inout == "in" and TweenInfo_Transparency1 or TweenInfo_Transparency2
		local tween = TweenService:Create(uiobject,selectedtweeninfo,{TextTransparency = setting})
		return tween
	end
end

function SetupGui(gamename,buttoncallback)
	local clicked = false
	local buttonfunc = nil;
	local holder = TweenTransparency(0,GUIHolder,"in")
	local hubtitle = TweenTextTransparency(0,HubTitle,"in")
	local hubtitle_seperator = TweenTransparency(0,HubTitle_Seperator,"in")
	local gametitle = TweenTextTransparency(0,GameTitle,"in")
	local buttonframe = TweenTransparency(0,ButtonFrame,"in")
	local button = TweenTextTransparency(0,Button,"in")
	--\\\\\\\\\\
	local holder2 = TweenTransparency(1,GUIHolder,"in")
	local hubtitle2 = TweenTextTransparency(1,HubTitle,"in")
	local hubtitle_seperator2 = TweenTransparency(1,HubTitle_Seperator,"in")
	local gametitle2 = TweenTextTransparency(1,GameTitle,"in")
	local buttonframe2 = TweenTransparency(1,ButtonFrame,"in")
	local button2 = TweenTextTransparency(1,Button,"in")
	
	GameTitle.Text = gamename
	holder:Play()
	holder.Completed:Wait()
	wait(1.25)
	hubtitle:Play()
	hubtitle.Completed:Wait()
	wait(0.75)
	hubtitle_seperator:Play()
	hubtitle_seperator.Completed:Wait()
	wait(1.25)
	gametitle:Play()
	gametitle.Completed:Wait()
	wait(2.25)
	buttonfunc = Button.MouseButton1Click:Connect(function()
		if not clicked then
			clicked = true
			buttoncallback()
			holder2:Play()
			hubtitle2:Play()
			hubtitle_seperator2:Play()
			gametitle2:Play()
			buttonframe2:Play()
			button2:Play()
			buttonfunc:Disconnect()
			buttonfunc = nil;
		end
	end)
	buttonframe:Play()
	button:Play()
end

function GetPlace()
	local returnvalue = "Game not found"
	if list[game.PlaceId] then
		local info = list[game.PlaceId]
		returnvalue = info
	end
	return returnvalue
end

do
	local place = GetPlace()
	if place ~= "Game not found" then
		local scr = place.Script
		local name = MarketPlace:GetProductInfo(game.PlaceId).Name
		SetupGui(name,function()
			loadstring(game:HttpGet(scr,true))()
		end)
	else
		SetupGui(place,function()end)
	end
end
