-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Debris_0 = game:GetService("Debris");
return function(v1, v2) --[[ Line: 3 ]] --[[ Name: emitParticles ]]
    -- upvalues: l_Debris_0 (copy)
    local v3 = v1:Clone();
    v3.CFrame = CFrame.new(v2);
    v3.Parent = workspace;
    for _, v5 in ipairs(v3:GetDescendants()) do
        if v5:IsA("ParticleEmitter") then
            task.delay(v5:GetAttribute("EmitDelay") or 0, function() --[[ Line: 10 ]]
                -- upvalues: v5 (copy)
                v5:Emit(v5:GetAttribute("EmitCount") or 0);
            end);
        end;
    end;
    l_Debris_0:AddItem(v3, 5);
    return v3;
end;