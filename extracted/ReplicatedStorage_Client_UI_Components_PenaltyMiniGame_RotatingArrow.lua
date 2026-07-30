-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_UserInputService_0 = game:GetService("UserInputService");
local l_Flipper_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Flipper"));
local l_RoactHooks_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("RoactHooks"));
local l_Roact_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Roact"));
local l_RoactFlipper_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("RoactFlipper"));
local l_useAtom_0 = require(script.Parent.Parent.Parent:WaitForChild("Hooks"):WaitForChild("useAtom"));
local l_useRef_0 = require(script.Parent.Parent.Parent:WaitForChild("Hooks"):WaitForChild("useRef"));
local l_usePx_0 = require(script.Parent.Parent.Parent:WaitForChild("Hooks"):WaitForChild("usePx"));
local _ = require(script.Parent.Parent.Parent:WaitForChild("Hooks"):WaitForChild("useTag"));
local _ = require(script.Parent.Parent.Parent.Parent:WaitForChild("atoms"));
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_createElement_0 = l_Roact_0.createElement;
local l_GameSettings_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("GameSettings"));
local l_atoms_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("atoms"));
return l_RoactHooks_0.new(l_Roact_0)(function(v14, v15) --[[ Line: 22 ]] --[[ Name: RotatingArrow ]]
    -- upvalues: l_usePx_0 (copy), l_useAtom_0 (copy), l_atoms_1 (copy), l_LocalPlayer_0 (copy), l_useRef_0 (copy), l_RoactFlipper_0 (copy), l_UserInputService_0 (copy), l_GameSettings_0 (copy), l_Flipper_0 (copy), l_createElement_0 (copy)
    local _ = l_usePx_0(v15);
    local v17 = l_useAtom_0(v15, l_atoms_1["players/info"])[l_LocalPlayer_0.Name];
    local v18 = l_useAtom_0(v15, l_atoms_1.goals)[l_LocalPlayer_0.Name] or 0;
    local v19 = l_useRef_0(v15, os.clock());
    local v20 = l_RoactFlipper_0.useMotor(v15, math.random(0, 360));
    local v21 = 60 + 0.15 * (v18 / 10) ^ 1.7;
    local v22, v23 = v15.useBinding(v20:getValue());
    v15.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: v20 (copy), v23 (copy)
        local v24 = v20:onStep(v23);
        return function() --[[ Line: 37 ]]
            -- upvalues: v24 (copy)
            v24:disconnect();
        end;
    end, {});
    v15.useEffect(function() --[[ Line: 42 ]]
        -- upvalues: l_UserInputService_0 (ref), l_GameSettings_0 (ref), v14 (copy), v20 (copy), v19 (copy)
        local v27 = l_UserInputService_0.InputBegan:Connect(function(v25, v26) --[[ Line: 43 ]]
            -- upvalues: l_GameSettings_0 (ref), v14 (ref), v20 (ref), v19 (ref)
            if v26 then
                return;
            else
                if v25.UserInputType == Enum.UserInputType.Touch or v25.UserInputType == Enum.UserInputType.MouseButton1 or v25.KeyCode == l_GameSettings_0.KEY_BINDS.Console.Shoot then
                    v14.onInput(v20:getValue(), os.clock() - v19.current);
                end;
                return;
            end;
        end);
        return function() --[[ Line: 57 ]]
            -- upvalues: v27 (copy)
            v27:Disconnect();
        end;
    end, {});
    v15.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: v20 (copy), l_Flipper_0 (ref), v21 (copy), v19 (copy)
        v20:setGoal(l_Flipper_0.Linear.new(360, {
            velocity = v21
        }));
        local v29 = v20:onComplete(function() --[[ Line: 67 ]]
            -- upvalues: v20 (ref), v19 (ref), l_Flipper_0 (ref), v21 (ref)
            local _ = v20:getValue();
            v19.current = os.clock();
            if v20:getValue() == 360 then
                v20._state.value = 0;
                v20:setGoal(l_Flipper_0.Linear.new(360, {
                    velocity = v21
                }));
            end;
        end);
        return function() --[[ Line: 78 ]]
            -- upvalues: v29 (copy)
            v29:disconnect();
        end;
    end);
    if v17 == nil then
        return;
    else
        return l_createElement_0("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 1), 
            BackgroundTransparency = 1, 
            Image = "rbxassetid://89745979000630", 
            Position = UDim2.new(0.5, 0, 1, -40), 
            Size = UDim2.fromOffset(120, 120)
        }, {
            uICorner = l_createElement_0("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            targetArc = l_createElement_0("ImageLabel", {
                Rotation = v17.shift, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = "rbxassetid://117566235844630", 
                ImageColor3 = Color3.fromRGB(0, 153, 255), 
                Position = UDim2.fromScale(0.5, 0.5), 
                ScaleType = Enum.ScaleType.Fit, 
                Size = UDim2.fromOffset(120, 120)
            }, {
                uIScale = l_createElement_0("UIScale", {
                    Scale = 1.1
                })
            }), 
            frame = l_createElement_0("Frame", {
                BackgroundTransparency = 1, 
                Rotation = v22, 
                Size = UDim2.fromScale(1, 1)
            }, {
                spinner = l_createElement_0("Frame", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromOffset(15, 15), 
                    ZIndex = 2
                }, {
                    uICorner = l_createElement_0("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }), 
                    frame = l_createElement_0("Frame", {
                        AnchorPoint = Vector2.new(0.5, 1), 
                        BackgroundColor3 = Color3.new(1, 1, 1), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Size = UDim2.fromOffset(4, 55)
                    }, {
                        uICorner = l_createElement_0("UICorner")
                    })
                })
            })
        });
    end;
end);