-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.Parent.Parent.Packages.Cryo);
local v1 = require(script.Parent.Parent.Parent.Packages.t);
return function(v2, v3, v4) --[[ Line: 4 ]]
    local v5 = {};
    local v6 = v1.tuple(v1.string, v1.table, v1.callback);
    v5.new = function(v7, v8, v9) --[[ Line: 9 ]] --[[ Name: new ]]
        assert(v6(v7, v8, v9));
        v8 = v0.Dictionary.join(v8, {});
        assert(v9(v8));
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        local v11 = {
            name = v7, 
            initialValues = v8, 
            values = v8, 
            validate = v9, 
            changed = l_BindableEvent_0.Event
        };
        v11.getValues = function() --[[ Line: 26 ]]
            return v11.values;
        end;
        v11._updateValues = function(v12) --[[ Line: 30 ]]
            v11.values = v12;
            l_BindableEvent_0:Fire(v12);
        end;
        v11.configure = function(v13) --[[ Line: 35 ]]
            local v14 = v0.Dictionary.join(v11.values, v13);
            assert(v11.validate(v14));
            v11._updateValues(v14);
            if v2:IsServer() then
                v3:FireAllClients(v11.name, v14);
            end;
        end;
        v11.reset = function() --[[ Line: 47 ]]
            v11.configure(v11.initialValues);
        end;
        v11.destroy = function() --[[ Line: 51 ]]
            if v11._configChangedConn then
                v11._configChangedConn:Disconnect();
            end;
            if v11._configRequestedConn then
                v11._configRequestedConn:Disconnect();
            end;
        end;
        if v2:IsServer() then
            v11._configRequestedConn = v4.OnServerEvent:Connect(function(v15, v16) --[[ Line: 63 ]]
                if v11.name == v16 then
                    v3:FireClient(v15, v11.name, v11.values);
                end;
            end);
            return v11;
        else
            if v2:IsClient() then
                v11._configChangedConn = v3.OnClientEvent:Connect(function(v17, v18) --[[ Line: 71 ]]
                    if v11.name == v17 then
                        v11._updateValues(v18);
                    end;
                end);
                v4:FireServer(v11.name);
            end;
            return v11;
        end;
    end;
    return v5;
end;