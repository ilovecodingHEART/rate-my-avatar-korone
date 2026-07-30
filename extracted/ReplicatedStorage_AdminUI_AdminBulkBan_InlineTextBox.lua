-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Fusion);
local v2 = require(l_ReplicatedStorage_0.AdminUI.Theme);
local function _(v3) --[[ Line: 8 ]] --[[ Name: RefNew ]]
    return function(v4) --[[ Line: 9 ]]
        return function(v5) --[[ Line: 10 ]]
            local v6 = v1.New(v4)(v5);
            if v3 then
                v3:set(v6);
            end;
            return v6;
        end;
    end;
end;
return function(v8) --[[ Line: 20 ]]
    local v9 = v1.Computed(function() --[[ Line: 21 ]]
        if v8.HighlightEmptyError and v8.HighlightEmptyError:get() then
            return v2.InlineTextBoxPlaceholderEmptyError;
        else
            return v2.InlineTextBoxPlaceholder;
        end;
    end);
    local v10 = "";
    local l_Ref_0 = v8.Ref;
    return (function(v12) --[[ Line: 9 ]]
        return function(v13) --[[ Line: 10 ]]
            local v14 = v1.New(v12)(v13);
            if l_Ref_0 then
                l_Ref_0:set(v14);
            end;
            return v14;
        end;
    end)("TextBox")({
        Name = v8.Name, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundColor3 = v2.InlineTextBoxBackground, 
        PlaceholderText = v8.PlaceholderText, 
        PlaceholderColor3 = v9, 
        TextEditable = v8.TextEditable, 
        Text = v8.Text, 
        TextColor3 = v2.InlineTextBoxText, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextSize = 14, 
        TextWrapped = true, 
        Font = Enum.Font.Gotham, 
        Visible = v8.Visible, 
        [v1.OnChange("Text")] = function(v15) --[[ Line: 42 ]]
            v10 = v15;
        end, 
        [v1.OnEvent("FocusLost")] = function(v16) --[[ Line: 45 ]]
            if v16 then
                v8.OnTextEntered(v10);
            end;
        end, 
        [v1.OnChange("Text")] = v8.TextChanged, 
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
            v8[v1.Children]
        }
    });
end;