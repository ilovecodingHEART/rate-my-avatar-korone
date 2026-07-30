
local v0 = {
    [5] = "K", 
    [6] = "M", 
	[9] = "B",
	[12] = "T",
	[15] = "Q",
	[18] = "Qn",
	[21] = "Sx"
};
local v5 = {
    randomDigits = function(v1) --[[ Line: 41 ]] --[[ Name: randomDigits ]]
        local v2 = "";
        for _ = 1, v1 do
            v2 = v2 .. math.random(0, 9);
        end;
        return (tonumber(v2));
    end, 
    formatCommas = function(v4) --[[ Line: 49 ]] --[[ Name: formatCommas ]]
        return tostring(v4):reverse():gsub("%d%d%d", "%1,"):gsub(",$", ""):reverse();
    end
};
v5.format = function(v6) --[[ Line: 53 ]] --[[ Name: format ]]
    local v7 = math.floor((math.log10(v6)));
    local v8 = v7 % 3;
    local v9 = v0[v7 - v8];
    if v9 then
        local v10 = v6 / 10 ^ (v7 - v8);
        local v11 = nil;
        if v8 == 0 then
            v11 = string.format("%.2f", v10);
        elseif v8 == 1 then
            v11 = string.format("%.1f", v10);
        elseif v8 == 2 then
            v11 = string.format("%.0f", v10);
        end;
        return tostring((tonumber(v11))) .. v9;
    else
        return v5.formatCommas(v6);
    end;
end;
return v5;