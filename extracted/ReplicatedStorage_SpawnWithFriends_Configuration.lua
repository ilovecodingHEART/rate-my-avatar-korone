-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.Packages.Cryo);
return {
    new = function(v1, v2) --[[ Line: 5 ]] --[[ Name: new ]]
        v1 = v0.Dictionary.join(v1, {});
        local v3 = {
            initialValues = v1, 
            values = v1, 
            validate = v2 or function() --[[ Line: 11 ]]

            end, 
            changed = Instance.new("BindableEvent")
        };
        v3.getValues = function() --[[ Line: 16 ]]
            return v3.values;
        end;
        v3.configure = function(v4) --[[ Line: 20 ]]
            local v5, v6 = v3.validate(v4);
            if not v5 then
                error(v6);
            end;
            v3.values = v0.Dictionary.join(v3.values, v4);
            v3.changed:Fire(v3.values);
        end;
        v3.reset = function() --[[ Line: 30 ]]
            v3.values = v0.Dictionary.join(v3.initialValues, {});
            v3.changed:Fire(v3.values);
        end;
        return v3;
    end
};