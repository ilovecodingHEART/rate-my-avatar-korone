-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserService_0 = game:GetService("UserService");
local l_SoundService_0 = game:GetService("SoundService");
local l_Remotes_0 = l_ReplicatedStorage_0.Remotes;
local v5 = require(l_ReplicatedStorage_0.popup);
local v6 = require(l_ReplicatedStorage_0.LoadOfflinePlayer);
local v7 = require(l_ReplicatedStorage_0.ToggleLoading);
local function _(v8) --[[ Line: 13 ]] --[[ Name: getUserInfoFromUsername ]]
    -- upvalues: l_UserService_0 (copy)
    local l_UserIdFromNameAsync_0 = game.Players:GetUserIdFromNameAsync(v8);
    return l_UserService_0:GetUserInfosByUserIdsAsync({
        l_UserIdFromNameAsync_0
    })[1];
end;
return {
    startGifting = function(v11, v12, _) --[[ Line: 22 ]] --[[ Name: startGifting ]]
        -- upvalues: l_UserService_0 (copy), v6 (copy), l_SoundService_0 (copy), v5 (copy), v7 (copy), l_Remotes_0 (copy)
        local l_UserIdFromNameAsync_1 = game.Players:GetUserIdFromNameAsync(v11);
        local v15 = l_UserService_0:GetUserInfosByUserIdsAsync({
            l_UserIdFromNameAsync_1
        })[1];
        if #v12 == 0 then
            if v15 then
                v6(v15);
                return;
            else
                l_SoundService_0.SFX.Fail:Play();
                v5("warn", "invalid user!");
                v7(false);
                return;
            end;
        elseif l_Remotes_0.Function("CheckWasFiltered"):InvokeServer(v12) then
            v5("warn", "message was filtered!");
            v7(false);
            return;
        elseif v15 then
            v6(v15);
            return;
        else
            l_SoundService_0.SFX.Fail:Play();
            v5("warn", "invalid user!");
            v7(false);
            return;
        end;
    end
};