-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_CollectionService_0 = game:GetService("CollectionService");
return function(v1, v2) --[[ Line: 3 ]] --[[ Name: useTag ]]
    -- upvalues: l_CollectionService_0 (copy)
    local v3, v4 = v2.useState(l_CollectionService_0:GetTagged("PenaltyGoal"));
    v2.useEffect(function() --[[ Line: 6 ]]
        -- upvalues: v4 (copy), l_CollectionService_0 (ref), v1 (copy)
        local function v5() --[[ Line: 7 ]] --[[ Name: onTagChanged ]]
            -- upvalues: v4 (ref), l_CollectionService_0 (ref), v1 (ref)
            v4(l_CollectionService_0:GetTagged(v1));
        end;
        local v6 = l_CollectionService_0:GetInstanceAddedSignal(v1):Connect(v5);
        local v7 = l_CollectionService_0:GetInstanceRemovedSignal(v1):Connect(v5);
        return function() --[[ Line: 14 ]]
            -- upvalues: v6 (copy), v7 (copy)
            v6:Disconnect();
            v7:Disconnect();
        end;
    end, {});
    return v3;
end;