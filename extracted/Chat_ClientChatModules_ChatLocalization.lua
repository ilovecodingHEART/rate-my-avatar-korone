-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Chat_0 = game:GetService("Chat");
local l_status_0, l_result_0 = pcall(function() --[[ Line: 5 ]]
    return UserSettings():IsUserFeatureEnabled("UserShouldLocalizeServerMessages");
end);
local v4 = l_status_0 and l_result_0;
local v5 = {
    System = "InGame.Chat.Label.SystemMessagePrefix", 
    Team = "InGame.Chat.Label.TeamMessagePrefix", 
    ["From "] = "InGame.Chat.Label.From", 
    ["To "] = "InGame.Chat.Label.To"
};
return {
    _hasFetchedLocalization = false, 
    _getTranslator = function(v6) --[[ Line: 18 ]] --[[ Name: _getTranslator ]]
        if not v6._translator and not v6._hasFetchedLocalization then
            v6._hasFetchedLocalization = true;
            local v7 = l_Chat_0:WaitForChild("ChatLocalization", 4);
            if v7 then
                v6._translator = v7:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
                l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ Line: 26 ]]
                    v6._hasFetchedLocalization = false;
                    v6._translator = nil;
                end);
            else
                warn("Missing ChatLocalization. Chat interface will not be localized.");
            end;
        end;
        return v6._translator;
    end, 
    Get = function(v8, v9, v10, v11) --[[ Line: 38 ]] --[[ Name: Get ]]
        local l_v10_0 = v10;
        pcall(function() --[[ Line: 40 ]]
            local v13 = v8:_getTranslator();
            if v13 then
                l_v10_0 = v13:FormatByKey(v9, v11);
                return;
            else
                warn("Missing Translator. Used default for", v9);
                return;
            end;
        end);
        return l_v10_0;
    end, 
    LocalizeFormattedMessage = function(v14, v15) --[[ Line: 51 ]] --[[ Name: LocalizeFormattedMessage ]]
        if not v4 then
            return v15;
        else
            local v16, v17 = string.find(v15, "{RBX_LOCALIZATION_KEY}");
            if not v16 then
                return v15;
            else
                local v18, v19 = string.find(v15, "{RBX_LOCALIZATION_DEFAULT}");
                if not v18 then
                    return v15;
                else
                    local v20, v21 = string.find(v15, "{RBX_LOCALIZATION_PARAMS}");
                    local v22 = string.sub(v15, v17 + 1, v18 - 1);
                    local v23 = nil;
                    if not v20 then
                        return v14:Get(v22, (string.sub(v15, v19 + 1)));
                    else
                        v23 = string.sub(v15, v19 + 1, v20 - 1);
                        local v24 = string.sub(v15, v21 + 1);
                        local v25 = {};
                        for v26, v27 in string.gmatch(v24, "([^%s]+)=([^%s]+)") do
                            v25[v26] = v27;
                        end;
                        return v14:Get(v22, v23, v25);
                    end;
                end;
            end;
        end;
    end, 
    FormatMessageToSend = function(v28, v29, v30, v31, v32) --[[ Line: 82 ]] --[[ Name: FormatMessageToSend ]]
        if v4 then
            if v31 and v32 then
                return "{RBX_LOCALIZATION_KEY}" .. v29 .. "{RBX_LOCALIZATION_DEFAULT}" .. v30 .. "{RBX_LOCALIZATION_PARAMS}" .. v31 .. "=" .. v32;
            else
                return "{RBX_LOCALIZATION_KEY}" .. v29 .. "{RBX_LOCALIZATION_DEFAULT}" .. v30;
            end;
        elseif v31 and v32 then
            return string.gsub(v28:Get(v29, v30), "{" .. v31 .. "}", v32);
        else
            return v28:Get(v29, v30);
        end;
    end, 
    tryLocalize = function(v33, v34) --[[ Line: 101 ]] --[[ Name: tryLocalize ]]
        if v5[v34] then
            return v33:Get(v5[v34], v34);
        else
            for v35, v36 in pairs(v5) do
                if string.find(v34, v35) then
                    local v37 = v33:Get(v36, v35);
                    return string.gsub(v34, v35, v37, 1);
                end;
            end;
            return v34;
        end;
    end
};