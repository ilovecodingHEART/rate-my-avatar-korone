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
        print((("Teleporting to %*'s booth"):format(v8)));
        v7("info", (("teleported to %*'s booth!"):format(v8.DisplayName)));
        l_Players_0.LocalPlayer.Character:MoveTo(v9);
        return;
    else
        print((("Couldn't find booth for %*"):format(v8.DisplayName)));
        v7("info", (("%* has no booth!"):format(v8.DisplayName)));
        return;
    end;
end);
l_StarterGui_0:SetCore("AddAvatarContextMenuOption", {
    "Teleport to booth", 
    l_BindableEvent_0
});