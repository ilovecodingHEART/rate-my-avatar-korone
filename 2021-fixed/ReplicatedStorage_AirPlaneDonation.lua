-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("TweenService");
local l_Assets_0 = script:WaitForChild("Assets");
local l_Bezier_0 = require(script:WaitForChild("Bezier"));
local l_Folder_0 = Instance.new("Folder");
l_Folder_0.Name = "AirPlaneDonos";
l_Folder_0.Parent = workspace;
local _ = workspace.CurrentCamera;
local v7 = Random.new();
local function _(v8) --[[ Line: 19 ]] --[[ Name: AddCommas ]]
    return tostring(v8):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "");
end;
local _ = function(v10) --[[ Line: 23 ]] --[[ Name: Emit ]]
    for _, v12 in pairs(v10:GetDescendants()) do
        if v12:IsA("ParticleEmitter") then
            v12:Emit(v12:GetAttribute("EmitCount"));
        end;
    end;
end;
return {
    Fly = function(_, v15, v16, v17) --[[ Line: 33 ]] --[[ Name: Fly ]]
        -- upvalues: l_Players_0 (copy), v7 (copy), l_Bezier_0 (copy), l_Assets_0 (copy), l_Folder_0 (copy), l_RunService_0 (copy)
        print(v15, v16, v17);
        local l_l_Players_0_UserThumbnailAsync_0 = l_Players_0:GetUserThumbnailAsync(v15, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180);
        local l_l_Players_0_UserThumbnailAsync_1 = l_Players_0:GetUserThumbnailAsync(v16, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180);
        if l_l_Players_0_UserThumbnailAsync_0 and l_l_Players_0_UserThumbnailAsync_1 then
            local l_l_Players_0_NameFromUserIdAsync_0 = l_Players_0:GetNameFromUserIdAsync(v15);
            local l_l_Players_0_NameFromUserIdAsync_1 = l_Players_0:GetNameFromUserIdAsync(v16);
            if l_l_Players_0_NameFromUserIdAsync_0 and l_l_Players_0_NameFromUserIdAsync_1 then
                local v22 = workspace:FindFirstChild("Map"):WaitForChild("MapPositions").PrimaryPart.Core.WorldCFrame * CFrame.new(0, 300, 0) * CFrame.Angles(0, math.rad((v7:NextNumber(-360, 360))), 0);
                local v23 = v22 * CFrame.new(0, 0, -350);
                local v24 = v22 * CFrame.new(0, 0, 350);
                local v25 = l_Bezier_0.new(v23.Position, (v22 * CFrame.new(0, -450, 0)).Position, v24.Position);
                local v26 = l_Assets_0:WaitForChild("Biplane"):Clone();
                v26.Parent = l_Folder_0;
                v26:PivotTo(v23);
                v26.Flag.Left.Base.Profile1.Title.Text = "@" .. l_l_Players_0_NameFromUserIdAsync_0;
                v26.Flag.Right.Base.Profile1.Title.Text = "@" .. l_l_Players_0_NameFromUserIdAsync_0;
                v26.Flag.Left.Base.Profile2.Title.Text = "@" .. l_l_Players_0_NameFromUserIdAsync_1;
                v26.Flag.Right.Base.Profile2.Title.Text = "@" .. l_l_Players_0_NameFromUserIdAsync_1;
                v26.Flag.Left.Base.Profile1.Profile.Image = l_l_Players_0_UserThumbnailAsync_0;
                v26.Flag.Right.Base.Profile1.Profile.Image = l_l_Players_0_UserThumbnailAsync_0;
                v26.Flag.Left.Base.Profile2.Profile.Image = l_l_Players_0_UserThumbnailAsync_1;
                v26.Flag.Right.Base.Profile2.Profile.Image = l_l_Players_0_UserThumbnailAsync_1;
                local v27 = tostring(v17):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "");
                v26.Flag.Left.Base.Title.Text = v27;
                v26.Flag.Right.Base.Title.Text = v27;
                local l_v25_CFrameTween_0 = v25:CreateCFrameTween(v26.PrimaryPart, {
                    "CFrame"
                }, TweenInfo.new(35, Enum.EasingStyle.Linear, Enum.EasingDirection.Out));
                l_v25_CFrameTween_0:Play();
                local v30 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 82 ]]
                    -- upvalues: v26 (copy)
                    local l_Propeller_0 = v26.PrimaryPart.Propeller;
                    l_Propeller_0.C0 = l_Propeller_0.C0 * CFrame.Angles(0, 0, 0.17453292519943295);
                end);
                l_v25_CFrameTween_0.Completed:Once(function() --[[ Line: 91 ]]
                    -- upvalues: v30 (copy), l_v25_CFrameTween_0 (copy), v26 (copy)
                    v30:Disconnect();
                    l_v25_CFrameTween_0:Destroy();
                    v26:Destroy();
                    v30:Disconnect();
                end);
                return;
            else
                return;
            end;
        else
            return;
        end;
    end
};