-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v5 = {
    new = function() --[[ Line: 15 ]] --[[ Name: new ]]
        return {
            _queue = {}
        };
    end, 
    add = function(v0, v1, v2) --[[ Line: 21 ]] --[[ Name: add ]]
        table.insert(v0._queue, {
            id = v1, 
            data = v2
        });
    end, 
    take = function(v3) --[[ Line: 28 ]] --[[ Name: take ]]
        local l__queue_0 = v3._queue;
        v3._queue = {};
        return l__queue_0;
    end
};
table.freeze(v5);
return v5;