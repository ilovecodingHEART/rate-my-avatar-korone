-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_CollectionService_0 = game:GetService("CollectionService");
local l_Players_0 = game:GetService("Players");
local l_BallController_0 = require(script.Parent:WaitForChild("BallController"));
local l_CharacterController_0 = require(script.Parent:WaitForChild("CharacterController"));
local l_GoalieController_0 = require(script.Parent:WaitForChild("GoalieController"));
local l_atoms_0 = require(script.Parent.Parent:WaitForChild("atoms"));
local l_remotes_0 = require(script.Parent.Parent:WaitForChild("remotes"));
local l_Util_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Util"));
local l_Animations_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Animations"));
local l_atoms_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("atoms"));
local v10 = {};
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_Players_1 = game:GetService("Players");
local v14 = {};
local function v22(v15, v16) --[[ Line: 24 ]] --[[ Name: setCharacterVisible ]]
    -- upvalues: v14 (copy)
    v14[v15] = v14[v15] or {};
    for _, v18 in ipairs(v15:GetDescendants()) do
        if v18.Name ~= "HumanoidRootPart" then
            if v18:IsA("BasePart") then
                if not v16 then
                    if not v14[v15][v18] then
                        v14[v15][v18] = {
                            Transparency = v18.Transparency, 
                            CanCollide = v18.CanCollide
                        };
                    end;
                    v18.Transparency = 1;
                    v18.CanCollide = false;
                else
                    local v19 = v14[v15][v18];
                    if v19 then
                        v18.Transparency = v19.Transparency;
                        v18.CanCollide = v19.CanCollide;
                    end;
                end;
            elseif v18:IsA("Decal") then
                if not v16 then
                    if not v14[v15][v18] then
                        v14[v15][v18] = {
                            Transparency = v18.Transparency
                        };
                    end;
                    v18.Transparency = 1;
                else
                    local v20 = v14[v15][v18];
                    if v20 then
                        v18.Transparency = v20.Transparency;
                    end;
                end;
            elseif v18:IsA("BillboardGui") then
                if not v16 then
                    if not v14[v15][v18] then
                        v14[v15][v18] = {
                            Enabled = v18.Enabled
                        };
                    end;
                    v18.Enabled = false;
                else
                    local v21 = v14[v15][v18];
                    if v21 then
                        v18.Enabled = v21.Enabled;
                    end;
                end;
            end;
        end;
    end;
    if v16 then
        v14[v15] = nil;
    end;
end;
HideAllPlayers = function() --[[ Line: 88 ]] --[[ Name: HideAllPlayers ]]
    -- upvalues: l_Players_1 (copy), v22 (copy)
    for _, v24 in ipairs(l_Players_1:GetPlayers()) do
        if v24.Character then
            v22(v24.Character, false);
        end;
    end;
end;
ShowAllPlayers = function() --[[ Line: 96 ]] --[[ Name: ShowAllPlayers ]]
    -- upvalues: l_Players_1 (copy), v22 (copy)
    for _, v26 in ipairs(l_Players_1:GetPlayers()) do
        if v26.Character then
            v22(v26.Character, true);
        end;
    end;
end;
v10.Init = function(_) --[[ Line: 105 ]] --[[ Name: Init ]]
    -- upvalues: l_Animations_0 (copy), l_remotes_0 (copy), v10 (copy)
    local l_ContentProvider_0 = game:GetService("ContentProvider");
    local function v32(v29, v30) --[[ Line: 108 ]] --[[ Name: PreloadFullAnimation ]]
        -- upvalues: l_ContentProvider_0 (copy)
        local l_Animation_0 = Instance.new("Animation");
        l_Animation_0.AnimationId = "rbxassetid://" .. v30;
        l_ContentProvider_0:PreloadAsync({
            l_Animation_0
        });
        return (v29:LoadAnimation(l_Animation_0));
    end;
    local l_Animator_0 = Instance.new("Animator");
    for _, v35 in pairs(l_Animations_0) do
        v32(l_Animator_0, v35):Play();
    end;
    l_remotes_0.StartPenaltyClient.On(function() --[[ Line: 121 ]]
        -- upvalues: v10 (ref)
        v10:RestartPenalty();
    end);
end;
v10.SetupLocal = function(_) --[[ Line: 126 ]] --[[ Name: SetupLocal ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_atoms_0 (copy), l_CollectionService_0 (copy), l_CurrentCamera_0 (copy), l_CharacterController_0 (copy), l_BallController_0 (copy), l_GoalieController_0 (copy), l_Util_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if not l_Character_0 or not l_Character_0:FindFirstChild("Humanoid") then
        return;
    elseif l_atoms_0.GameplayStatus() ~= "penalty" then
        return;
    else
        local v38 = l_CollectionService_0:GetTagged("PenaltySpawn")[1];
        local v39 = l_CollectionService_0:GetTagged("PenaltyGoal")[1];
        local v40 = l_CollectionService_0:GetTagged("GoalkeeperSpawn")[1];
        if not v38 or not v39 or not v40 then
            return;
        else
            local l_Humanoid_0 = l_Character_0.Humanoid;
            v39.CanQuery = true;
            l_CurrentCamera_0.FieldOfView = 50;
            l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
            local v42 = math.max(5, (v40.Position - v38.Position).Magnitude + math.random(-5, 20));
            local v43 = 1.5707963267948966 + math.rad((math.random(-45, 45)));
            local v44 = v40.Position + Vector3.new(math.cos(v43), 0, (math.sin(v43))) * v42;
            local v45 = CFrame.lookAt(v44, v40.Position);
            l_CharacterController_0:StartPenalty(v45);
            local v46 = v45 * CFrame.new(0, 7, 20);
            l_CurrentCamera_0.CFrame = CFrame.lookAt(v46.Position, v40.Position);
            l_BallController_0:Freeze();
            l_BallController_0:SetCFrame(v45);
            l_BallController_0:Show();
            HideAllPlayers();
            l_GoalieController_0.PivotTo(v40.CFrame);
            l_GoalieController_0:DestroyBall();
            l_atoms_0.PenaltyStatus("location");
            l_Util_0.Freeze(l_Humanoid_0);
            l_Util_0.coreCall("SetCore", "ResetButtonCallback", false);
            return;
        end;
    end;
end;
v10.RestartPenalty = function(_) --[[ Line: 197 ]] --[[ Name: RestartPenalty ]]
    -- upvalues: l_atoms_0 (copy), v10 (copy)
    l_atoms_0.PenaltyStatus("nothing");
    v10:SetupLocal();
end;
v10.StartPenalty = function(_) --[[ Line: 203 ]] --[[ Name: StartPenalty ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_atoms_0 (copy), l_remotes_0 (copy), l_CharacterController_0 (copy), l_GoalieController_0 (copy), l_Animations_0 (copy), v10 (copy)
    if not l_LocalPlayer_0.Character or not l_LocalPlayer_0.Character:FindFirstChild("Humanoid") or not l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart") then
        return;
    elseif l_atoms_0.GameplayStatus() ~= "nothing" or l_atoms_0.PenaltyStatus() ~= "nothing" then
        return;
    else
        l_atoms_0.GameplayStatus("penalty");
        l_remotes_0.StartPenalty.Fire();
        l_CharacterController_0:Setup();
        l_GoalieController_0.Spawn();
        l_GoalieController_0.SetAnimation(l_Animations_0.Idle);
        v10:SetupLocal();
        return;
    end;
end;
v10.EndPenalty = function(_) --[[ Line: 223 ]] --[[ Name: EndPenalty ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_GoalieController_0 (copy), l_BallController_0 (copy), l_CurrentCamera_0 (copy), l_CharacterController_0 (copy), l_Util_0 (copy), l_atoms_0 (copy)
    if not l_LocalPlayer_0.Character or not l_LocalPlayer_0.Character:FindFirstChild("Humanoid") or not l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart") then
        return;
    else
        l_GoalieController_0.Despawn();
        l_BallController_0:Hide();
        l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
        l_CurrentCamera_0.FieldOfView = 70;
        l_CharacterController_0:EndPenalty();
        local l_Character_1 = l_LocalPlayer_0.Character;
        if not l_Character_1 or not l_Character_1:FindFirstChild("Humanoid") then
            return;
        else
            local l_Humanoid_1 = l_Character_1.Humanoid;
            l_Util_0.Unfreeze(l_Humanoid_1);
            ShowAllPlayers();
            l_Util_0.coreCall("SetCore", "ResetButtonCallback", true);
            l_atoms_0.GameplayStatus("nothing");
            l_atoms_0.PenaltyStatus("nothing");
            return;
        end;
    end;
end;
v10.Shoot = function(_, v53, v54) --[[ Line: 253 ]] --[[ Name: Shoot ]]
    -- upvalues: l_atoms_0 (copy), l_atoms_1 (copy), l_LocalPlayer_0 (copy), l_remotes_0 (copy), l_GoalieController_0 (copy), l_CharacterController_0 (copy), l_BallController_0 (copy)
    local v55 = l_atoms_0.penaltyShootLocation();
    local v56 = l_atoms_1["players/info"]()[l_LocalPlayer_0.Name];
    if not v56 then
        return;
    else
        local v57 = ({
            "Left", 
            "Middle", 
            "Right"
        })[math.random(1, 3)];
        local l_token_0 = v56.token;
        l_atoms_0.PenaltyStatus("nothing");
        local v59 = l_remotes_0.RecieveResult.Call(v53, v54, l_token_0);
        task.spawn(function() --[[ Line: 262 ]]
            -- upvalues: l_GoalieController_0 (ref), v59 (copy), v57 (copy), v55 (copy)
            l_GoalieController_0.HandleResult(v59, v57, v55);
        end);
        l_CharacterController_0:Shoot();
        task.wait(0.2);
        l_BallController_0:ShootBall();
        return;
    end;
end;
v10.StopAndCleanup = function(_) --[[ Line: 273 ]] --[[ Name: StopAndCleanup ]]
    -- upvalues: l_GoalieController_0 (copy)
    l_GoalieController_0.Destroy();
end;
return v10;