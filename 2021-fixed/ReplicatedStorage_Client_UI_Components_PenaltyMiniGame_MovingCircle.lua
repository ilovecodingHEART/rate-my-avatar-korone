-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_UserInputService_0 = game:GetService("UserInputService");
local l_Flipper_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Flipper"));
local l_RoactHooks_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("RoactHooks"));
local l_Roact_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Roact"));
local l_RoactFlipper_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("RoactFlipper"));
local l_usePx_0 = require(script.Parent.Parent.Parent:WaitForChild("Hooks"):WaitForChild("usePx"));
local l_useTag_0 = require(script.Parent.Parent.Parent:WaitForChild("Hooks"):WaitForChild("useTag"));
local l_GameSettings_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("GameSettings"));
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_Left_0 = Enum.NormalId.Left;
local v10 = l_RoactHooks_0.new(l_Roact_0);
local function v18(v11, _) --[[ Line: 18 ]] --[[ Name: getFaceCorners ]]
    local l_Size_0 = v11.Size;
    local l_CFrame_0 = v11.CFrame;
    local v15 = {
        Vector3.new(-l_Size_0.X / 2, -l_Size_0.Y / 2, -l_Size_0.Z / 2), 
        Vector3.new(-l_Size_0.X / 2, -l_Size_0.Y / 2, l_Size_0.Z / 2), 
        Vector3.new(-l_Size_0.X / 2, l_Size_0.Y / 2, l_Size_0.Z / 2), 
        (Vector3.new(-l_Size_0.X / 2, l_Size_0.Y / 2, -l_Size_0.Z / 2))
    };
    for v16, v17 in ipairs(v15) do
        v15[v16] = l_CFrame_0:PointToWorldSpace(v17);
    end;
    return v15;
end;
local function v29(v19, v20) --[[ Line: 36 ]] --[[ Name: getBoundingFrame ]]
    -- upvalues: v18 (copy), l_CurrentCamera_0 (copy)
    local v21 = v18(v19, v20);
    local v22 = 1e999;
    local v23 = 1e999;
    local v24 = -1e999;
    local v25 = -1e999;
    for _, v27 in ipairs(v21) do
        local v28 = l_CurrentCamera_0:WorldToScreenPoint(v27);
        v22 = math.min(v22, v28.X);
        v23 = math.min(v23, v28.Y);
        v24 = math.max(v24, v28.X);
        v25 = math.max(v25, v28.Y);
    end;
    return UDim2.fromOffset(v22, v23), UDim2.fromOffset(v24 - v22, v25 - v23);
end;
return v10(function(v30, v31) --[[ Line: 52 ]] --[[ Name: PartEdgeFrame ]]
    -- upvalues: l_usePx_0 (copy), l_useTag_0 (copy), l_RoactFlipper_0 (copy), l_UserInputService_0 (copy), l_GameSettings_0 (copy), v29 (copy), l_Left_0 (copy), l_Flipper_0 (copy), l_Roact_0 (copy)
    local v32 = l_usePx_0(v31);
    local v33 = l_useTag_0("PenaltyGoal", v31);
    local v34 = v31.useMemo(function() --[[ Line: 55 ]]
        return {
            current = nil
        };
    end, {});
    local v35, v36 = v31.useState({
        UDim2.fromOffset(0, 0), 
        UDim2.fromOffset(0, 0)
    });
    local v37 = l_RoactFlipper_0.useMotor(v31, {
        x = 0, 
        y = 0
    });
    local v38, v39 = v31.useBinding(v37:getValue());
    v31.useEffect(function() --[[ Line: 68 ]]
        -- upvalues: v37 (copy), v39 (copy)
        local v40 = v37:onStep(v39);
        return function() --[[ Line: 71 ]]
            -- upvalues: v40 (copy)
            v40:disconnect();
        end;
    end, {});
    v31.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: l_UserInputService_0 (ref), l_GameSettings_0 (ref), v34 (copy), v30 (copy)
        local v44 = l_UserInputService_0.InputBegan:Connect(function(v41, v42) --[[ Line: 77 ]]
            -- upvalues: l_GameSettings_0 (ref), v34 (ref), v30 (ref)
            if v42 then
                return;
            else
                if v41.UserInputType == Enum.UserInputType.Touch or v41.UserInputType == Enum.UserInputType.MouseButton1 or v41.KeyCode == l_GameSettings_0.KEY_BINDS.Console.Shoot then
                    local v43 = UDim2.fromOffset(v34.current.AbsolutePosition.X, v34.current.AbsolutePosition.Y);
                    v30.onInput(Vector2.new(v43.X.Offset, v43.Y.Offset));
                end;
                return;
            end;
        end);
        return function() --[[ Line: 92 ]]
            -- upvalues: v44 (copy)
            v44:Disconnect();
        end;
    end, {
        v35
    });
    v31.useEffect(function() --[[ Line: 97 ]]
        -- upvalues: v33 (copy), v36 (copy), v29 (ref), l_Left_0 (ref)
        local function v45() --[[ Line: 98 ]] --[[ Name: update ]]
            -- upvalues: v33 (ref), v36 (ref), v29 (ref), l_Left_0 (ref)
            if #v33 == 0 then
                return;
            else
                v36({
                    v29(v33[1], l_Left_0)
                });
                return;
            end;
        end;
        local v46 = game:GetService("RunService").Heartbeat:Connect(v45);
        return function() --[[ Line: 107 ]]
            -- upvalues: v46 (copy)
            v46:Disconnect();
        end;
    end, {
        v33
    });
    v31.useEffect(function() --[[ Line: 112 ]]
        -- upvalues: v33 (copy), v37 (copy), l_Flipper_0 (ref)
        if #v33 == 0 then
            return function() --[[ Line: 114 ]]

            end;
        else
            v37:setGoal({
                x = l_Flipper_0.Linear.new(1), 
                y = l_Flipper_0.Linear.new(1)
            });
            local v47 = v37:onComplete(function() --[[ Line: 122 ]]
                -- upvalues: v37 (ref), l_Flipper_0 (ref)
                v37:setGoal({
                    x = l_Flipper_0.Linear.new(math.random()), 
                    y = l_Flipper_0.Linear.new(math.random())
                });
            end);
            return function() --[[ Line: 129 ]]
                -- upvalues: v47 (copy)
                v47:disconnect();
            end;
        end;
    end, {
        v33
    });
    if #v33 == 0 then
        return nil;
    else
        return l_Roact_0.createElement("Frame", {
            Position = v35[1], 
            Size = v35[2], 
            BackgroundTransparency = 1
        }, {
            l_Roact_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, {
                Circle = l_Roact_0.createElement("ImageLabel", {
                    Size = UDim2.fromOffset(v32(25), v32(25)), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = v38:map(function(v48) --[[ Line: 150 ]]
                        return UDim2.fromScale(v48.x, v48.y);
                    end), 
                    BackgroundTransparency = 1, 
                    Image = "rbxassetid://107312651313534", 
                    ImageColor3 = Color3.fromRGB(255, 255, 255), 
                    [l_Roact_0.Ref] = function(v49) --[[ Line: 158 ]]
                        -- upvalues: v34 (copy)
                        v34.current = v49;
                    end
                }, {
                    Corner = l_Roact_0.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    })
                }), 
                Padding = l_Roact_0.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v32(25)), 
                    PaddingBottom = UDim.new(0, v32(25)), 
                    PaddingLeft = UDim.new(0, v32(25)), 
                    PaddingRight = UDim.new(0, v32(25))
                })
            })
        });
    end;
end);