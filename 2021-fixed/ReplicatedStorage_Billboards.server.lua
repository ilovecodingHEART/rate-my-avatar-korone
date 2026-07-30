-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x1, if-expr -> __2021_if x1, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no if-then-else expressions on this client; lazy ternary helper
local function __2021_if(vcond, vthen, velse)
	if vcond() then
		return vthen();
	else
		return velse();
	end;
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = game:GetService("StarterGui");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Lighting_0 = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local l_CollectionService_0 = game:GetService("CollectionService");
local _ = game:GetService("PolicyService");
local l_TweenService_0 = game:GetService("TweenService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_l_LocalPlayer_0_Mouse_0 = l_LocalPlayer_0:GetMouse();
local v9 = require(l_ReplicatedStorage_0.Remotes);
local v10 = require(l_ReplicatedStorage_0.Roact);
local v11 = require(l_ReplicatedStorage_0.Packages.Promise);
local v12 = v9.Function("FetchAds");
tween = function(v13, v14, v15) --[[ Line: 19 ]] --[[ Name: tween ]]
    l_TweenService_0:Create(v13, TweenInfo.new(v14, Enum.EasingStyle.Quint), v15):Play();
end;
popupFrame = function(v16, v17) --[[ Line: 24 ]] --[[ Name: popupFrame ]]
    l_LocalPlayer_0.PlayerGui.ScreenGui.PopupAlert.Continue.Text = v16;
    l_LocalPlayer_0.PlayerGui.ScreenGui.PopupAlert.TextLabel.Text = v17;
    l_LocalPlayer_0.PlayerGui.ScreenGui.PopupAlert.Visible = true;
    l_LocalPlayer_0.PlayerGui.ScreenGui.PopupAlert.Position = UDim2.new(0.5, 0, 0.55, 0);
    tween(l_LocalPlayer_0.PlayerGui.ScreenGui.PopupAlert, 0.5, {
        Position = UDim2.new(0.5, 0, 0.5, 0)
    });
    tween(workspace.Camera, 0.5, {
        FieldOfView = 60
    });
    tween(l_Lighting_0.Blur, 0.5, {
        Size = 10
    });
end;
local function RoProTuff() --[[ Line: 34 ]] --[[ Name: roProAdActivated ]]
    print("It's RoPro bro!");
    popupFrame("OKAY, GOT IT!", "<font color=\"rgb(61, 157, 225)\">RoPro</font> is a fan made tool developed by @Dice_RoPro which adds tons of website features for desktop users. <font color=\"rgb(102, 200, 55)\">Quickly find empty servers,</font> <font color=\"rgb(255, 150, 40)\">try on any item combo with the Sandbox,</font> <font color=\"rgb(255, 70, 88)\">customize your profile with colorful themes,</font> and dozens more features!");
end;
local function QuataunMosueTexture() --[[ Line: 39 ]] --[[ Name: mouseEnter ]]
    l_l_LocalPlayer_0_Mouse_0.Icon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png";
end;
local function MouseIcon() --[[ Line: 43 ]] --[[ Name: mouseLeave ]]
    l_l_LocalPlayer_0_Mouse_0.Icon = "";
end;
local function _(v21) --[[ Line: 47 ]] --[[ Name: HalfAd ]]
    local v22 = v21.onActivated ~= nil;
    return v10.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        LayoutOrder = v21.layoutOrder, 
        Active = v22, 
        [v10.Event.Activated] = v21.onActivated, 
        [v10.Event.MouseEnter] = function() --[[ Line: 55 ]]
            v21.mouseEnter();
            if v22 then
                l_l_LocalPlayer_0_Mouse_0.Icon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png";
            end;
        end, 
        [v10.Event.MouseLeave] = function() --[[ Line: 61 ]]
            v21.mouseLeave();
            if v22 then
                l_l_LocalPlayer_0_Mouse_0.Icon = "";
            end;
        end
    }, {
        Left = v10.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v21.leftImage, 
            ScaleType = Enum.ScaleType.Fit, 
            Size = UDim2.fromScale(0.5, 1)
        }), 
        Right = v10.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v21.rightImage, 
            ScaleType = Enum.ScaleType.Fit, 
            Position = UDim2.fromScale(0.5, 0), 
            Size = UDim2.fromScale(0.5, 1)
        })
    });
end;
local function v26(v24) --[[ Line: 84 ]] --[[ Name: FullAd ]]
    local v25 = v24.onActivated ~= nil;
    return v10.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        Image = v24.image, 
        ScaleType = Enum.ScaleType.Crop, 
        Size = UDim2.fromScale(1, 1), 
        LayoutOrder = v24.layoutOrder, 
        Active = v25, 
        [v10.Event.Activated] = v24.onActivated, 
        [v10.Event.MouseEnter] = function() --[[ Line: 94 ]]
            v24.mouseEnter();
            if v25 then
                l_l_LocalPlayer_0_Mouse_0.Icon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png";
            end;
        end, 
        [v10.Event.MouseLeave] = function() --[[ Line: 100 ]]
            v24.mouseLeave();
            if v25 then
                l_l_LocalPlayer_0_Mouse_0.Icon = "";
            end;
        end
    });
end;
local function v31(v27) --[[ Line: 111 ]] --[[ Name: Ads ]]
    local v28 = {};
    for _, v30 in pairs(v27.purchasedAds) --[[ 2021 ]] do
        v28[v30.id] = v10.createElement(v26, {
            image = "rbxassetid://" .. v30.fields.imageId, 
            mouseEnter = v27.mouseEnter, 
            mouseLeave = v27.mouseLeave
        });
    end;
    return v10.createFragment({
        PurchasedAds = v10.createFragment(v28)
    });
end;
BillboardSide = function(v32) --[[ Line: 188 ]] --[[ Name: BillboardSide ]]
    return v10.createElement("SurfaceGui", {
        SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud, 
        ClipsDescendants = true, 
        AlwaysOnTop = v32.isHovered, 
        Face = v32.face
    }, {
        UIPageLayout = v10.createElement("UIPageLayout", {
            Circular = true, 
            GamepadInputEnabled = false, 
            ScrollWheelInputEnabled = false, 
            TouchInputEnabled = false, 
            EasingStyle = Enum.EasingStyle.Quad, 
            TweenTime = 1, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v10.Ref] = v32.uiPageLayoutRef
        }), 
        Ads = v32.ads
    });
end;
local v33 = v10.PureComponent:extend("Billboard");
v33.init = function(v34) --[[ Line: 211 ]] --[[ Name: init ]]
    v34.leftUIPageLayoutRef = v10.createRef();
    v34.rightUIPageLayoutRef = v10.createRef();
    v34:setState({
        hovering = false, 
        purchasedAds = {}, 
        adsAllowed = false
    });
end;
v33.render = function(v35) --[[ Line: 221 ]] --[[ Name: render ]]
    local v36 = v10.createElement(v31, {
        mouseEnter = function() --[[ Line: 223 ]] --[[ Name: mouseEnter ]]
            v35:setState({
                hovering = true
            });
        end, 
        mouseLeave = function() --[[ Line: 226 ]] --[[ Name: mouseLeave ]]
            v35:setState({
                hovering = false
            });
        end, 
        purchasedAds = __2021_if(function() return v35.state.adsAllowed end, function() return v35.state.purchasedAds end, function() return {} end)
    });
    return v10.createFragment({
        Front = v10.createElement(BillboardSide, {
            face = Enum.NormalId.Front, 
            uiPageLayoutRef = v35.leftUIPageLayoutRef, 
            isHovered = v35.state.hovering, 
            ads = v36
        }), 
        Back = v10.createElement(BillboardSide, {
            face = Enum.NormalId.Back, 
            uiPageLayoutRef = v35.rightUIPageLayoutRef, 
            isHovered = v35.state.hovering, 
            ads = v36
        })
    });
end;
local v37 = nil;
task.spawn(function() --[[ Line: 248 ]]
    while true do
        v37 = v11.try(function() --[[ Line: 250 ]]
            return v12:InvokeServer();
        end);
        task.wait(60);
    end;
end);
v33.didMount = function(v38) --[[ Line: 257 ]] --[[ Name: didMount ]]
    task.defer(function() --[[ Line: 258 ]]
        while true do
            task.wait(math.random(30, 40));
            v38.leftUIPageLayoutRef:getValue():Next();
            v38.rightUIPageLayoutRef:getValue():Next();
        end;
    end);
    task.defer(function() --[[ Line: 265 ]]
        local l_PolicyInfoForPlayerAsync_0 = game:GetService("PolicyService"):GetPolicyInfoForPlayerAsync(game.Players.LocalPlayer);
        v38:setState({
            adsAllowed = l_PolicyInfoForPlayerAsync_0.AreAdsAllowed
        });
    end);
    task.defer(function() --[[ Line: 271 ]]
        v38:setState({
            purchasedAds = v37:expect()
        });
        task.defer(function() --[[ Line: 275 ]]
            local v40 = #v37:expect();
            if v40 > 0 then
                local v41 = math.random(1, v40) - 1;
                v38.leftUIPageLayoutRef:getValue():JumpToIndex(v41);
                v38.rightUIPageLayoutRef:getValue():JumpToIndex(v41);
            end;
        end);
        while true do
            task.wait(60);
            v38:setState({
                purchasedAds = v37:expect()
            });
        end;
    end);
end;
for _, v43 in l_CollectionService_0:GetTagged("Billboard") do
    v10.mount(v10.createElement(v33), v43);
end;