local Library = {}
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local TabOpenTween = TweenInfo.new(0.375,Enum.EasingStyle.Sine,Enum.EasingDirection.Out)
local TabCloseTween = TweenInfo.new(0.375,Enum.EasingStyle.Sine,Enum.EasingDirection.In)

local TabOpenTween_Fast = TweenInfo.new(0.225,Enum.EasingStyle.Sine,Enum.EasingDirection.Out)
local TabCloseTween_Fast = TweenInfo.new(0.225,Enum.EasingStyle.Sine,Enum.EasingDirection.In)
function Library:CreateTabHolder(HolderName)
	local ScreenGui = Instance.new("ScreenGui")
	local TabsHolder = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	
	if game:GetService("CoreGui"):FindFirstChild(HolderName) then
		game:GetService("CoreGui"):FindFirstChild(HolderName):Destroy()
	end
	
	ScreenGui.Name = HolderName
	ScreenGui.Parent = game:GetService("CoreGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	TabsHolder.Name = "TabsHolder"
	TabsHolder.Parent = ScreenGui
	TabsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabsHolder.BackgroundTransparency = 1.000
	TabsHolder.BorderSizePixel = 0
	TabsHolder.Position = UDim2.new(0.0121375592, 0, 0.0196560193, 0)
	TabsHolder.Size = UDim2.new(0, 155, 0.949999988, 0)

	UIListLayout.Parent = TabsHolder
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 10)
	
	local Functions = {}
	local Tabs = {}
	
	function Functions:CreateTab(TabName,Corner)
		local Count = 0
		local TabButton = Instance.new("TextButton")
		local Line = Instance.new("Frame")
		local Name = Instance.new("TextLabel")
		local MainHolder = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local Main = Instance.new("ScrollingFrame")
		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0,4)
		
		TabButton.Name = "TabButton"
		TabButton.Parent = TabsHolder
		TabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		TabButton.BorderSizePixel = 0
		TabButton.Position = UDim2.new(0.0121375592, 0, 0.0196560174, 0)
		TabButton.Size = UDim2.new(0, 155, 0, 32)
		TabButton.Font = Enum.Font.SourceSans
		TabButton.Text = ""
		TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TabButton.TextSize = 1.000
		

		Line.Name = "Line"
		Line.Parent = TabButton
		Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Line.BorderSizePixel = 0
		Line.Position = UDim2.new(0, 0, 1, 0)
		Line.Size = UDim2.new(1, 0, 0, 2)

		Name.Name = "Name"
		Name.Parent = TabButton
		Name.AnchorPoint = Vector2.new(0.5, 0.5)
		Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Name.BackgroundTransparency = 1.000
		Name.Position = UDim2.new(0.5, 0, 0.5, 0)
		Name.Size = UDim2.new(0.899999976, 0, 0.61500001, 0)
		Name.Text = (TabName and TabName or "nil")
		Name.TextColor3 = Color3.fromRGB(255, 255, 255)
		Name.TextScaled = true
		Name.TextSize = 14.000
		Name.TextWrapped = true
		Name.TextXAlignment = Enum.TextXAlignment.Left

		MainHolder.Name = "MainHolder"
		MainHolder.Parent = TabButton
		MainHolder.Active = true
		MainHolder.BackgroundColor3 = Color3.fromRGB(38,38,38)
		MainHolder.BorderSizePixel = 0
		MainHolder.Position = UDim2.new(1.08900011, 0, 0, 0)
		
		Main.Name = "Main"
		Main.Parent = MainHolder
		Main.BackgroundTransparency = 1
		Main.Size = UDim2.new(1, 0, 1, 0)
		Main.CanvasSize = UDim2.new(0, 0, 50, 0)
		Main.ScrollBarThickness = 0
		Main.ScrollingEnabled = false

		UIListLayout.Parent = Main
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 6)
		
		

		--Properties:
		local Frame = Instance.new("Frame")
		Frame.Parent = Main
		Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0.249373436, 0, 0, 0)
		Frame.Size = UDim2.new(0, 0, 0, 6)
		Frame.LayoutOrder = Count
		Count += 1
		
		
		Tabs[TabName] = {Button = TabButton,Enabled = false,Debounce = false}
		
		TabButton.MouseButton1Click:Connect(function()
			if Tabs[TabName].Debounce then return end
			Tabs[TabName].Debounce = true
			
			if Tabs[TabName].Enabled == false then
				for i,v in pairs(Tabs) do
					if v.Button ~= TabButton then
						if v.Enabled == true then
							v.Debounce = true
							local Tween_1 = TweenService:Create(v.Button.MainHolder,TabCloseTween,{Size = UDim2.new(1.275,0,1,0)})
							local Tween_2 = TweenService:Create(v.Button.MainHolder,TabCloseTween,{Size = UDim2.new(0,0,1,0)})
							local Tween_2_Scroll_1 = TweenService:Create(v.Button.MainHolder.Main,TabCloseTween,{ScrollBarThickness = 0})
							Tween_2_Scroll_1:Play()
							Tween_2_Scroll_1.Completed:Wait()
							Tween_1:Play()
							Tween_1.Completed:Wait()
							Tween_2:Play()
							Tween_2.Completed:Wait()
							v.Button.MainHolder.Main.ScrollingEnabled = false
							v.Enabled = false
							v.Debounce = false
						end
					end
				end
				local Tween_1 = TweenService:Create(MainHolder,TabOpenTween,{Size = UDim2.new(1.275,0,1,0)})
				local Tween_2 = TweenService:Create(MainHolder,TabOpenTween,{Size = UDim2.new(1.275,0,10,0)})
				local Tween_2_Scroll_1 = TweenService:Create(Main,TabOpenTween,{ScrollBarThickness = 4})
				Tween_1:Play()
				Tween_1.Completed:Wait()
				Tween_2:Play()
				Tween_2.Completed:Wait()
				Tween_2_Scroll_1:Play()
				Tween_2_Scroll_1.Completed:Wait()
				Main.ScrollingEnabled = true
				Tabs[TabName].Enabled = true
			else
				local Tween_1 = TweenService:Create(MainHolder,TabCloseTween,{Size = UDim2.new(1.275,0,1,0)})
				local Tween_2 = TweenService:Create(MainHolder,TabCloseTween,{Size = UDim2.new(0,0,1,0)})
				local Tween_2_Scroll_1 = TweenService:Create(Main,TabCloseTween,{ScrollBarThickness = 0})
				Tween_2_Scroll_1:Play()
				Tween_2_Scroll_1.Completed:Wait()
				Tween_1:Play()
				Tween_1.Completed:Wait()
				Tween_2:Play()
				Tween_2.Completed:Wait()
				Main.ScrollingEnabled = false
				Tabs[TabName].Enabled = false
			end
			Tabs[TabName].Debounce = false
		end)
		
		local ButtonFunctions = {}
		
		function ButtonFunctions:Button(ButtonText,Callback)
			Count += 1
			local Button = Instance.new("TextButton")
			Button.Name = "Button"
			Button.Parent = Main
			Button.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			Button.Position = UDim2.new(-1.04635234e-07, 0, 0, 0)
			Button.Size = UDim2.new(0.949999988, 0, 0, 26)
			Button.BorderSizePixel = 1
			Button.BorderColor3 = Color3.fromRGB(74,74,74)
			Button.Font = Enum.Font.SourceSans
			Button.Text = (ButtonText and ButtonText or "nil")
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextSize = 16.000
			Button.LayoutOrder = Count
			
			Button.MouseButton1Click:Connect(Callback)
		end
		
		function ButtonFunctions:Label(Text)
			local Label = Instance.new("TextLabel")
			Label.Name = "Label"
			Label.Parent = Main
			Label.Active = true
			Label.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			Label.BorderSizePixel = 1
			Label.BorderColor3 = Color3.fromRGB(74,74,74)		
			Label.Position = UDim2.new(-1.04635234e-07, 0, 0, 0)
			Label.Selectable = true
			Label.Size = UDim2.new(0.949999988, 0, 0,26)
			Label.Font = Enum.Font.SourceSans
			Label.Text = (Text and Text or "")
			Label.TextColor3 = Color3.fromRGB(255, 255, 255)
			Label.TextSize = 16.000
		end
		
		function ButtonFunctions:Toggle(ToggleText,Callback,Default)
			Count += 1
			local Enabled = (Default and Default or false)
			local ToggleFrame = Instance.new("Frame")
			local Label = Instance.new("TextLabel")
			local Button = Instance.new("TextButton")
			ToggleFrame.Name = "ToggleFrame"
			ToggleFrame.Parent = Main
			ToggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleFrame.BackgroundTransparency = 1.000
			ToggleFrame.Size = UDim2.new(0.949999988, 0, 0,28)
			ToggleFrame.LayoutOrder = Count

			Label.Name = "Label"
			Label.Parent = ToggleFrame
			Label.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			Label.BorderSizePixel = 1
			Label.BorderColor3 = Color3.fromRGB(74,74,74)
			Label.Position = UDim2.new(3.11126058e-07, 0, 0, 0)
			Label.Size = UDim2.new(1, 0, 1, 0)
			Label.Font = Enum.Font.SourceSans
			Label.Text = "  "..ToggleText
			Label.TextColor3 = Color3.fromRGB(255, 255, 255)
			Label.TextSize = 16.000
			Label.TextXAlignment = Enum.TextXAlignment.Left

			Button.Parent = Label
			Button.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			Button.BorderColor3 = Color3.fromRGB(133, 133, 133)
			Button.Position = UDim2.new(0.875204504, 0, 0.199999988, 0)
			Button.Size = UDim2.new(0.095, 0,0.6, 0)
			Button.Font = Enum.Font.SourceSans
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextScaled = false
			Button.TextSize = 16.000
			Button.TextWrapped = true

			Button.MouseButton1Click:Connect(function()
				Enabled = not Enabled
				if Enabled then
					Button.Text = "✓"
				else
					Button.Text = ""
				end
				Callback(Enabled)
			end)
			
			local ToggleFunctions = {}
			function ToggleFunctions:SetStatus(Status,ShouldCallback)
				Enabled = ((Status == false or Status == true) and Status or false)
				if Enabled then
					Button.Text = "✓"
				else
					Button.Text = ""
				end
				if ShouldCallback then
					Callback(Enabled)
				end
			end
			return ToggleFunctions
		end
		function ButtonFunctions:TextBox(PlaceholderText,DefaultText,Callback)
			Count += 1
			local TextBox = Instance.new("TextBox")
			TextBox.Parent = Main
			TextBox.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			TextBox.BorderSizePixel = 1
			TextBox.BorderColor3 = Color3.fromRGB(74,74,74)
			TextBox.Position = UDim2.new(-1.04635234e-07, 0, 0, 0)
			TextBox.Size = UDim2.new(0.949999988, 0, 0,27)
			TextBox.Font = Enum.Font.SourceSans
			TextBox.PlaceholderText = (PlaceholderText and PlaceholderText or "nil")
			TextBox.Text = (DefaultText and DefaultText or "")
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.TextSize = 16.000
			TextBox.LayoutOrder = Count

			TextBox.FocusLost:Connect(function()
				Callback(TextBox.Text)
			end)
		end
		function ButtonFunctions:Dropdown(DropdownText,Buttons,Callback)
			Count += 1
			local Shown = false
			local Debounce = false
			local Dropdown_Frame = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local Template = Instance.new("TextButton")
			Template.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			Template.BorderSizePixel = 0
			Template.Position = UDim2.new(0.0644602478, 0, 0, 0)
			Template.Size = UDim2.new(0.870999992, 0, 0, 20)
			Template.Font = Enum.Font.SourceSans
			Template.Text = "Circle"
			Template.TextColor3 = Color3.fromRGB(255, 255, 255)
			Template.TextScaled = false
			Template.TextSize = 16.000
			Template.TextWrapped = true
			Template.BorderSizePixel = 1
			Template.BorderColor3 = Color3.fromRGB(74,74,74)
			
			local Dropdown = Instance.new("TextLabel")
			local DropdownButton = Instance.new("TextButton")
			
			Dropdown.Name = "Dropdown"
			Dropdown.Parent = Main
			Dropdown.Active = true
			Dropdown.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			Dropdown.BorderSizePixel = 1
			Dropdown.BorderColor3 = Color3.fromRGB(74,74,74)
			Dropdown.Position = UDim2.new(0.0234603062, 0, -0.00937500037, 0)
			Dropdown.Selectable = true
			Dropdown.Size = UDim2.new(0.949999988, 0, 0,26)
			Dropdown.Font = Enum.Font.SourceSans
			Dropdown.Text = (DropdownText and DropdownText or "nil")
			Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
			Dropdown.TextSize = 16.000
			Dropdown.LayoutOrder = Count
			
			DropdownButton.Name = "DropdownButton"
			DropdownButton.Parent = Dropdown
			DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownButton.BackgroundTransparency = 1.000
			DropdownButton.BorderSizePixel = 0
			DropdownButton.Position = UDim2.new(0.859911799, 0, 0.159999996, 0)
			DropdownButton.Size = UDim2.new(0.100000001, 0, 0.675000012, 0)
			DropdownButton.Font = Enum.Font.SourceSans
			DropdownButton.Text = "∨"
			DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			DropdownButton.TextScaled = true
			DropdownButton.TextSize = 16.000
			DropdownButton.TextWrapped = true
			Count += 1
			
			Dropdown_Frame.Name = "Dropdown_Frame"
			Dropdown_Frame.Parent = Main
			Dropdown_Frame.Active = true
			Dropdown_Frame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			Dropdown_Frame.BorderSizePixel = 0
			Dropdown_Frame.Position = UDim2.new(0.0250000712, 0, 0.349999994, 0)
			Dropdown_Frame.Size = UDim2.new(0.949999988, 0, 0, 0)
			Dropdown_Frame.CanvasSize = UDim2.new(0, 0, 0, 120)
			Dropdown_Frame.ScrollBarThickness = 5
			Dropdown_Frame.LayoutOrder = Count
			Dropdown_Frame.Visible = false
			Dropdown_Frame.BorderSizePixel = 1
			Dropdown_Frame.BorderColor3 = Color3.fromRGB(74,74,74)

			UIListLayout.Parent = Dropdown_Frame
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)
			
			local function Update()
				local size = 0
				for i,v in pairs(Dropdown_Frame:GetChildren()) do
					if v:IsA("TextButton") then
						size += v.Size.Y.Offset + UIListLayout.Padding.Offset
					end
				end
				Dropdown_Frame.CanvasSize = UDim2.new(0,0,0,size)
			end
			
			
			for i,v in pairs(Buttons) do
				local name = v
				local Button = Template:Clone()
				Button.Text = name
				Button.Name = name
				Button.Parent = Dropdown_Frame
				Button.MouseButton1Click:Connect(function()
					Callback(name)
				end)
			end
			
			Update()
			
			DropdownButton.MouseButton1Click:Connect(function()
				if Debounce then return end
				Debounce = true
				if Shown == false then
					local Tween = TweenService:Create(Dropdown_Frame,TabOpenTween,{Size = UDim2.new(0.949999988, 0, 0, 75)})
					local Tween_2 = TweenService:Create(DropdownButton,TabOpenTween,{Rotation = -180})
					Dropdown_Frame.Visible = true
					wait()
					Tween:Play()
					Tween_2:Play()
					Tween.Completed:Wait()
					Shown = true
				else
					local Tween = TweenService:Create(Dropdown_Frame,TabOpenTween,{Size = UDim2.new(0.949999988, 0, 0, 0)})
					local Tween_2 = TweenService:Create(DropdownButton,TabOpenTween,{Rotation = 0})
					Tween:Play()
					Tween_2:Play()
					Tween.Completed:Wait()
					wait()
					Dropdown_Frame.Visible = false
					Shown = false
				end
				Debounce = false
			end)
			
			local DropdownFunctions = {}
			
			function DropdownFunctions:AddButton(ButtonName)
				if not Dropdown_Frame:FindFirstChild(ButtonName) then
					local Button = Template:Clone()
					Button.Text = ButtonName
					Button.Parent = Dropdown_Frame
					Button.Name = ButtonName
					Button.MouseButton1Click:Connect(function()
						Callback(ButtonName)
					end)
					Update()
				end
			end
			
			function DropdownFunctions:RemoveButton(ButtonName)
				if Dropdown_Frame:FindFirstChild(ButtonName) then
					Dropdown_Frame:FindFirstChild(ButtonName):Destroy()
					Update()
				end
			end
			
			return DropdownFunctions
			
		end
		
		function ButtonFunctions:Slider(SliderText,Min,Max,Default,Callback)
			Count += 1
			local SliderHeld = false
			local SliderFrame = Instance.new("Frame")
			local Text = Instance.new("TextLabel")
			local SlideValue = Instance.new("TextLabel")
			local SliderMain = Instance.new("TextButton")
			local Slider = Instance.new("Frame")
			local SliderGround = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UICorner_2 = Instance.new("UICorner")

			SliderFrame.Name = "SliderFrame"
			SliderFrame.Parent = Main
			SliderFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			SliderFrame.BorderSizePixel = 0
			SliderFrame.Position = UDim2.new(0.0250000935, 0, 0.681249976, 0)
			SliderFrame.Size = UDim2.new(0.949999988, 0, 0, 42)
			SliderFrame.LayoutOrder = Count
			SliderFrame.BorderSizePixel = 1
			SliderFrame.BorderColor3 = Color3.fromRGB(74,74,74)
			
			
			Text.Name = "Text"
			Text.Parent = SliderFrame
			Text.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			Text.BorderSizePixel = 0
			Text.Position = UDim2.new(0.0650001466, 0, 0.0556062981, 0)
			Text.Size = UDim2.new(0.75908792, 0, 0.474999964, 0)
			Text.Font = Enum.Font.SourceSans
			Text.Text = SliderText
			Text.TextColor3 = Color3.fromRGB(255, 255, 255)
			Text.TextSize = 16.000
			Text.TextXAlignment = Enum.TextXAlignment.Left

			SlideValue.Name = "SlideValue"
			SlideValue.Parent = SliderFrame
			SlideValue.Active = true
			SlideValue.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			SlideValue.BackgroundTransparency = 1.000
			SlideValue.BorderSizePixel = 0
			SlideValue.Position = UDim2.new(0.82447201, 0, 0.055606328, 0)
			SlideValue.Selectable = true
			SlideValue.Size = UDim2.new(0.100383677, 0, 0.474999994, 0)
			SlideValue.Font = Enum.Font.SourceSans
			SlideValue.Text = Default
			SlideValue.TextColor3 = Color3.fromRGB(255, 255, 255)
			SlideValue.TextSize = 18.000
			SlideValue.TextWrapped = true

			SliderMain.Name = "SliderMain"
			SliderMain.Parent = SliderFrame
			SliderMain.Active = true
			SliderMain.AnchorPoint = Vector2.new(0, 0.5)
			SliderMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderMain.BackgroundTransparency = 1.000
			SliderMain.BorderSizePixel = 0
			SliderMain.Position = UDim2.new(0.0649999976, 0, 0.75, 0)
			SliderMain.Selectable = false
			SliderMain.Size = UDim2.new(0.86500001, 0, 0.200000003, 0)
			SliderMain.ZIndex = 1
			SliderMain.Text = ""
			SliderMain.TextColor3 = Color3.fromRGB(0, 0, 0)

			Slider.Name = "Slider"
			Slider.Parent = SliderMain
			Slider.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
			Slider.BorderSizePixel = 0
			Slider.Size = UDim2.new(1, 0, 1, 0)

			SliderGround.Name = "SliderGround"
			SliderGround.Parent = Slider
			SliderGround.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderGround.BorderColor3 = Color3.fromRGB(27, 42, 53)
			SliderGround.BorderSizePixel = 0
			SliderGround.Size = UDim2.new(0, 0, 1, 0)
			
			
			UICorner.Parent = SliderGround
			UICorner_2.Parent = Slider
			
			SliderMain.MouseButton1Down:Connect(function()
				SliderHeld = true
			end)
			UIS.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and SliderHeld == true then
					SliderHeld = false
				end
			end)
			
			local function Update()
				local MousePos = UIS:GetMouseLocation().X
				local Position = Slider.AbsolutePosition.X
				local Size = Slider.AbsoluteSize.X
				local pos = math.floor((MousePos-Position)/Size)
				local value = math.floor(pos*Max)
				local newpos = math.clamp(pos,0,1)
				SliderGround.Size = UDim2.new(math.clamp(newpos,0,1),0,1,0)
				Callback(math.clamp(math.floor(value),Min,Max))
				SlideValue.Text = math.clamp(math.floor(value),Min,Max)
			end
			
			SliderGround.Size = UDim2.new(math.clamp(Default/Max,0,1),0,1,0)
			
			RunService:BindToRenderStep("Slider_"..SliderText,200,function()
				if SliderHeld then
					Update()
				end
			end)
			
		end
		
		if Corner then
			local UICorner = Instance.new("UICorner")
			UICorner.Parent = TabButton
			UICorner.CornerRadius = UDim.new(0,3)

			local UICorner2 = Instance.new("UICorner")
			UICorner.CornerRadius = UDim.new(0,3)
			UICorner2.Parent = MainHolder

			Line.Visible = false
		end
		
		local function MainUpdate()
			local size = 0
			for i,v in pairs(Main:GetChildren()) do
				if not v:IsA("UIBase") then
					size += v.Size.Y.Offset + UIListLayout.Padding.Offset
				end
			end
			Main.CanvasSize = UDim2.new(0,0,0,size)
		end
		
		MainUpdate()
		Main.ChildAdded:Connect(function()
			wait()
			MainUpdate()
		end)
		
		return ButtonFunctions
		
	end
	
	UIS.InputBegan:Connect(function(input,a)
		if a then return end
		if input.KeyCode == Enum.KeyCode.RightAlt and TabsHolder then
			TabsHolder.Visible = not TabsHolder.Visible
		end
	end)
	

	
	return Functions
	
end
--bye
return Library
