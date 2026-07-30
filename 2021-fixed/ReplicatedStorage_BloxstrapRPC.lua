-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_round
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no math.round on this client; rounds half away from zero, like the real one
local function __2021_round(vn)
	return vn >= 0 and math.floor(vn + 0.5) or math.ceil(vn - 0.5)
end

local l_HttpService_0 = game:GetService("HttpService");
local v4 = {
    SendMessage = function(v1, v2) --[[ Line: 28 ]] --[[ Name: SendMessage ]]
        local _ = l_HttpService_0:JSONEncode({
            command = v1, 
            data = v2
        });
    end
};
v4.SetRichPresence = function(v5) --[[ Line: 38 ]] --[[ Name: SetRichPresence ]]
    if v5.timeStart ~= nil then
        v5.timeStart = __2021_round(v5.timeStart);
    end;
    if v5.timeEnd ~= nil then
        v5.timeEnd = __2021_round(v5.timeEnd);
    end;
    v4.SendMessage("SetRichPresence", v5);
end;
return v4;