local Seat = script.Parent --Lines 1-6 set variables
local PlaneTool = Seat.Plane
local PlaneMain = Seat.Parent.Parent
local Crashed = PlaneMain.Crashed
local Origin = PlaneMain.Origin
local Debris = game:GetService("Debris")
function GivePlaneTool(Child) --This function puts the tool in the player by using the "SeatWeld"
	if Child.Name == "SeatWeld" then
		Player = game.Players:GetPlayerFromCharacter(Child.Part1.Parent) --This gets the Player
		if Player then
			PlaneMain.Parent = Player.Character --This makes the plane a part of the Player's Character
			Plane = PlaneTool:clone()
			Plane.Parent = Player.Backpack
			Plane.Main.Disabled = false --This undisables the Main script in the Tool, but the tool also has a fail safe
		end
	end
end
function RemovePlaneTool() --This function removes the tool
	if Plane ~= nil then
		if Plane.ToolSelect.Value == true then --If you didn't deselect the tool before you got off the plane...
			Plane.Deselect0.Value = true --This makes the Deselect0 value on the plane tool true, which forces deselection
			wait(0.01) --This allows the plane to activate its "onDeselectForced" function
			Plane:remove()
			if Player.Character.Humanoid.Health <= 0 then --If the Player dies...
				PlaneMain:BreakJoints() --These 3 lines break the plane and remove it after 5 seconds
				Crashed.Value = true
				coroutine.resume(coroutine.create(function()
					wait(5)
					PlaneMain:Destroy()
				end))
			elseif Player.Character.Humanoid.Health > 0 then --If you just jump out of the seat without deselecting the tool...
				PlaneMain.Parent = Origin.Value --This puts the plane back into the Planekit folder
			end
		elseif Plane.ToolSelect.Value == false then --If you deselect the tool before you get ooff the plane...
			Plane:remove() --This removes the plane tool
			if Player.Character.Humanoid.Health <= 0 then
				PlaneMain:BreakJoints()
				Crashed.Value = true
				coroutine.resume(coroutine.create(function()
					wait(5)
					PlaneMain:Destroy()
				end))
			elseif Player.Character.Humanoid.Health > 0 then
				PlaneMain.Parent = Origin.Value
			end
		end
	end
end
Seat.ChildAdded:connect(GivePlaneTool) --This activates the "GivePlaneTool" function when you sit on the seat
Seat.ChildRemoved:connect(RemovePlaneTool) --This activates the "RemovePlaneTool" function when you get off the seat