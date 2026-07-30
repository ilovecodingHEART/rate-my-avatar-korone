-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Fusion);
local v2 = require(l_ReplicatedStorage_0.AdminUI.Theme);
return function(v3) --[[ Line: 8 ]]
    local l_GuiButtonState_0 = v3.GuiButtonState;
    return v1.New("TextButton")({
        Name = v3.Name, 
        BackgroundColor3 = v3.Color, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        Text = v3.Text, 
        TextSize = 14, 
        Font = Enum.Font.GothamBold, 
        TextColor3 = v2.InlineButtonText, 
        Visible = v3.Visible, 
        [v1.OnEvent("InputBegan")] = function(v5) --[[ Line: 21 ]]
            if v5.UserInputType == Enum.UserInputType.MouseMovement and v5.UserInputState == Enum.UserInputState.Change then
                l_GuiButtonState_0:set("Hovering");
            end;
            if v5.UserInputType == Enum.UserInputType.MouseButton1 and v5.UserInputState == Enum.UserInputState.Begin then
                l_GuiButtonState_0:set("Pressing");
            end;
            if v5.UserInputType == Enum.UserInputType.Touch and v5.UserInputState == Enum.UserInputState.Begin then
                l_GuiButtonState_0:set("Pressing");
            end;
        end, 
        [v1.OnEvent("InputEnded")] = function(v6) --[[ Line: 35 ]]
            if v6.UserInputType == Enum.UserInputType.MouseMovement and v6.UserInputState == Enum.UserInputState.Change then
                l_GuiButtonState_0:set("None");
            end;
            if v6.UserInputType == Enum.UserInputType.MouseButton1 and v6.UserInputState == Enum.UserInputState.End and l_GuiButtonState_0:get() == "Pressing" then
                l_GuiButtonState_0:set("Hovering");
            end;
            if v6.UserInputType == Enum.UserInputType.Touch and v6.UserInputState == Enum.UserInputState.End then
                l_GuiButtonState_0:set("None");
            end;
            if v6.UserInputType == Enum.UserInputType.Touch and v6.UserInputState == Enum.UserInputState.Change then
                l_GuiButtonState_0:set("None");
            end;
        end, 
        [v1.OnEvent("Activated")] = v3.OnActivated, 
        [v1.Children] = {
            v1.New("UICorner")({
                CornerRadius = UDim.new(0, 5)
            }), 
            v1.New("UIPadding")({
                PaddingLeft = UDim.new(0, 18), 
                PaddingRight = UDim.new(0, 18), 
                PaddingBottom = UDim.new(0, 11), 
                PaddingTop = UDim.new(0, 11)
            })
        }
    });
end;