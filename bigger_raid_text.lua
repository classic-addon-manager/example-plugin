-- This is perhaps the simplest example we can provide. This just makes the font size bigger for Commander chat.
-- Here we set it to 24 and it becomes very large!
-- As you can see, it grabs an existing window

local raidCommandMessage = ADDON:GetContent(UIC.RAID_COMMAND_MESSAGE)
raidCommandMessage.style:SetFontSize(20)

-- If you need to learn, you could try to make it a setting instead of a static value. 
-- That would be a cool addon people would love :)
