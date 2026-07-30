-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
--[[
	The Enabler is a script that enables the Main script once it gets put into the Player's backpack. This script is needed
	because Roblox updates prevented the Tool from being enabled the first time the plane tool was selected.
]]
local Main = script.Parent.Main
repeat wait() until game.Players.LocalPlayer
if Main.Disabled then
	Main.Disabled = false
end