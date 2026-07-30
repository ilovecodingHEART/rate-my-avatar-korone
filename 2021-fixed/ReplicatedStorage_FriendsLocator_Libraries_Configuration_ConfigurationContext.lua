-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.Parent.Parent.Packages.Roact);
local v1 = require(script.Parent.Parent.Parent.Packages.Cryo);
local v2 = v0.createContext({});
local v3 = v0.Component:extend("ConfigurationProvider");
v3.init = function(v4) --[[ Line: 10 ]] --[[ Name: init ]]
    assert(typeof(v4.props.config) == "table", "ConfigurationContext requires the `config` prop to be an instance of Configuration");
    v4.state = v4.props.config.getValues();
    v4:_connectUpdateEvent();
end;
v3.render = function(v5) --[[ Line: 20 ]] --[[ Name: render ]]
    return v0.createElement(v2.Provider, {
        value = v5.state
    }, v5.props[v0.Children]);
end;
v3.didMount = function(v6) --[[ Line: 26 ]] --[[ Name: didMount ]]
    v6:_connectUpdateEvent();
end;
v3.willUnmount = function(v7) --[[ Line: 30 ]] --[[ Name: willUnmount ]]
    if v7.changedConn then
        v7.changedConn:Disconnect();
        v7.changedConn = nil;
    end;
end;
v3._connectUpdateEvent = function(v8) --[[ Line: 49 ]] --[[ Name: _connectUpdateEvent ]]
    if v8.changedConn then
        return;
    else
        v8.changedConn = v8.props.config.changed:Connect(function(v9) --[[ Line: 54 ]]
            v8:setState(v9);
        end);
        return;
    end;
end;
return {
    ConfigurationProvider = v3, 
    withConfiguration = function(v10) --[[ Line: 62 ]] --[[ Name: withConfiguration ]]
        return function(v11) --[[ Line: 63 ]]
            if v11.configuration then
                warn("Child component has a prop named `configuration` and will be overriden by ConfigurationContext.");
            end;
            return v0.createElement(v2.Consumer, {
                render = function(v12) --[[ Line: 69 ]] --[[ Name: render ]]
                    local v13 = v1.Dictionary.join({
                        configuration = v12
                    }, v11);
                    return v0.createElement(v10, v13);
                end
            });
        end;
    end
};