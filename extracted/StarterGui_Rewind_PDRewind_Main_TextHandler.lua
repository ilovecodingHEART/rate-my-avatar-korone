-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_PDRewind_0 = l_Players_0.LocalPlayer.PlayerGui.Rewind.PDRewind;
local v4 = require(script.ConfettiModule);
local function _(v5, v6, v7, v8) --[[ Line: 10 ]] --[[ Name: tween ]]
    local v9 = TweenInfo.new(v6, v8 or Enum.EasingStyle.Quint);
    local v10 = l_TweenService_0:Create(v5, v9, v7);
    v10:Play();
    return v10;
end;
local function v18(v12) --[[ Line: 17 ]] --[[ Name: stopAllSongs ]]
    for _, v14 in ipairs(v12:GetChildren()) do
        if v14:IsA("Sound") and v14.Playing then
            local v15 = {
                Volume = 0
            };
            local v16 = TweenInfo.new(1, Enum.EasingStyle.Quint);
            local v17 = l_TweenService_0:Create(v14, v16, v15);
            v17:Play();
            v17.Completed:Wait();
            v14:Stop();
        end;
    end;
end;
local function v26() --[[ Line: 27 ]] --[[ Name: playRandomSong ]]
    local l_RewindMusic_0 = game.SoundService.RewindMusic;
    v18(l_RewindMusic_0);
    local v20 = {};
    for _, v22 in ipairs(l_RewindMusic_0:GetChildren()) do
        if v22:IsA("Sound") then
            table.insert(v20, v22);
        end;
    end;
    if #v20 > 0 then
        local v23 = v20[math.random(1, #v20)];
        v23.Volume = 0;
        v23.TimePosition = v23.TimeLength / (math.random(30, 60) / 10);
        v23:Play();
        local v24 = {
            Volume = 0.1
        };
        local v25 = TweenInfo.new(2, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(v23, v25, v24):Play();
    end;
end;
v0.display = function(v27, v28, v29) --[[ Line: 47 ]] --[[ Name: display ]]
    v29 = v29 or "none";
    local l_l_PDRewind_0_FirstChild_0 = l_PDRewind_0:FindFirstChild(v27);
    local l_CustomText_0 = l_l_PDRewind_0_FirstChild_0.CustomText;
    local v32 = false;
    l_l_PDRewind_0_FirstChild_0.ZIndex = -1;
    l_l_PDRewind_0_FirstChild_0.ZIndex = 2;
    l_PDRewind_0.UIPageLayout:JumpTo(l_l_PDRewind_0_FirstChild_0);
    for _, v34 in l_CustomText_0:GetChildren() do
        if v34:IsA("TextLabel") then
            v32 = true;
            local v35 = {
                TextTransparency = 1
            };
            local v36 = TweenInfo.new(1, Enum.EasingStyle.Quint);
            l_TweenService_0:Create(v34, v36, v35):Play();
            spawn(function() --[[ Line: 61 ]]
                task.wait(1);
                v34:Destroy();
            end);
        end;
    end;
    task.wait(1);
    v26();
    local v37 = false;
    if v29 == "people" then
        for _, v39 in l_l_PDRewind_0_FirstChild_0.ListFrame:GetChildren() do
            if v39:IsA("ImageLabel") then
                v39:Destroy();
            end;
        end;
        for _ = 1, 64 do
            local v41 = Instance.new("ImageLabel", l_l_PDRewind_0_FirstChild_0.ListFrame);
            v41.Size = UDim2.new(0.25, 0, 0.25, 0);
            v41.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
            v41.BackgroundTransparency = math.random(80, 100) / 100;
            v41.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. math.random(1, 1000) .. "&width=420&height=420&format=png";
            v41.ImageColor3 = Color3.fromRGB(0, 0, 0);
            local v42 = TweenInfo.new(math.random(50, 300) / 100, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
            v41.ImageTransparency = math.random(0, 40) / 100;
            local v43 = l_TweenService_0:Create(v41, v42, {
                ImageTransparency = 0
            });
            local v44 = l_TweenService_0:Create(v41, v42, {
                BackgroundTransparency = 1
            });
            v43:Play();
            v44:Play();
        end;
        spawn(function() --[[ Line: 104 ]]
            while true do
                local l_ListFrame_0 = l_l_PDRewind_0_FirstChild_0.ListFrame;
                local v46 = {
                    Position = UDim2.new(0, 0, 0, 0)
                };
                local l_Linear_0 = Enum.EasingStyle.Linear;
                local v48 = TweenInfo.new(10, l_Linear_0 or Enum.EasingStyle.Quint);
                local v49 = l_TweenService_0:Create(l_ListFrame_0, v48, v46);
                v49:Play();
                v49.Completed:Wait();
                l_l_PDRewind_0_FirstChild_0.ListFrame.Position = UDim2.new(0, 0, 1, 0);
            end;
        end);
        v4.create(script.Parent.Parent.Parent, nil, 2, 30, false);
    else
        v4.create(script.Parent.Parent.Parent, script.PDCash, 2, 30, false);
    end;
    for v50 in string.gmatch(v28, "%S+") do
        local v51 = script.Word:Clone();
        v51.TextTransparency = 1;
        v51.Text = v50;
        v51.TextSize = l_CustomText_0.AbsoluteSize.X / 12;
        v51.Parent = l_CustomText_0;
        v51.LayoutOrder = 1;
        script.TypeSound:Play();
        script.TypeSound.PlaybackSpeed = math.random(100, 200) / 100;
        if v29 == "breath" then
            local v52 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
            local l_v52_0 = v52 --[[ copy: 13 -> 24 ]];
            spawn(function() --[[ Line: 137 ]]
                local l_v51_0 = v51;
                local v55 = {
                    TextTransparency = 0.4
                };
                local v56 = TweenInfo.new(1, Enum.EasingStyle.Quint);
                l_TweenService_0:Create(l_v51_0, v56, v55):Play();
                task.wait(1);
                l_TweenService_0:Create(v51, l_v52_0, {
                    TextTransparency = 0
                }):Play();
            end);
        else
            local v57 = {
                TextTransparency = 0
            };
            local v58 = TweenInfo.new(2, Enum.EasingStyle.Quint);
            l_TweenService_0:Create(v51, v58, v57):Play();
        end;
        local l_UIPadding_0 = v51.UIPadding;
        local v60 = {
            PaddingBottom = UDim.new(0, 5)
        };
        local v61 = TweenInfo.new(0.7, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_UIPadding_0, v61, v60):Play();
        l_UIPadding_0, v60 = v50:gsub("\"", "");
        if v60 == 1 then
            v37 = not v37;
        end;
        v61 = v37 and Enum.FontStyle.Italic or Enum.FontStyle.Normal;
        v51.FontFace = Font.fromName("Montserrat", Enum.FontWeight.Medium, v61);
        if v29 == "bold" then
            v51.FontFace = Font.fromName("Montserrat", Enum.FontWeight.ExtraBold, v61);
        end;
        if string.find(v50, "#") or string.find(v50, "\238\128\130") or string.match(v50, "^@[%w_]+") or string.match(v50, "%%$") or string.match(v50, "^<b>") then
            v51.FontFace = Font.fromName("Montserrat", Enum.FontWeight.ExtraBold, v61);
            if not string.find(v50, "@") then
                local v62 = v50:gsub("[^%d%.]", "");
                local v63 = v50:match("^[^%d%.]+") or "";
                local v64 = v50:match("([^%d%.]+)$") or "";
                if v62 and tonumber(v62) then
                    local v65 = tonumber(v62);
                    local v66 = #v62:match("^(%d+)");
                    local l_NumberValue_0 = Instance.new("NumberValue");
                    l_NumberValue_0.Value = 0;
                    local v68 = l_TweenService_0:Create(l_NumberValue_0, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {
                        Value = v65
                    });
                    l_NumberValue_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 184 ]]
                        local l_Value_0 = l_NumberValue_0.Value;
                        local v70 = string.format("%0" .. v66 .. "d", (math.floor(l_Value_0)));
                        v51.Text = v63 .. v70:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "") .. v64;
                    end);
                    v68:Play();
                    v68.Completed:Wait();
                    spawn(function() --[[ Line: 193 ]]
                        v51.BackgroundColor3 = Color3.fromHSV(math.random(1, 15) * 17 / 255, 1, 1);
                        for _ = 1, 6 do
                            local l_v51_1 = v51;
                            local v73 = {
                                BackgroundTransparency = 0
                            };
                            local v74 = TweenInfo.new(0.05, Enum.EasingStyle.Quint);
                            l_TweenService_0:Create(l_v51_1, v74, v73):Play();
                            task.wait(0.05);
                            l_v51_1 = v51;
                            v73 = {
                                BackgroundTransparency = 1
                            };
                            v74 = TweenInfo.new(0.05, Enum.EasingStyle.Quint);
                            l_TweenService_0:Create(l_v51_1, v74, v73):Play();
                            task.wait(0.05);
                        end;
                    end);
                end;
            else
                continue;
            end;
        end;
        task.wait(0.15);
    end;
    task.wait(4);
end;
return v0;