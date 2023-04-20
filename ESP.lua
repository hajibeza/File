function isnil(thing)
    return (thing == nil)
end

local function round(n)
    return math.floor(tonumber(n) + 0.5)
end

Number = math.random(1, 1000000)

function Tween_Color(object,property)
    TweenService = game:GetService("TweenService")
    TweenService:Create(object,TweenInfo.new(0,Enum.EasingStyle.Linear),property):Play()
end

function PlrESP()
	pcall(function()
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if _G.ESP_Player then
				if not isnil(v.Character) then
					if not v.Character.Head:FindFirstChild('NameEsp'..v.Name) then
						local BillboardGui = Instance.new("BillboardGui")
						local ESP = Instance.new("TextLabel")
						local HealthESP = Instance.new("TextLabel")
						BillboardGui.Parent = v.Character.Head
						BillboardGui.Name = 'NameEsp'..v.Name
						BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
						BillboardGui.Size = UDim2.new(1,200,1,30)
						BillboardGui.Adornee = v.Character.Head
						BillboardGui.AlwaysOnTop = true
						ESP.Name = "ESP"
						ESP.Parent = BillboardGui
						ESP.TextTransparency = 0
						ESP.BackgroundTransparency = 1
						ESP.Size = UDim2.new(0, 200, 0, 30)
						ESP.Position = UDim2.new(0,25,0,0)
						ESP.Font = Enum.Font.Gotham
						ESP.Text = (v.Name ..' '.."[ "..round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M'.." ]")
						task.spawn(function()
							while wait() do
								Tween_Color(ESP,{TextColor3 = _G.ESP_Player_Color})
							end
						end)
						ESP.TextSize = 14
						ESP.TextStrokeTransparency = 0.500
						ESP.TextWrapped = true
						HealthESP.Name = "HealthESP"
						HealthESP.Parent = ESP
						HealthESP.TextTransparency = 0
						HealthESP.BackgroundTransparency = 1
						HealthESP.Position = ESP.Position + UDim2.new(0, -25, 0, 15)
						HealthESP.Size = UDim2.new(0, 200, 0, 30)
						HealthESP.Font = Enum.Font.Gotham
						HealthESP.TextColor3 = Color3.fromRGB(255, 0, 0)
						HealthESP.TextSize = 14
						HealthESP.TextStrokeTransparency = 0.500
						HealthESP.TextWrapped = true
						HealthESP.Text = "Health "..math.floor(v.Character.Humanoid.Health).."/"..math.floor(v.Character.Humanoid.MaxHealth)
					else
						v.Character.Head['NameEsp'..v.Name].ESP.Text = (v.Name ..' '..round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
						v.Character.Head['NameEsp'..v.Name].ESP.HealthESP.Text = "Health "..math.floor(v.Character.Humanoid.Health).."/"..math.floor(v.Character.Humanoid.MaxHealth)
						v.Character.Head:FindFirstChild('NameEsp'..v.Name).ESP.TextTransparency = 0
						v.Character.Head:FindFirstChild('NameEsp'..v.Name).ESP.HealthESP.TextTransparency = 0
					end
				end
			else
				if v.Character.Head:FindFirstChild('NameEsp'..v.Name) then
					v.Character.Head:FindFirstChild('NameEsp'..v.Name):Destroy()
				end
			end
		end    
	end) 
end

function IslandESP()
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if _G.IslandEsp then 
                if v.Name ~= "Sea" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
						task.spawn(function()
							while wait() do
								Tween_Color(name,{TextColor3 = _G.ESP_Island_Color})
							end
						end)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                    end
                end
            else
                if v:FindFirstChild('NameEsp')then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

function ChestSESP() 
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        pcall(function()
            if string.find(v.Name,"Chest") then
                if _G.ChestEsp then
                    if string.find(v.Name,"Chest") then
                        if not v:FindFirstChild('NameEsp') then
                            local bill = Instance.new('BillboardGui',v)
                            bill.Name = 'NameEsp'
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
							task.spawn(function()
								while wait() do
									Tween_Color(name,{TextColor3 = _G.ESP_Chest_Color})
								end
							end)
							if v.Name == "Chest1" then
								name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
							end
							if v.Name == "Chest2" then
								name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
							end
							if v.Name == "Chest3" then
								name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
							end
                    	else
							v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
						end
                	end
				else
					if v:FindFirstChild('NameEsp') and not _G.ChestEsp then
						v:FindFirstChild('NameEsp'):Destroy()
					end
            	end
            end
        end)
    end
end

function UpdateBfEsp() 
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        pcall(function()
            if  _G.DFEsp then
                if string.find(v.Name, "Fruit") then   
                    if not v.Handle:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v.Handle)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v.Handle
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
						task.spawn(function()
							while wait() do
								Tween_Color(name,{TextColor3 = _G.ESP_Demon_Fruit_Color})
							end
						end)
                        name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
                    else
                        v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
                    end
                end
            else
                if v.Handle:FindFirstChild('NameEsp') and not  _G.DFEsp then
                    v.Handle:FindFirstChild('NameEsp'):Destroy()
                end
            end
            if v.Handle:FindFirstChild('NameEsp') and not  _G.DFEsp then
                v.Handle:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end

function FlowerESP() 
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        pcall(function()
            if v.Name == "Flower2" or v.Name == "Flower1" then
                if _G.FlowerEsp then 
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
						task.spawn(function()
							while wait() do
								Tween_Color(name,{TextColor3 = _G.ESP_Flower_Color})
							end
						end)
						if v.Name == "Flower1" then 
							name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
							name.TextColor3 = Color3.fromRGB(0, 0, 255)
						end
						if v.Name == "Flower2" then
							name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
							name.TextColor3 = Color3.fromRGB(255, 0, 0)
						end
					else
						v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
					end
                else
                    if v:FindFirstChild('NameEsp') then
                        v:FindFirstChild('NameEsp'):Destroy()
                    end
                end
            end   
            if v:FindFirstChild('NameEsp') and not _G.FlowerEsp then
                 v:FindFirstChild('NameEsp'):Destroy()
            end
        end)
    end
end
