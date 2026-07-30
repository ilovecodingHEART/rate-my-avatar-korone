-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x4, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_round
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no math.round on this client; rounds half away from zero, like the real one
local function __2021_round(vn)
	return vn >= 0 and math.floor(vn + 0.5) or math.ceil(vn - 0.5)
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_ReplicatedStorage_0.Remotes).Event("HypeTrainStatus");
local v5 = require(script.Iris).Init();
local l_IntValue_0 = Instance.new("IntValue");
local v7 = 0;
local v8 = {
    goal = 0, 
    expiration = 0, 
    now = 0
};
local v9 = nil;
local v10 = false;
v4.OnClientEvent:Connect(function(v11) --[[ Line: 21 ]]
    -- upvalues: v8 (ref), v7 (ref), v9 (ref), v10 (ref), l_IntValue_0 (copy), l_TweenService_0 (copy)
    v8 = v11;
    v7 = v8.now;
    if v9 then
        v9:Cancel();
    end;
    if v10 then
        l_IntValue_0.Value = 0;
        v10 = false;
    end;
    if l_IntValue_0.Value > v8.value then
        v9 = l_TweenService_0:Create(l_IntValue_0, TweenInfo.new(1, Enum.EasingStyle.Linear), {
            Value = v8.goal
        });
        v10 = true;
        print("Leveled up");
    else
        v9 = l_TweenService_0:Create(l_IntValue_0, TweenInfo.new(2, Enum.EasingStyle.Linear), {
            Value = v8.value
        });
    end;
    v9:Play();
end);
l_RunService_0.Heartbeat:Connect(function(v12) --[[ Line: 41 ]]
    -- upvalues: v7 (ref)
    v7 = v7 + v12 * 1000;
end);
local v13 = v5.State(0);
local function v15() --[[ Line: 47 ]] --[[ Name: HypeTrainUI ]]
    -- upvalues: v8 (ref), v7 (ref), v5 (copy), l_IntValue_0 (copy), v13 (copy)
    local v14 = v8.expiration - v7;
    v5.Window("Hype Train");
    v5.Text({
        (("Level: %s"):format(v8.level))
    });
    v5.Text({
        (("Value: %s"):format(l_IntValue_0.Value))
    });
    v5.Text({
        (("Goal: %s"):format(v8.goal))
    });
    v5.Text({
        (("Expires: %s seconds"):format(__2021_round(v14 / 100) / 10))
    });
    v13:set(l_IntValue_0.Value / v8.goal);
    v5.ProgressBar({
        "Progress"
    }, {
        progress = v13
    });
    v5.End();
end;
if l_Players_0.LocalPlayer.UserId == 20405051 or l_Players_0.LocalPlayer.UserId == 151848836 then
    v5:Connect(v15);
end;