GM.Name = "nZombies Unlimited"
GM.Author = "Zet0r"
GM.Email = "N/A"
GM.Website = "N/A"

local function loadfile(f)
	if SERVER then AddCSLuaFile(f) end
	include(f)
end
local function loadfile_c(f)
	if SERVER then AddCSLuaFile(f) end
	if CLIENT then include(f) end
end
local function loadfile_s(f)
	if SERVER then include(f) end
end

-- Logic for loading modules from /lua/nzombies-unlimited
nzu = nzu or {}
function nzu.IsAdmin(ply) return ply:IsAdmin() end -- Replace this later

-- Globals to act like SERVER and CLIENT (reversed when modules are loaded in the sandbox)
NZU_SANDBOX = false
NZU_NZOMBIES = true

--[[-------------------------------------------------------------------------
Extension Manager
---------------------------------------------------------------------------]]
loadfile("nzombies-unlimited/core/extensions/extension_manager.lua")
loadfile_c("nzombies-unlimited/core/extensions/extension_panels.lua")
loadfile_c("nzombies-unlimited/core/hudmanagement.lua") -- Needed for the settings panel

--[[-------------------------------------------------------------------------
Core Modules shared with Sandbox
---------------------------------------------------------------------------]]
loadfile_c("nzombies-unlimited/core/cl_nzombies_skin.lua")

loadfile("nzombies-unlimited/core/configs.lua")
loadfile_s("nzombies-unlimited/core/sv_saveload.lua")
loadfile_s("nzombies-unlimited/core/mapflags.lua") -- Only Server outside Sandbox

--[[-------------------------------------------------------------------------
Gamemode-specific files
---------------------------------------------------------------------------]]
loadfile("player.lua")

loadfile("revive.lua")
loadfile("round.lua")
loadfile("points.lua")
loadfile("targeting.lua")
loadfile("weapons.lua")

loadfile("menu/menu.lua")
loadfile_c("menu/menu_customizeplayer.lua")

loadfile_s("nzombies-unlimited/core/entities_tools/spawnpoints_nzu.lua")