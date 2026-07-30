
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
        v5.timeStart = math.round(v5.timeStart);
    end;
    if v5.timeEnd ~= nil then
        v5.timeEnd = math.round(v5.timeEnd);
    end;
    v4.SendMessage("SetRichPresence", v5);
end;
return v4;