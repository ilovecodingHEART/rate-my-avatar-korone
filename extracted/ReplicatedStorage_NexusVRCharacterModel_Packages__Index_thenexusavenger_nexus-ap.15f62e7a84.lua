-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TweenService_0 = game:GetService("TweenService");
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3, v4) --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v5 = setmetatable({
        JointType = v2.ClassName, 
        Destroyed = false, 
        Motor = v2, 
        Part0 = v3, 
        AttachmentCFrame = CFrame.identity, 
        ActiveTweens = {}, 
        EventConnections = {}
    }, v1);
    table.insert(v5.EventConnections, v3.ChildAdded:Connect(function(v6) --[[ Line: 39 ]]
        -- upvalues: v4 (copy), v5 (copy)
        if v6.Name ~= v4 or not v6:IsA("Attachment") then
            return;
        else
            v5:ConnectAttachment(v6);
            return;
        end;
    end));
    v5:ConnectAttachment((v3:FindFirstChild(v4)));
    return v5;
end;
v1.ConnectAttachment = function(v7, v8) --[[ Line: 52 ]] --[[ Name: ConnectAttachment ]]
    if not v8 then
        return;
    else
        v7.AttachmentCFrame = v8.CFrame;
        v7.StartAttachment = v8;
        table.insert(v7.EventConnections, v7.Part0:GetPropertyChangedSignal("Size"):Connect(function() --[[ Line: 62 ]]
            -- upvalues: v7 (copy), v8 (copy)
            if v7.StartAttachment ~= v8 then
                return;
            else
                v7.AttachmentCFrame = v8.CFrame;
                return;
            end;
        end));
        return;
    end;
end;
v1.SetProperty = function(v9, v10, v11, v12, v13) --[[ Line: 71 ]] --[[ Name: SetProperty ]]
    -- upvalues: l_TweenService_0 (copy)
    if v9.Destroyed then
        return;
    elseif v13 then
        if not v9.ActiveTweens[v10] then
            v9.ActiveTweens[v10] = {};
        end;
        local v14 = l_TweenService_0:Create(v10, v13, {
            [v11] = v12
        });
        v14:Play();
        v9.ActiveTweens[v10][v11] = v14;
        return;
    else
        v10[v11] = v12;
        return;
    end;
end;
v1.SetOffset = function(v15, v16, v17) --[[ Line: 88 ]] --[[ Name: SetOffset ]]
    if v15.JointType == "Motor6D" then
        v15:SetProperty(v15.Motor, "C0", v15.AttachmentCFrame * v16, v17);
        return;
    else
        if v15.JointType == "AnimationConstraint" and v15.StartAttachment then
            v15:SetProperty(v15.StartAttachment, "CFrame", v15.AttachmentCFrame * v16, v17);
        end;
        return;
    end;
end;
v1.Destroy = function(v18) --[[ Line: 99 ]] --[[ Name: Destroy ]]
    v18.Destroyed = true;
    for _, v20 in v18.EventConnections do
        v20:Disconnect();
    end;
    for _, v22 in v18.ActiveTweens do
        for _, v24 in v22 do
            v24:Cancel();
        end;
    end;
    v18.ActiveTweens = {};
    if v18.Motor:IsA("Motor6D") then
        v18.Motor.C0 = v18.AttachmentCFrame;
        return;
    else
        if v18.Motor:IsA("AnimationConstraint") and v18.StartAttachment then
            v18.StartAttachment.CFrame = v18.AttachmentCFrame;
        end;
        return;
    end;
end;
return v1;