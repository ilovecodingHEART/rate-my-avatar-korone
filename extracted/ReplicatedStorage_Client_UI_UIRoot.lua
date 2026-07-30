-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Roact_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Roact"));
local l_RoactHooks_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("RoactHooks"));
local _ = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Charm"));
local l_Players_0 = game:GetService("Players");
local l_useAtom_0 = require(script.Parent:WaitForChild("Hooks"):WaitForChild("useAtom"));
local l_createElement_0 = l_Roact_0.createElement;
local v6 = l_RoactHooks_0.new(l_Roact_0);
local l_GameplayController_0 = require(script.Parent.Parent:WaitForChild("Controllers"):WaitForChild("GameplayController"));
local l_Group_0 = require(script.Parent:WaitForChild("Components"):WaitForChild("Group"));
local l_PenaltyMiniGame_0 = require(script.Parent:WaitForChild("Components"):WaitForChild("PenaltyMiniGame"));
local l_GameplayStatus_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Client"):WaitForChild("atoms")).GameplayStatus;
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_atoms_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("atoms"));
local l_Util_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Util"));
local _ = function(_, v15) --[[ Line: 24 ]] --[[ Name: Button ]]
    -- upvalues: l_useAtom_0 (copy), l_GameplayStatus_0 (copy), l_createElement_0 (copy), l_Roact_0 (copy), l_GameplayController_0 (copy)
    local v16 = l_useAtom_0(v15, l_GameplayStatus_0);
    return l_createElement_0("TextButton", {
        Size = UDim2.fromOffset(100, 100), 
        Text = v16 == "nothing" and "start" or "end", 
        [l_Roact_0.Event.Activated] = function() --[[ Line: 30 ]]
            -- upvalues: v16 (copy), l_GameplayController_0 (ref)
            if v16 == "nothing" then
                l_GameplayController_0:StartPenalty();
                return;
            else
                l_GameplayController_0:EndPenalty();
                return;
            end;
        end
    });
end;
local _ = function(_, v19) --[[ Line: 37 ]] --[[ Name: Leaderboard ]]
    -- upvalues: l_useAtom_0 (copy), l_atoms_0 (copy), l_Players_0 (copy), l_Util_0 (copy), l_createElement_0 (copy), l_Roact_0 (copy)
    local v20 = l_useAtom_0(v19, l_atoms_0.goals);
    local v21 = {};
    for _, v23 in l_Players_0:GetPlayers() do
        if (l_atoms_0["players/datastore"]()[v23.Name] or {}).team then
            local v24 = l_Util_0.name(v23) .. l_atoms_0["players/datastore"]()[v23.Name].team;
            v21[v23.Name] = l_createElement_0("TextLabel", {
                Size = UDim2.fromOffset(200, 10), 
                Text = v24 .. ": " .. (v20[v23.Name] or 0)
            });
        end;
    end;
    return l_createElement_0("Frame", {
        Size = UDim2.fromOffset(200, 100), 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1)
    }, {
        list = l_createElement_0("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        listChildren = l_Roact_0.createFragment(v21)
    });
end;
return v6(function(_, v27) --[[ Line: 67 ]] --[[ Name: App ]]
    -- upvalues: l_useAtom_0 (copy), l_GameplayStatus_0 (copy), l_atoms_0 (copy), l_LocalPlayer_0 (copy), l_createElement_0 (copy), l_Group_0 (copy), l_PenaltyMiniGame_0 (copy)
    local v28 = l_useAtom_0(v27, l_GameplayStatus_0);
    local v29 = l_useAtom_0(v27, l_atoms_0["players/datastore"])[l_LocalPlayer_0.Name];
    return l_createElement_0(l_Group_0, {}, {
        Group = if v29 then l_createElement_0(l_Group_0, {}, {
            PenaltyMiniGame = if v28 ~= "nothing" then l_createElement_0(l_PenaltyMiniGame_0) else nil
        }) else nil
    });
end);