-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_StarterGui_0 = game:GetService("StarterGui");
local v1 = false;
local v2 = {};
v2.setCameraModeToastEnabled = function(v3) --[[ Line: 10 ]] --[[ Name: setCameraModeToastEnabled ]]
    if not v3 and not v1 then
        return;
    else
        if not v1 then
            v1 = true;
        end;
        if not v3 then
            v2.setCameraModeToastOpen(false);
        end;
        return;
    end;
end;
v2.setCameraModeToastOpen = function(v4) --[[ Line: 24 ]] --[[ Name: setCameraModeToastOpen ]]
    assert(v1);
    if v4 then
        l_StarterGui_0:SetCore("SendNotification", {
            Title = "Camera Control Enabled", 
            Text = "Right click to toggle", 
            Duration = 3
        });
    end;
end;
return v2;