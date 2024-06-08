local Players = game:GetService('Players')
local TweenService = game:GetService('TweenService')
local UserInputService = game:GetService('UserInputService')

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Hum = Character:WaitForChild('Humanoid')

local PlayerCamera = workspace.CurrentCamera

local OpenCamInfo = TweenInfo.new(
	.25,
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local CloseCaminfo = TweenInfo.new(
	.35,
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local CurrentFOV = PlayerCamera.FieldOfView
local CurrentSpeed = Hum.WalkSpeed

local SprintKey = {
	Enum.KeyCode.LeftShift;
	Enum.KeyCode.RightShift;
}

UserInputService.InputBegan:Connect(function(Input: InputObject, GPE: boolean)
	if Input.KeyCode == SprintKey[table.find(SprintKey, Input.KeyCode)] then
    --if GPE then return end --Uncomment this if you don't want player to sprint when typing in chat and press shift (highly recommend)
		Hum.WalkSpeed *= 2
		TweenService:Create(PlayerCamera, OpenCamInfo, {FieldOfView = CurrentFOV * 1.5}):Play()
	end
end)

UserInputService.InputEnded:Connect(function(Input: InputObject)
	if Input.KeyCode == SprintKey[table.find(SprintKey, Input.KeyCode)] then
		Hum.WalkSpeed = CurrentSpeed
		TweenService:Create(PlayerCamera, OpenCamInfo, {FieldOfView = CurrentFOV}):Play()
	end
end)
