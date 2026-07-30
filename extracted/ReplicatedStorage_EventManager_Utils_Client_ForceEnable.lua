-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    Enabled = {}
};
v0.Force = function(_, v2) --[[ Line: 5 ]] --[[ Name: Force ]]
    -- upvalues: v0 (copy)
    local v3 = v0.Enabled[v2];
    if not v3 then
        v3 = {
            Emit = {}, 
            Particles = {}
        };
        for _, v5 in pairs(v2:GetDescendants()) do
            if v5:IsA("ParticleEmitter") then
                v5.Enabled = false;
                table.insert(v3.Particles, v5);
            end;
        end;
        v0.Enabled[v2] = v3;
    end;
    local v6 = true;
    for _, v8 in pairs(v3.Particles) do
        local v9 = coroutine.create(function() --[[ Line: 26 ]]
            -- upvalues: v6 (ref), v8 (copy)
            while v6 do
                v8:Emit(1);
                task.wait(1 / v8.Rate);
            end;
        end);
        table.insert(v3.Emit, v9);
        coroutine.resume(v9);
    end;
    return function() --[[ Line: 37 ]]
        -- upvalues: v6 (ref), v0 (ref), v2 (copy)
        v6 = false;
        v0.Enabled[v2] = nil;
    end;
end;
return v0;