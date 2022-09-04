local txst = {}

function txst:CreateWindow(titleText,ID)
	local holder = Instance.new('ScreenGui')
	holder.Parent = game.Players.GizmoTajz.PlayerGui
	local window = Instance.new('Frame')
	window.Size = UDim2.new(0.1, 0,0.2, 0)
	window.Position = UDim2.new(0.061, 0,0.088, 0)
	window.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Instance.new('UICorner',window)
	window.Parent = holder
	local title = Instance.new('TextLabel')
	title.Size = UDim2.new(1, 0,0.4, 0)
	title.Position = UDim2.new(0,0,0,0)
	title.TextColor3 = Color3.fromRGB(255,255,255)
	title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	title.Font = Enum.Font.GothamMedium
	title.TextSize = 24
	title.Text = titleText
	Instance.new('UICorner',title)
	title.Parent = window
	local icon = Instance.new('ImageLabel')
	icon.Size = UDim2.new(0.1,0,0.1,0)
	icon.Position = UDim2.new(0.15,0,0.144,0)
	icon.BackgroundTransparency = 1
	icon.Image = 'rbxassetid://'..tostring(ID)
	icon.Parent = window
	local UIS = game:GetService('UserInputService')
	local frame = window
	local dragToggle = nil
	local dragSpeed = 0.00001
	local dragStart = nil
	local startPos = nil
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
		
	end)
	return window
end

--[[
	CreateWindow
	1: title(text)
	2: icon(ID)
	Return
	1: Window
]]--

function txst:CreateButton(window,title,callback)
	local button = Instance.new('TextButton')
	button.Size = UDim2.new(1, 0,0.4, 0)
	button.Position = UDim2.new(0, 0,0.449, 0)
	button.TextColor3 = Color3.fromRGB(255,255,255)
	button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	button.Font = Enum.Font.GothamMedium
	button.TextSize = 14 --24
	button.Text = title
	Instance.new('UICorner',button)
	button.Parent = window
	button.MouseButton1Click:Connect(callback)
	button.TouchTap:Connect(callback)
end

--[[
	CreateButton
	1: Main Window(object)
	2: Text(text)
	3: Function to run(function)
	Return:
	1: None
]]--

return txst
