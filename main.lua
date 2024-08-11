local api = require("api")

-- First up is the addon definition!
-- This information is shown in the Addon Manager.
-- You also specify "unload" which is the function called when unloading your addon.
local example_addon = {
  name = "Example Addon",
  author = "Aguru",
  desc = "Example addon showcasing some features of the API",
  version = "0.2"
}

-- The Load Function is called as soon as the game loads its UI. Use it to initialize anything you need!
local function Load() 
  -- To print a message to the chat, you can use this. Only you can see it! It's good for debugging
  -- This will be called BEFORE load!
  api.Log:Info("Loading test addon...")

  -- This is how you load another file. Here we just want to execute what's in bigger_raid_text.lua
  -- Check the file out to figure out what it does!
  require("example_addon/bigger_raid_text")
  require("example_addon/raid_role_saver")
  
  -- This is how you load a file and get a result out of it.
  -- Here we get world_marker and later use it in the Unload function
  World_marker = require("example_addon/world_marker")


  -- api test: getting inventory slots
  -- on load, get first item in inventory
  -- note: inventory has "real" slots and "displayed" slots. Display = sorted, Real = where it actually is

  --api.GetBagItemInfo()
end

-- Unload is called when addons are reloaded.
-- Here you want to destroy your windows and do other tasks you find useful.
local function Unload()
  if World_marker ~= nil then
    World_marker.window:Show(false)
    World_marker.window = nil
  end
end

-- Here we make sure to bind the functions we defined to our addon. This is how the game knows what function to use!
example_addon.OnLoad = Load
example_addon.OnUnload = Unload

return example_addon
