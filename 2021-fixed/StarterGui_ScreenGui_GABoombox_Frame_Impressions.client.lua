-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("Players").LocalPlayer;
local l_AnalyticsEvent_0 = l_ReplicatedStorage_0:WaitForChild("AnalyticsEvent");
local l_GlassAnimals_0 = workspace.GlassAnimals;
local v4 = false;
local v5 = false;
local function v9() --[[ Line: 15 ]] --[[ Name: checkAdVisibility ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local _, v8 = l_CurrentCamera_0:WorldToScreenPoint((Vector3.new(134.63099670410156, 18.93899917602539, 133.93899536132812, 0)));
    if v8 then
        if #l_CurrentCamera_0:GetPartsObscuringTarget({
            l_CurrentCamera_0.CFrame.Position, 
            (Vector3.new(134.63099670410156, 18.93899917602539, 133.93899536132812, 0))
        }, {
            l_GlassAnimals_0
        }) == 0 then
            if not v4 and not v5 then
                l_AnalyticsEvent_0:FireServer("impression");
                v5 = true;
            end;
        else
            v5 = false;
        end;
    else
        v5 = false;
    end;
    v4 = v8;
end;
while true do
    v9();
    task.wait(0.5);
end;