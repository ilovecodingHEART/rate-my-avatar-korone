-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Fusion);
local v2 = require(l_ReplicatedStorage_0.AdminUI.Theme);
return function(v3) --[[ Line: 8 ]]
    local v4 = v1.Computed(function() --[[ Line: 9 ]]
        if v3.HighlightError and v3.HighlightError:get() then
            return v2.InlineTextBoxTextError;
        else
            return v2.InlineTextBoxText;
        end;
    end);
    local v5 = v1.Computed(function() --[[ Line: 14 ]]
        if v3.HighlightError and v3.HighlightError:get() then
            return v2.InlineTextBoxPlaceholderError;
        else
            return v2.InlineTextBoxPlaceholder;
        end;
    end);
    local v6 = "";
    return v1.New("TextBox")({
        Name = v3.Name, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundColor3 = v2.InlineTextBoxBackground, 
        PlaceholderText = v3.PlaceholderText, 
        PlaceholderColor3 = v5, 
        TextEditable = v3.TextEditable, 
        Text = v3.Text, 
        TextColor3 = v4, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextSize = 14, 
        TextWrapped = true, 
        Font = Enum.Font.Gotham, 
        Visible = v3.Visible, 
        [v1.OnChange("Text")] = function(v7) --[[ Line: 35 ]]
            v6 = v7;
        end, 
        [v1.OnEvent("FocusLost")] = function(v8) --[[ Line: 38 ]]
            if v8 then
                v3.OnTextEntered(v6);
            end;
        end, 
        [v1.OnChange("Text")] = v3.TextChanged, 
        [v1.Children] = {
            v1.New("UICorner")({
                CornerRadius = UDim.new(0, 5)
            }), 
            v1.New("UIPadding")({
                PaddingLeft = UDim.new(0, 18), 
                PaddingRight = UDim.new(0, 18), 
                PaddingTop = UDim.new(0, 10), 
                PaddingBottom = UDim.new(0, 10)
            }), 
            v3[v1.Children]
        }
    });
end;