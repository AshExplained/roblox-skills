-- SimpleBridgeBuilder.lua - CLEAN & SIMPLE 🌉
-- ضع هذا الكود في LocalScript داخل StarterPlayer > StarterPlayerScripts
-- اضغط F لبناء جسر بسيط وأنيق

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- ============ إعدادات الجسر البسيط ============
local START_POS = Vector3.new(-50, 2, 0)  -- يبدأ من الأرض
local END_POS = Vector3.new(50, 2, 0)     -- جسر أقصر (100 studs)
local ARCH_HEIGHT = 15                     -- ارتفاع القوس
local SEGMENT_COUNT = 40
local ROAD_WIDTH = 12
local ROAD_THICKNESS = 1.5
local BUILD_KEY = Enum.KeyCode.F

-- ألوان بسيطة
local WHITE_COLOR = Color3.fromRGB(240, 240, 245)
local BLUE_NEON = Color3.fromRGB(0, 170, 255)
local PILLAR_COLOR = Color3.fromRGB(200, 200, 210)
local LIGHT_COLOR = Color3.fromRGB(255, 245, 230)

local bridgeFolder = nil
local isBuilding = false

-- ============ حساب نقطة على القوس ============
local function getArchPoint(t)
	local pos = START_POS:Lerp(END_POS, t)
	local heightOffset = math.sin(t * math.pi) * ARCH_HEIGHT
	return pos + Vector3.new(0, heightOffset, 0)
end

-- ============ تأثير بناء خفيف ============
local function createBuildEffect(position)
	local ring = Instance.new("Part")
	ring.Shape = Enum.PartType.Cylinder
	ring.Size = Vector3.new(0.2, 0.1, 0.1)
	ring.Position = position
	ring.Anchored = true
	ring.CanCollide = false
	ring.Material = Enum.Material.Neon
	ring.Color = BLUE_NEON
	ring.Transparency = 0.3
	ring.Orientation = Vector3.new(0, 0, 90)
	ring.Parent = workspace

	TweenService:Create(ring, TweenInfo.new(0.4), {
		Size = Vector3.new(0.2, 8, 8),
		Transparency = 1
	}):Play()

	game:GetService("Debris"):AddItem(ring, 0.5)
end

-- ============ عمود بسيط ============
local function createSimplePillar(position, height, parent)
	local parts = {}

	-- العمود الرئيسي
	local pillar = Instance.new("Part")
	pillar.Size = Vector3.new(3, height, 3)
	pillar.Position = position - Vector3.new(0, height/2, 0)
	pillar.Anchored = true
	pillar.Material = Enum.Material.Concrete
	pillar.Color = PILLAR_COLOR
	pillar.Transparency = 1
	pillar.Parent = parent
	table.insert(parts, pillar)

	-- قاعدة العمود
	local base = Instance.new("Part")
	base.Size = Vector3.new(5, 2, 5)
	base.Position = position - Vector3.new(0, height + 1, 0)
	base.Anchored = true
	base.Material = Enum.Material.Concrete
	base.Color = PILLAR_COLOR
	base.Transparency = 1
	base.Parent = parent
	table.insert(parts, base)

	-- ضوء ناعم على العمود
	local lightPart = Instance.new("Part")
	lightPart.Shape = Enum.PartType.Ball
	lightPart.Size = Vector3.new(1, 1, 1)
	lightPart.Position = position + Vector3.new(0, 2, 0)
	lightPart.Anchored = true
	lightPart.CanCollide = false
	lightPart.Material = Enum.Material.Neon
	lightPart.Color = LIGHT_COLOR
	lightPart.Transparency = 0.5
	lightPart.Parent = parent
	table.insert(parts, lightPart)

	-- إضاءة ناعمة
	local light = Instance.new("PointLight")
	light.Color = LIGHT_COLOR
	light.Range = 25
	light.Brightness = 1.5
	light.Shadows = true
	light.Parent = lightPart

	-- وميض ناعم جداً
	task.spawn(function()
		while lightPart and lightPart.Parent do
			local brightness = 1.3 + math.random() * 0.4
			TweenService:Create(light, TweenInfo.new(2), {Brightness = brightness}):Play()
			task.wait(2 + math.random())
		end
	end)

	return parts
end

-- ============ أنيميشن الظهور ============
local function revealParts(partsList, delay)
	task.wait(delay or 0)

	for _, part in ipairs(partsList) do
		local finalTransparency = part.Transparency
		local finalSize = part.Size
		local finalCFrame = part.CFrame

		part.Size = finalSize * 0.1
		part.CFrame = finalCFrame - Vector3.new(0, 10, 0)
		part.Transparency = 1

		TweenService:Create(part, TweenInfo.new(
			0.6,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		), {
			CFrame = finalCFrame,
			Size = finalSize,
			Transparency = finalTransparency
		}):Play()
	end
end

-- ============ الضوء القائد ============
local function createLeadingLight()
	local light = Instance.new("Part")
	light.Name = "LeadingLight"
	light.Shape = Enum.PartType.Ball
	light.Size = Vector3.new(3, 3, 3)
	light.Position = START_POS
	light.Anchored = true
	light.CanCollide = false
	light.Material = Enum.Material.Neon
	light.Color = BLUE_NEON
	light.Transparency = 0.3
	light.Parent = workspace

	local pointLight = Instance.new("PointLight")
	pointLight.Color = BLUE_NEON
	pointLight.Range = 50
	pointLight.Brightness = 10
	pointLight.Parent = light

	-- Trail
	local trail = Instance.new("Trail")
	local att0 = Instance.new("Attachment")
	local att1 = Instance.new("Attachment")
	att0.Parent = light
	att1.Parent = light
	att1.Position = Vector3.new(0, 0, -2)

	trail.Attachment0 = att0
	trail.Attachment1 = att1
	trail.Color = ColorSequence.new(BLUE_NEON)
	trail.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.3),
		NumberSequenceKeypoint.new(1, 1)
	})
	trail.Lifetime = 1
	trail.FaceCamera = true
	trail.Parent = light

	return light
end

-- ============ البناء الرئيسي ============
local function buildBridge()
	if isBuilding then
		warn("⚠️ الجسر يُبنى حالياً!")
		return
	end

	isBuilding = true

	if bridgeFolder then
		for _, part in ipairs(bridgeFolder:GetChildren()) do
			if part:IsA("BasePart") then
				TweenService:Create(part, TweenInfo.new(0.3), {Transparency = 1}):Play()
			end
		end
		task.wait(0.4)
		bridgeFolder:Destroy()
	end

	bridgeFolder = Instance.new("Folder")
	bridgeFolder.Name = "SimpleBridge"
	bridgeFolder.Parent = workspace

	print("🌉 بناء الجسر البسيط...")

	local roadSegments = {}
	local pillarPositions = {}

	-- إنشاء قطع الجسر
	for i = 0, SEGMENT_COUNT do
		local t = i / SEGMENT_COUNT
		local point = getArchPoint(t)

		local nextT = math.min(t + 0.01, 1)
		local nextPoint = getArchPoint(nextT)
		local lookDirection = (nextPoint - point).Unit
		local segmentLength = (END_POS - START_POS).Magnitude / SEGMENT_COUNT

		-- الأرضية البيضاء
		local road = Instance.new("Part")
		road.Name = "Road_" .. i
		road.Size = Vector3.new(ROAD_WIDTH, ROAD_THICKNESS, segmentLength)
		road.CFrame = CFrame.new(point, point + lookDirection)
		road.Anchored = true
		road.Material = Enum.Material.SmoothPlastic
		road.Color = WHITE_COLOR
		road.Transparency = 1
		road.Parent = bridgeFolder

		-- الخط الأزرق النيون بالمنتصف
		local blueLine = Instance.new("Part")
		blueLine.Size = Vector3.new(1, ROAD_THICKNESS + 0.1, segmentLength)
		blueLine.CFrame = road.CFrame
		blueLine.Anchored = true
		blueLine.Material = Enum.Material.Neon
		blueLine.Color = BLUE_NEON
		blueLine.Transparency = 1
		blueLine.Parent = bridgeFolder

		table.insert(roadSegments, {road, blueLine, position = point})

		-- مواقع الأعمدة (كل 5 قطع)
		if i % 5 == 0 and i > 0 and i < SEGMENT_COUNT then
			local groundHeight = point.Y - 2  -- المسافة للأرض
			table.insert(pillarPositions, {pos = point, height = groundHeight})
		end
	end

	-- الضوء القائد
	local leadingLight = createLeadingLight()
	local buildTime = 1.5

	-- بناء الطريق مع الضوء
	print("✨ الضوء يبني الطريق...")
	task.spawn(function()
		TweenService:Create(leadingLight, TweenInfo.new(buildTime, Enum.EasingStyle.Linear), {
			Position = END_POS + Vector3.new(0, 3, 0)
		}):Play()
	end)

	for i, segment in ipairs(roadSegments) do
		revealParts(segment, 0)
		createBuildEffect(segment.position)
		task.wait(buildTime / SEGMENT_COUNT)
	end

	-- إزالة الضوء القائد
	TweenService:Create(leadingLight, TweenInfo.new(0.4), {Transparency = 1}):Play()
	game:GetService("Debris"):AddItem(leadingLight, 0.5)

	task.wait(0.3)

	-- بناء الأعمدة
	print("🏛️ بناء الأعمدة...")
	for i, pillarData in ipairs(pillarPositions) do
		local parts = createSimplePillar(pillarData.pos, pillarData.height, bridgeFolder)
		revealParts(parts, i * 0.05)
		createBuildEffect(pillarData.pos)
		task.wait(0.1)
	end

	task.wait(0.5)

	-- صوت النهاية
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://6026984224"
	sound.Volume = 0.3
	sound.Parent = workspace
	sound:Play()
	game:GetService("Debris"):AddItem(sound, 3)

	print("✨ اكتمل بناء الجسر! ✨")
	isBuilding = false
end

-- ============ INPUT ============
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == BUILD_KEY then
		buildBridge()
	end
end)

print("🌉 Simple Bridge Builder")
print("اضغط F لبناء جسر بسيط وأنيق!")