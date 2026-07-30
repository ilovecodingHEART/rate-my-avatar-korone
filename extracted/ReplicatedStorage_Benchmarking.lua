-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
    new = function(v0) --[[ Line: 11 ]] --[[ Name: new ]]
        local v1 = os.clock();
        return function() --[[ Line: 13 ]]
            local v2, v3 = debug.info(2, "s"):match("(.*%.)(.*)$");
            _ = v2;
            local l_v3_0 = v3;
            local v5 = debug.info(2, "l");
            v2 = string.format(("%*:%* - %%i ms"):format(l_v3_0, v5), (os.clock() - v1) * 1000);
            if v0 then
                v2 = ("[%*] "):format(v0) .. v2;
            end;
            return v2;
        end;
    end
};