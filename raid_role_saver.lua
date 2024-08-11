local api = require("api")
-- This module here is a tiny addon: Saving last used raid role!

-- First off: Define a function called when our role is changed.
-- Here, we will write to a file and contain our role.
local function OnRoleChanged(role)
	api.File:Write("example_addon/raid_role.txt", { role = role})
end

-- Second: Detect a team change, and set our new role!
-- We read the previously written file.
local function OnTeamChanged()
	local savedRole = api.File:Read("example_addon/raid_role.txt")
	api.Team:SetRole(savedRole.role)
end

-- Last: Register the event listeners so that the code is actually called.
api.On("raid_role_changed", OnRoleChanged)
api.On("TEAM_MEMBERS_CHANGED", OnTeamChanged)
