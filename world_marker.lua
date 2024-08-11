local world_marker = {}

-- First, we create an empty window. This will be a layer on the screen we can draw on.
local canvas = api.Interface:CreateEmptyWindow("TargetArrow")
canvas:Show(true)

-- Second, we create a label. It's just text!
local label = canvas:CreateChildWidget("label", "label", 0, true)
label:Show(true)
label:AddAnchor("TOPLEFT", canvas, "TOPLEFT", 0, 42)

local playerId = api.Unit:GetUnitId("player")

-- Now we want to save the coordinates of our player when the addon loads
local settings = api.GetSettings("example_addon")

--local x, y, z = api.GetUnitWorldPosition("player")
local message = settings.message or ""
local x = settings.x or 0
local y = settings.y or 0
local z = settings.z or 0

label:SetText(message)
-- We then define a function that will be called on every frame.
-- The function will grab the screen coordinates of our initial player coords.
-- Then it checks if it's on the screen (offsetZ) and hide/show it accordingly.
-- Lastly, we adjust the Anchor of the canvas to place it on the right spot on the screen!
local function OnUpdate()
  local offsetX, offsetY, offsetZ = X2Util:ConvertWorldToScreen(x, y, z)

  if offsetZ < 0 or offsetZ > 100 then 
    canvas:Show(false)
  else 
		canvas:Show(true)
	end

	canvas:AddAnchor("BOTTOM", "UIParent", "TOPLEFT", offsetX, offsetY-92)
end

local function OnChatMessage(chatType, speakerId, isHostile, speakerName, message)
	if speakerId == playerId then
		local prefix = "/note "
	  if string.sub(message, 1, #prefix) == prefix then
			local note = string.sub(message, #prefix + 1)
			x, y, z = api.Unit:GetUnitWorldPosition("player")
			message = note
			label:SetText(message)
			
			local settings = api.GetSettings("example_addon")
			settings.message = message
			settings.x = x
			settings.y = y
			settings.z = z
			api.SaveSettings()
		end
	end
end

-- Now we register the above function so that it is actually called on every update.
api.On("UPDATE", OnUpdate)
api.On("CHAT_MESSAGE", OnChatMessage)

-- This is just so we can use the canvas and label in our main file. We do it for the Unload function!
world_marker.window = canvas
world_marker.label = label

return world_marker
