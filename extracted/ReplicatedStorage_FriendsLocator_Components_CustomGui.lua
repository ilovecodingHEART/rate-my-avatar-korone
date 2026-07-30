-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_StarterGui_0 = game:GetService("StarterGui");
local v1 = require(script.Parent.Parent.Packages.Roact);
local v2 = require(script.Parent.Parent.Packages.Cryo);
return function(v3) --[[ Line: 15 ]] --[[ Name: withCustomGui ]]
    return function(v4) --[[ Line: 16 ]]
        local v5 = v1.Component:extend("CustomGui");
        v5.init = function(v6) --[[ Line: 19 ]] --[[ Name: init ]]
            v6.StarterGui = v6.props.StarterGui or l_StarterGui_0;
            local l_FirstChild_0 = v6.StarterGui:FindFirstChild(v3, true);
            if not l_FirstChild_0 then
                return;
            elseif not l_FirstChild_0:IsA("Frame") then
                warn(string.format("[FriendsLocator] Custom GUI provided expected to be Frame, got %s instead", l_FirstChild_0.ClassName));
                return;
            else
                v6.instance = l_FirstChild_0:Clone();
                return;
            end;
        end;
        v5.render = function(v8) --[[ Line: 45 ]] --[[ Name: render ]]
            return v1.createElement(v4, v2.Dictionary.join(v8.props, {
                customGui = v8.instance
            }));
        end;
        v5.willUnmount = function(v9) --[[ Line: 54 ]] --[[ Name: willUnmount ]]
            if v9.instance then
                v9.instance:Destroy();
                v9.instance = nil;
            end;
        end;
        return v5;
    end;
end;