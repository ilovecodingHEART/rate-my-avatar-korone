-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
local function _(v1, v2) --[[ Line: 3 ]] --[[ Name: extractValue ]]
    if type(v1) == "function" then
        return v1(v2);
    else
        return v1;
    end;
end;
return function(v4) --[[ Line: 14 ]] --[[ Name: createUseState ]]
    -- upvalues: v0 (copy)
    local v5 = {};
    return function(v6) --[[ Line: 17 ]]
        -- upvalues: v4 (copy), v0 (ref), v5 (copy)
        local l_v4_0 = v4;
        l_v4_0.hookCounter = l_v4_0.hookCounter + 1;
        l_v4_0 = v4.hookCounter;
        local v8 = v4.state[l_v4_0];
        if v8 == nil then
            local v9 = v4.defaultStateValues[l_v4_0];
            if v9 == v0 then
                v8 = nil;
            elseif v9 ~= nil then
                v8 = v9;
            elseif type(v6) == "function" then
                v8 = v6();
                if v8 == nil then
                    v4.defaultStateValues[l_v4_0] = v0;
                else
                    v4.defaultStateValues[l_v4_0] = v8;
                end;
            else
                v8 = v6;
                v4.defaultStateValues[l_v4_0] = v8;
            end;
        elseif v8 == v0 then
            v8 = nil;
        end;
        local v10 = v5[l_v4_0];
        if v10 == nil then
            v10 = function(v11) --[[ Line: 46 ]]
                -- upvalues: v4 (ref), l_v4_0 (copy), v0 (ref)
                local v12 = v4.state[l_v4_0];
                if v12 == nil then
                    v12 = v4.defaultStateValues[l_v4_0];
                end;
                if v12 == v0 then
                    v12 = nil;
                end;
                local l_v11_0 = v11;
                local l_v12_0 = v12;
                v11 = if type(l_v11_0) == "function" then l_v11_0(l_v12_0) else l_v11_0;
                if v11 == nil then
                    v11 = v0;
                end;
                v4:setState({
                    [l_v4_0] = v11
                });
            end;
            v5[l_v4_0] = v10;
        end;
        return v8, v10;
    end;
end;