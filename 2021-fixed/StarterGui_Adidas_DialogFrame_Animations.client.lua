-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = game:GetService("Players");
local _ = game:GetService("ContentProvider");
local l_TweenService_0 = game:GetService("TweenService");
local _ = {};
tween = function(v4, v5, v6, v7) --[[ Line: 7 ]] --[[ Name: tween ]]
    -- upvalues: l_TweenService_0 (copy)
    task.spawn(function() --[[ Line: 8 ]]
        -- upvalues: l_TweenService_0 (ref), v4 (copy), v5 (copy), v7 (copy), v6 (copy)
        l_TweenService_0:Create(v4, TweenInfo.new(v5, v7 or Enum.EasingStyle.Back), v6):Play();
    end);
end;
task.wait(1);
local l_CollectionService_0 = game:GetService("CollectionService");
for _, v10 in ipairs(script.Parent:GetDescendants()) do
    local l_UIScale_0 = v10:FindFirstChild("UIScale");
    local v12 = v10:IsA("TextButton");
    if l_UIScale_0 and v12 and not l_CollectionService_0:HasTag(v10, "TeamButton") then
        if v10.MouseEnter then
            v10.MouseEnter:Connect(function() --[[ Line: 29 ]]
                -- upvalues: l_UIScale_0 (copy)
                tween(l_UIScale_0, 0.25, {
                    Scale = 1.2
                });
            end);
        end;
        if v10.MouseLeave then
            v10.MouseLeave:Connect(function() --[[ Line: 35 ]]
                -- upvalues: l_UIScale_0 (copy)
                tween(l_UIScale_0, 0.25, {
                    Scale = 1
                });
            end);
        end;
        if v10.MouseButton1Down then
            v10.MouseButton1Down:Connect(function() --[[ Line: 42 ]]
                -- upvalues: l_UIScale_0 (copy)
                tween(l_UIScale_0, 0.25, {
                    Scale = 1.4
                });
            end);
        end;
        if v10.MouseButton1Up then
            v10.MouseButton1Up:Connect(function() --[[ Line: 49 ]]
                -- upvalues: l_UIScale_0 (copy)
                tween(l_UIScale_0, 0.25, {
                    Scale = 1.2
                });
            end);
        end;
    end;
end;