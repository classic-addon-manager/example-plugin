ADDON_API = {
	File = {},
	Unit = {},
	Team = {},
	Log = {},
	Interface = {},
	Cursor = {},
	Input = {},
	Time = {},
	Player = {},
    Bag = {},
	-- This is the 'addons' directory at runtime
	baseDir = "",
	rootWindow = {},
  timers = {}
}


-- ======
-- Logging
-- ======

-- Logs a message to chat in YELLOW
function ADDON_API.Log:Info(message)
end

-- Logs a message to chat in RED
function ADDON_API.Log:Err(message)
end


-- ======
-- File Handling
-- ====== 

function ADDON_API.File:Write(path, tbl)
end

function ADDON_API.File:Read(path)
end


function ADDON_API.GetSettings(addonId)
end

function ADDON_API.SaveSettings()
end
-- ======
-- Interface
-- ======
function ADDON_API.Interface:CreateWindow(id, title, x, y, tabs)
end

function ADDON_API.Interface:CreateEmptyWindow(id)
end

function ADDON_API.Interface:CreateWidget(type, id, parent)
end

function ADDON_API.Interface:CreateStatusBar(name, parent, type)
end

function ADDON_API.Interface:CreateComboBox(window)
end

function ADDON_API.Interface:ApplyButtonSkin(btn, skin)
end

-- ======
-- Unit
-- ======
function ADDON_API.Unit:GetUnitNameById(id)
end

function ADDON_API.Unit:GetUnitInfoById(id)
end

-- Note: "unit" in the below can be player, target, team1 through team50, playerpet1 or playerpet2
function ADDON_API.Unit:GetUnitScreenPosition(unit)
end

function ADDON_API.Unit:UnitDistance(unit)
end

function ADDON_API.Unit:GetUnitId(unit)
end

function ADDON_API.Unit:UnitBuffCount(unit)
end

function ADDON_API.Unit:UnitBuff(unit, index)
end

-- Returns the x,y,z coords of the provided unit
function ADDON_API.Unit:UnitWorldPosition(unit)
end

function ADDON_API.Unit:UnitDeBuffCount(unit)
end

function ADDON_API.Unit:UnitDeBuff(unit, index)
end


-- ======
-- Team
-- ======
function ADDON_API.Team:InviteToTeam(name, party)
end 

function ADDON_API.Team:SetRole(role)
end

-- ======
-- Bag
-- ======
function ADDON_API.Bag:EquipBagItem(bagSlot, isAux)
end

--[[
    @function GetBagItemInfo
    @desc Get item information at the index, in the bag specified. 1 = Inventory 
]]
function ADDON_API.Bag:GetBagItemInfo(bagType, index)
end

-- ======
-- Cursor
-- ======
function ADDON_API.Cursor:ClearCursor()
end

function ADDON_API.Cursor:SetCursorImage(image, x, y)
end

-- ======
-- Time
-- ======
function ADDON_API.Time:GetUiMsec()
end

-- ======
-- Input
-- ======
function ADDON_API.Input:IsShiftKeyDown()
end


-- ======
-- Player
-- ======

--[[
    @function ChangeAppellation
    @desc Changes the player's title
    @param type (number) The ID of the title to set
    @returns (nil|true) 
]]
function ADDON_API.Player:ChangeAppellation(type)
end

-- ======
-- Events & Timers
-- ======
function ADDON_API.On(event, callback)
end

function ADDON_API:DoIn(msec, callback)
end


return ADDON_API