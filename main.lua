if _G.FS_GUI then
	_G.FS_GUI()
end

local Funcs = {
	AddCorner = function(Frame,Radius)
		local corner = Instance.new("UICorner",Frame)
		corner.CornerRadius = UDim.new(0,Radius or 10)

		return corner
	end,
}

local screengui = Instance.new("ScreenGui",game.CoreGui)
screengui.DisplayOrder = 9999999
local MainFrame = Instance.new("Frame",screengui)
MainFrame.BackgroundColor3 = Color3.fromRGB(73, 94, 116)
MainFrame.Size = UDim2.new(0,300,0,300)
Funcs.AddCorner(MainFrame,20)

MainFrame.Active = true
MainFrame.Draggable = true

local CF1 = Instance.new("Frame",MainFrame)
CF1.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
CF1.Size = UDim2.new(1,-14,0,40)
CF1.AnchorPoint = Vector2.new(0.5,0)
CF1.Position = UDim2.new(0.5,0,0,7)
Funcs.AddCorner(CF1,16)

local txt = Instance.new('TextLabel',CF1)
txt.BackgroundTransparency = 1
txt.Size = UDim2.new(1,0,1,0)
txt.TextColor3 = Color3.fromRGB(255, 255, 255)
txt.TextSize = 22
txt.Font = Enum.Font.SourceSansSemibold
txt.Text = "Bat fight"


local CF = Instance.new("Frame",MainFrame)
CF.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
CF.Size = UDim2.new(1,-14,1,-60)
CF.AnchorPoint = Vector2.new(0.5,1)
CF.Position = UDim2.new(0.5,0,1,-7)
Funcs.AddCorner(CF,16)

local CONTENT = Instance.new("Frame",CF)
CONTENT.Size = UDim2.new(1,-10,1,-10)
CONTENT.Position = UDim2.new(0.5,0,0.5,0)
CONTENT.AnchorPoint = Vector2.new(0.5,0.5)
CONTENT.BackgroundTransparency = 1

local list = Instance.new('UIListLayout',CONTENT)
list.Padding = UDim.new(0,5)


local running = true

_G.FS_GUI = function()
	running = false
	screengui:Destroy()
end

function AddToggle(Data,Func)
	local toggled = false
	local button = Instance.new('TextButton',CONTENT)
	button.AutoButtonColor = false
	button.BackgroundColor3 = Color3.fromRGB(79, 79, 79)
	Funcs.AddCorner(button,10)
	button.Size = UDim2.new(1,0,0,30)
	button.Text = ""

	local label = Instance.new("TextLabel",button)
	label.BackgroundTransparency = 1
	label.Size = UDim2.new(1,0,0.65,0)
	label.Position = UDim2.new(0,10,0.5,0)
	label.AnchorPoint = Vector2.new(0,0.5)
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Font = Enum.Font.SourceSansSemibold
	label.TextScaled = true
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.Text = Data

	local tweenservice = game:GetService('TweenService')

	button.MouseEnter:Connect(function()
		tweenservice:Create(button,TweenInfo.new(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{
			['BackgroundColor3'] = Color3.fromRGB(73, 94, 116)
		}):Play()
	end)

	button.MouseLeave:Connect(function()
		tweenservice:Create(button,TweenInfo.new(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{
			['BackgroundColor3'] = Color3.fromRGB(79, 79, 79)
		}):Play()
	end)

	local istoggled = Instance.new('Frame',button)
	istoggled.AnchorPoint = Vector2.new(1,0.5)
	istoggled.Size = UDim2.new(0,10,0,10)
	istoggled.Position = UDim2.new(1,-10,0.5,0)
	Funcs.AddCorner(istoggled,10000)

	button.MouseButton1Click:Connect(function()
		toggled = toggled == false

		if toggled == true then
			tweenservice:Create(istoggled,TweenInfo.new(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{
				['BackgroundColor3'] = Color3.fromRGB(0, 207, 7)
			}):Play()
		else
			tweenservice:Create(istoggled,TweenInfo.new(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{
				['BackgroundColor3'] = Color3.fromRGB(163, 162, 165)
			}):Play()
		end					

		Func(toggled)
	end)
end

function AddButton(Data,Func)
	local toggled = false
	local button = Instance.new('TextButton',CONTENT)
	button.AutoButtonColor = false
	button.BackgroundColor3 = Color3.fromRGB(79, 79, 79)
	Funcs.AddCorner(button,10)
	button.Size = UDim2.new(1,0,0,30)
	button.Text = ""

	local label = Instance.new("TextLabel",button)
	label.BackgroundTransparency = 1
	label.Size = UDim2.new(1,0,0.65,0)
	label.Position = UDim2.new(0,10,0.5,0)
	label.AnchorPoint = Vector2.new(0,0.5)
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Font = Enum.Font.SourceSansSemibold
	label.TextScaled = true
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.Text = Data

	local tweenservice = game:GetService('TweenService')

	button.MouseEnter:Connect(function()
		tweenservice:Create(button,TweenInfo.new(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{
			['BackgroundColor3'] = Color3.fromRGB(73, 94, 116)
		}):Play()
	end)

	button.MouseLeave:Connect(function()
		tweenservice:Create(button,TweenInfo.new(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{
			['BackgroundColor3'] = Color3.fromRGB(79, 79, 79)
		}):Play()
	end)

	button.MouseButton1Click:Connect(function()
		Func()
	end)
end

spawn(function()
	local is_on = false
	AddToggle("Kill-Aura",function(Bool)
		is_on = Bool
		if Bool == true then
			local plr = game:GetService('Players').LocalPlayer
			repeat task.wait()
				for _, v in pairs(game:GetService("Players"):GetChildren()) do
					pcall(function()
						if v ~= plr then
								local root = plr.Character.HumanoidRootPart.Position
								local root2 = v.Character.HumanoidRootPart.Position
								local dist = (root-root2).Magnitude
								if dist < 15 then
										local args = {[1] = 1,[2] = "HumanoidRootPart",[3] = v.Character.Humanoid}
										game:GetService("Players").LocalPlayer.Character.Bat.Attack:FireServer(unpack(args))

								end
						end
					end)
				end
			until is_on == false
		end
	end)
end)

spawn(function()
	local db = true
	AddButton("Get-All Bats",function()
		if db == true then
			db = false
			pcall(function()
		local plr = game:GetService("Players").LocalPlayer
		local chr = plr.Character
		local start = chr.HumanoidRootPart.CFrame

		local a, b = pcall(function()
		    for _, v in pairs(workspace.Map2:GetChildren()) do
		        if v.Name == "Weapon Spawner" then
		            local t = tick()
						
		            repeat task.wait(0.1)
		                chr.HumanoidRootPart.CFrame = v.Model.Main.CFrame - Vector3.new(0,1.5,0)
		                chr.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
		                fireproximityprompt(v.Model.Main.Prox.ProximityPrompt,1)
		            until t < tick()-0.5
		        end
		    end
		end)
		if not a then
		   rconsoleprint(b..'\n') 
		end
		plr.Character.HumanoidRootPart.CFrame = start
	end)
	db = true
	end
	end)
end)

spawn(function()
	AddButton("Kill-All",function()
		local plr = game:GetService("Players").LocalPlayer
		for i = 1,10 do
		for _, v in pairs(game:GetService("Players"):GetChildren()) do
			pcall(function()
				if v ~= plr then
						local args = {[1] = 1,[2] = "HumanoidRootPart",[3] = v.Character.Humanoid}
						game:GetService("Players").LocalPlayer.Character.Bat.Attack:FireServer(unpack(args))
				end
			end)
		end
	end
	end)
end)

spawn(function()
	AddButton("Equip all bats",function()
		local plr = game:GetService("Players").LocalPlayer
		for _, v in pairs(plr.Backpack:GetChildren()) do
			v.Parent = plr.Character
		end
	end)
end)
