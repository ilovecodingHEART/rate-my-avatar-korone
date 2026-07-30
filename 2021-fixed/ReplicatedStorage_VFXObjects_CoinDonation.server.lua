-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_round
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no math.round on this client; rounds half away from zero, like the real one
local function __2021_round(vn)
	return vn >= 0 and math.floor(vn + 0.5) or math.ceil(vn - 0.5)
end
local l_wait_0 = task.wait;
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local function _(v3, v4, v5) --[[ Line: 9 ]] --[[ Name: Tween ]]
    l_TweenService_0:Create(v3, v4, v5):Play();
end;
local l_Parent_0 = script.Parent;
l_Parent_0.CreateVfx.OnClientEvent:Connect(function(v8, ...) --[[ Line: 21 ]] --[[ Name: SpawnVFX ]]
    local v9 = {
        ...
    };
    if v8 == "GiveCurrency" or v8 == "GiveGiftbux" then
        local v10 = -1;
        local v11 = 1;
        local v12 = 1;
        if v8 == "GiveCurrency" then
			if v9[3] >= 10000 then
				v11 = 600;
				v12 = 0.05;
			elseif v9[3] >= 1000 then
				v11 = 600;
				v12 = 0.05;
			elseif v9[3] >= 100 then
				v11 = 300;
				v12 = 0.1;
				
			elseif v9[3] >= 10 then
				v11 = 75;
				v12 = 0.15;
			else
				v11 = 20;
				v12 = 0.25;
			end;
        end;
        if v8 == "GiveGiftbux" then
            v11 = math.clamp(__2021_round(v9[3] / 10 + 0.5) + 1, 0, 50);
            v12 = (v11 / 10 + 0.25) / v11;
        end;
        print((__2021_round(v11)));
        do
            local l_v10_0 = v10;
            for _ = 1, v11 + 1 do
                local l_Attachment_0 = Instance.new("Attachment");
                l_Attachment_0.Name = "CurrencyPositionGoal";
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 72 ]]
                    l_Attachment_0.Parent = v9[2].HumanoidRootPart;
                end);
                if l_status_0 == false then
                    warn("Unable to find Humanoid (" .. l_result_0 .. ")");
                end;
                local v18 = nil;
                if v8 == "GiveCurrency" then
                    v18 = l_Parent_0.CurrencyCoin:Clone();
                end;
                if v8 == "GiveGiftbux" then
                    v18 = l_Parent_0.GiftbuxCoin:Clone();
                end;
                v18.Anchored = true;
                v18.Position = v9[1];
                local v19 = Vector3.new(0, math.random(50, 100) / 10, 0);
                do
                    local l_v18_0 = v18;
                    local v23 = l_RunService_0.RenderStepped:Connect(function(v21) --[[ Line: 91 ]]
                        local l_l_v18_0_0 = l_v18_0;
                        l_l_v18_0_0.Orientation = l_l_v18_0_0.Orientation + v19 * (v21 * 100);
                    end);
                    local l_Size_0 = l_v18_0.Size;
                    local v25 = Vector3.new(0, 0, 0, 0);
                    l_v18_0.Size = v25;
                    l_v18_0.Parent = workspace;
                    v25 = l_v18_0;
                    local v26 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
                    local v27 = {
                        Size = l_Size_0, 
                        Position = l_v18_0.Position + Vector3.new(math.random(-10, 10), math.random(10, 20), math.random(-10, 10))
                    };
                    l_TweenService_0:Create(v25, v26, v27):Play();
                    v25 = l_v18_0.Center.Glow;
                    v26 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
                    v27 = {
                        Brightness = 0.5
                    };
                    l_TweenService_0:Create(v25, v26, v27):Play();
                    v25 = false;
                    v26 = function() --[[ Line: 111 ]] --[[ Name: Collect ]]
                        if v25 == false then
                            v25 = true;
                            v23:Disconnect();
                            if l_Attachment_0:IsDescendantOf(game) then
                                l_v18_0.Position = l_Attachment_0.WorldPosition + Vector3.new(math.random(-2, 2), math.random(-2, 2), math.random(-2, 2));
                                l_v18_0.Transparency = 1;
                                l_v18_0.Size = Vector3.new(0, 0, 0, 0);
                                for _, v29 in pairs(l_v18_0:GetChildren()) do
                                    if v29:IsA("SurfaceGui") then
                                        v29.Enabled = false;
                                    end;
                                end;
                                l_v18_0.Anchored = true;
                                l_v18_0.Center.Glow.Brightness = 1;
                                l_v18_0.Center.Glow.Range = 7.5;
                                local l_Glow_0 = l_v18_0.Center.Glow;
                                local v31 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
                                local v32 = {
                                    Brightness = 0, 
                                    Range = 5
                                };
                                l_TweenService_0:Create(l_Glow_0, v31, v32):Play();
                                for _, v34 in pairs(l_v18_0.Center:GetChildren()) do
                                    if v34:IsA("ParticleEmitter") then
                                        v34:Emit(v34:GetAttribute("EmitCount"));
                                    end;
                                end;
                                l_v18_0.Collect.PlaybackSpeed = l_v10_0 + 2;
                                l_v10_0 = l_v10_0 * 0.99;
                                l_v18_0.Collect:Play();
                                l_wait_0(3);
                                l_v18_0:Destroy();
                                l_Attachment_0:Destroy();
                                return;
                            else
                                l_v18_0.Trail.Enabled = false;
                                l_v18_0.AlignPosition.MaxVelocity = 0;
                                l_v18_0.AlignPosition.Responsiveness = 200;
                                l_v18_0.AlignPosition.Mode = Enum.PositionAlignmentMode.OneAttachment;
                                l_v18_0.AlignPosition.Attachment0 = l_v18_0.Center;
                                l_v18_0.AlignPosition.Position = l_v18_0.Position;
                                local l_Glow_1 = l_v18_0.Center.Glow;
                                local v36 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
                                local v37 = {
                                    Brightness = 0, 
                                    Range = 5
                                };
                                l_TweenService_0:Create(l_Glow_1, v36, v37):Play();
                                l_Glow_1 = l_v18_0;
                                v36 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
                                v37 = {
                                    Size = Vector3.new(0, 0, 0, 0)
                                };
                                l_TweenService_0:Create(l_Glow_1, v36, v37):Play();
                                l_wait_0(0.5);
                                l_v18_0:Destroy();
                                l_Attachment_0:Destroy();
                            end;
                        end;
                    end;
                    v27 = nil;
                    local v38 = 0;
                    local function v40(v39) --[[ Line: 166 ]] --[[ Name: CheckRange ]]
                        if l_Attachment_0:IsDescendantOf(game) == false then
                            v27:Disconnect();
                            v26();
                            return;
                        elseif (l_v18_0.Center.WorldPosition - l_Attachment_0.WorldPosition).Magnitude < 2.5 then
                            v27:Disconnect();
                            v26();
                            return;
                        else
                            l_v18_0.Position = l_v18_0.Position:Lerp(l_Attachment_0.WorldPosition, v38);
                            v38 = v38 + 0.05 * (v39 * 1);
                            v38 = math.clamp(v38, 0, 1);
                            return;
                        end;
                    end;
                    spawn(function() --[[ Line: 183 ]]
                        l_wait_0(1);
                        v27 = l_RunService_0.Heartbeat:Connect(v40);
                        l_v18_0.Trail.Enabled = true;
                        l_wait_0(10);
                        if v25 == false then
                            l_Attachment_0:Destroy();
                        end;
                    end);
                    l_wait_0(v12);
                end;
            end;
        end;
    end;
end);