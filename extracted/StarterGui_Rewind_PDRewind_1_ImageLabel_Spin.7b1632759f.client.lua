-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TweenService_0 = game:GetService("TweenService");
local function _(v1, v2, v3, v4) --[[ Line: 3 ]] --[[ Name: tween ]]
    local v5 = TweenInfo.new(v2, v4 or Enum.EasingStyle.Linear);
    local v6 = l_TweenService_0:Create(v1, v5, v3);
    v6:Play();
    return v6;
end;
while true do
    local v8 = script.Parent.Rotation + 20;
    local l_Parent_0 = script.Parent;
    local v10 = {
        Rotation = v8
    };
    local v11 = l_TweenService_0:Create(l_Parent_0, TweenInfo.new(6, Enum.EasingStyle.Linear), v10);
    v11:Play();
    v11.Completed:Wait();
end;