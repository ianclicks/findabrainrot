-- Table to keep track of touched parts
local touchedParts = {}

game:GetService("RunService").Stepped:Connect(function()
    local player = game.Players.LocalPlayer
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end

    local hrp = char.HumanoidRootPart

    for _, brainrot in pairs(workspace.Brainrots:GetChildren()) do
        if brainrot:IsA("BasePart") then

            -- Skip parts already touched
            if not touchedParts[brainrot] then

                if firetouchinterest then
                    firetouchinterest(hrp, brainrot, 0)
                    firetouchinterest(hrp, brainrot, 1)
                else
                    hrp.CFrame = brainrot.CFrame
                end

                -- Mark this part as touched so it's not repeated
                touchedParts[brainrot] = true
            end
        end
    end
end)
