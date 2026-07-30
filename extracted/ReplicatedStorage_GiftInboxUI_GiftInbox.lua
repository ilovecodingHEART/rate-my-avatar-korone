-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Fusion);
local v2 = require(l_ReplicatedStorage_0.GiftInboxUI.Gift);
return function(v3) --[[ Line: 9 ]]
    return v1.New("ScrollingFrame")({
        Size = UDim2.fromScale(1, 1), 
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        CanvasSize = UDim2.new(), 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        ScrollBarThickness = 8, 
        BackgroundTransparency = 1, 
        ScrollBarImageColor3 = Color3.fromRGB(197, 197, 197), 
        [v1.Children] = {
            v1.New("UIListLayout")({
                Padding = UDim.new(0, 10)
            }), 
            v1.New("UIPadding")({
                PaddingLeft = UDim.new(0.05, 0), 
                PaddingRight = UDim.new(0.05, 0)
            }), 
            v1.ComputedPairs(v3.gifts, function(v4, v5) --[[ Line: 29 ]]
                local v6 = table.clone(v5);
                v6.layoutOrder = v4;
                return v2(v6);
            end)
        }
    });
end;