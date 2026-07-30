-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- !! MANUAL FIX REQUIRED: 1 site(s) use if-expressions or `continue`,
-- !! which DO NOT COMPILE on 2021. See 2021-fixed/MANUAL-FIXES.md for the lines
-- !! and REPORT-2021.md for rewrite recipes. They are marked below.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.createUseBinding);
local v1 = require(script.createUseCallback);
local v2 = require(script.createUseContext);
local v3 = require(script.createUseEffect);
local v4 = require(script.createUseMemo);
local v5 = require(script.createUseReducer);
local v6 = require(script.createUseState);
local v7 = require(script.createUseValue);
local v8 = require(script.dependenciesDifferent);
local v9 = {};
local function v20(v10, v11) --[[ Line: 13 ]] --[[ Name: createHooks ]]
    -- upvalues: v3 (copy), v6 (copy), v7 (copy), v0 (copy), v4 (copy), v2 (copy), v1 (copy), v5 (copy)
    local v12 = v3(v11);
    local v13 = v6(v11);
    local v14 = v7(v11);
    local v15 = v0(v10, v14);
    local v16 = v4(v14);
    local v17 = v2(v11, v12, v13, v16);
    local v18 = v1(v16);
    local v19 = v5(v18, v13);
    return {
        Roact = v10, 
        useBinding = v15, 
        useCallback = v18, 
        useContext = v17, 
        useEffect = v12, 
        useMemo = v16, 
        useReducer = v19, 
        useState = v13, 
        useValue = v14
    };
end;
v9.new = function(v21) --[[ Line: 49 ]] --[[ Name: new ]]
    -- upvalues: v20 (copy), v8 (copy)
    return function(v22, v23) --[[ Line: 50 ]]
        -- upvalues: v21 (copy), v20 (ref), v8 (ref)
        assert(typeof(v22) == "function", "Hooked components must be functions.");
        if v23 == nil then
            v23 = {};
        end;
        local l_componentType_0 = v23.componentType;
        local v25 = v23.name or debug.info(v22, "n");
        local v26 = nil;
        if l_componentType_0 == nil or l_componentType_0 == "Component" then
            v26 = v21.Component:extend(v25);
        elseif l_componentType_0 == "PureComponent" then
            v26 = v21.PureComponent:extend(v25);
        else
            error(string.format("'%s' is not a valid componentType. componentType must either be nil, 'Component', or 'PureComponent'", (tostring(l_componentType_0))));
        end;
        v26.defaultProps = v23.defaultProps;
        v26.validateProps = v23.validateProps;
        v26.init = function(v27) --[[ Line: 78 ]] --[[ Name: init ]]
            -- upvalues: v20 (ref), v21 (ref)
            v27.defaultStateValues = {};
            v27.effectDependencies = {};
            v27.effects = {};
            v27.unmountEffects = {};
            v27.hooks = v20(v21, v27);
        end;
        v26.runEffects = function(v28) --[[ Line: 87 ]] --[[ Name: runEffects ]]
            -- upvalues: v8 (ref)
            for v29 = 1, v28.hookCounter do
                local v30 = v28.effects[v29];
                if v30 ~= nil then
                    local v31, v32 = unpack(v30);
                    if v32 ~= nil then
                        local v33 = v28.effectDependencies[v29];
                        if v33 == nil or v8(v32, v33) then
                            v28.effectDependencies[v29] = v32;
                        else
                            continue; -- << MANUAL FIX: continue (2021 cannot compile this) >>
                        end;
                    end;
                    local v34 = v28.unmountEffects[v29];
                    if v34 ~= nil then
                        v34();
                    end;
                    v28.unmountEffects[v29] = v31();
                end;
            end;
        end;
        v26.didMount = function(v35) --[[ Line: 114 ]] --[[ Name: didMount ]]
            v35:runEffects();
        end;
        v26.didUpdate = function(v36) --[[ Line: 118 ]] --[[ Name: didUpdate ]]
            v36:runEffects();
        end;
        v26.willUnmount = function(v37) --[[ Line: 122 ]] --[[ Name: willUnmount ]]
            for v38 = 1, v37.hookCounter do
                local v39 = v37.unmountEffects[v38];
                if v39 ~= nil then
                    v39();
                end;
            end;
        end;
        v26.render = function(v40) --[[ Line: 132 ]] --[[ Name: render ]]
            -- upvalues: v22 (copy)
            v40.hookCounter = 0;
            return v22(v40.props, v40.hooks);
        end;
        return v26;
    end;
end;
return v9;