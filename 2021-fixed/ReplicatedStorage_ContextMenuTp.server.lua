-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x4, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local l_StarterGui_0 = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local l_BindableEvent_0 = Instance.new("BindableEvent");
local function v6(v3) --[[ Line: 6 ]] --[[ Name: findbooth ]]
    for _, v5 in workspace.BoothInteractions:GetChildren() do
        if v5:GetAttribute("BoothOwner") == v3.UserId then
            return v5.Position;
        end;
    end;
end;
local v7 = require(game.ReplicatedStorage.popup);
l_BindableEvent_0.Event:Connect(function(v8) --[[ Line: 16 ]]
    local v9 = v6(v8);
    if v9 then
        print((("Teleporting to %s's booth"):format(v8)));
        v7("info", (("teleported to %s's booth!"):format(v8.DisplayName)));
        l_Players_0.LocalPlayer.Character:MoveTo(v9);
        return;
    else
        print((("Couldn't find booth for %s"):format(v8.DisplayName)));
        v7("info", (("%s has no booth!"):format(v8.DisplayName)));
        return;
    end;
end);
l_StarterGui_0:SetCore("AddAvatarContextMenuOption", {
    "Teleport to booth", 
    l_BindableEvent_0
});