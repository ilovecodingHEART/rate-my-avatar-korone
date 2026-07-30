-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = game:GetService("CollectionService");
local l_Lighting_0 = game:GetService("Lighting");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_AnimationManager_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("AnimationManager"));
local l_Util_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Util"));
local l_Animations_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Animations"));
local _ = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("types.d"));
local v7 = {
    _character = nil, 
    _animManager = l_AnimationManager_0.new()
};
local function v17(v8) --[[ Line: 29 ]] --[[ Name: cloneCharacter ]]
    local v9 = {};
    local function _(v10) --[[ Line: 32 ]] --[[ Name: saveAndSet ]]
        -- upvalues: v9 (copy)
        v9[v10] = v10.Archivable;
        v10.Archivable = true;
    end;
    v9[v8] = v8.Archivable;
    v8.Archivable = true;
    for _, v13 in ipairs(v8:GetDescendants()) do
        v9[v13] = v13.Archivable;
        v13.Archivable = true;
    end;
    local v14 = v8:Clone();
    for v15, v16 in pairs(v9) do
        if v15 and v15.Parent then
            v15.Archivable = v16;
        end;
    end;
    return v14;
end;
v7.Init = function(_) --[[ Line: 55 ]] --[[ Name: Init ]]

end;
v7.Setup = function(v19) --[[ Line: 58 ]] --[[ Name: Setup ]]
    -- upvalues: l_LocalPlayer_0 (copy), v17 (copy)
    local v20 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
    local v21 = v17(v20);
    v21.Parent = game.Lighting;
    v19._character = v21;
end;
v7.StartPenalty = function(v22, v23) --[[ Line: 65 ]] --[[ Name: StartPenalty ]]
    -- upvalues: l_Util_0 (copy), l_Animations_0 (copy)
    v22._character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    v22:TeleportCharacter(v23);
    local _, v25 = l_Util_0.getAnimatorFromModel(v22._character);
    if v25 then
        v22._animManager:SetAnimator(v25);
    end;
    v22._animManager:SetAnimation(l_Animations_0.PlayerIdle, false);
    v22._animManager:Play();
    v22._animManager.OnNonLoopFinished = function() --[[ Line: 79 ]]
        -- upvalues: v22 (copy), l_Animations_0 (ref)
        v22._animManager:SetAnimation(l_Animations_0.PlayerIdle, true);
        v22._animManager:Play();
    end;
    v22._character.Parent = workspace;
end;
v7.EndPenalty = function(v26) --[[ Line: 87 ]] --[[ Name: EndPenalty ]]
    -- upvalues: l_Lighting_0 (copy)
    v26._character.Parent = l_Lighting_0;
end;
v7.Shoot = function(v27) --[[ Line: 91 ]] --[[ Name: Shoot ]]
    -- upvalues: l_Animations_0 (copy)
    v27._animManager:SetAnimation(l_Animations_0.PlayerKick, false);
    v27._animManager:Play();
    game.SoundService.SFX.Kick:Play();
end;
v7.TeleportCharacter = function(v28, v29) --[[ Line: 97 ]] --[[ Name: TeleportCharacter ]]
    local l__character_0 = v28._character;
    if not l__character_0 then
        return;
    else
        l__character_0:PivotTo(v29 * CFrame.Angles(0, -0.7853981633974483, 0) - v29.LookVector * 2 - v29.RightVector * 2);
        return;
    end;
end;
return v7;