-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.Types);
return function(v1) --[[ Line: 3 ]]
    local v2 = v1.State(true);
    local v3 = v1.State(false);
    local v4 = v1.State(false);
    local v5 = v1.State(false);
    local v6 = v1.State(false);
    local v7 = v1.State(false);
    local v8 = v1.State(false);
    local function v11(v9) --[[ Line: 12 ]] --[[ Name: helpMarker ]]
        -- upvalues: v1 (copy)
        v1.PushConfig({
            TextColor = v1._config.TextDisabledColor
        });
        local v10 = v1.Text({
            "(?)"
        });
        v1.PopConfig();
        v1.PushConfig({
            ContentWidth = UDim.new(0, 350)
        });
        if v10.hovered() then
            v1.Tooltip({
                v9
            });
        end;
        v1.PopConfig();
    end;
    local function _(v12, v13) --[[ Line: 24 ]] --[[ Name: textAndHelpMarker ]]
        -- upvalues: v1 (copy), v11 (copy)
        v1.SameLine();
        v1.Text({
            v12
        });
        v11(v13);
        v1.End();
    end;
    local v76 = {
        Basic = function() --[[ Line: 35 ]] --[[ Name: Basic ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Basic"
            });
            v1.SeparatorText({
                "Basic"
            });
            local v15 = v1.State(1);
            v1.Button({
                "Button"
            });
            v1.SmallButton({
                "SmallButton"
            });
            v1.Text({
                "Text"
            });
            v1.TextWrapped({
                string.rep("Text Wrapped ", 5)
            });
            v1.TextColored({
                "Colored Text", 
                Color3.fromRGB(255, 128, 0)
            });
            v1.Text({
                "Rich Text: <b>bold text</b> <i>italic text</i> <u>underline text</u> <s>strikethrough text</s> <font color= \"rgb(240, 40, 10)\">red text</font> <font size=\"32\">bigger text</font>", 
                true, 
                nil, 
                true
            });
            v1.SameLine();
            v1.RadioButton({
                "Index '1'", 
                1
            }, {
                index = v15
            });
            v1.RadioButton({
                "Index 'two'", 
                "two"
            }, {
                index = v15
            });
            if v1.RadioButton({
                "Index 'false'", 
                false
            }, {
                index = v15
            }).active() == false and v1.SmallButton({
                "Select last"
            }).clicked() then
                v15:set(false);
            end;
            v1.End();
            v1.Text({
                "The Index is: " .. tostring(v15.value)
            });
            v1.SeparatorText({
                "Inputs"
            });
            v1.InputNum({});
            v1.DragNum({});
            v1.SliderNum({});
            v1.End();
        end, 
        Image = function() --[[ Line: 71 ]] --[[ Name: Image ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Image"
            });
            v1.SeparatorText({
                "Image Controls"
            });
            local v16 = v1.State("rbxasset://textures/ui/common/robux.png");
            local v17 = v1.State(UDim2.fromOffset(100, 100));
            local v18 = v1.State(Rect.new(0, 0, 0, 0));
            local v19 = v1.State(Enum.ScaleType.Stretch);
            local v20 = v1.State(false);
            local v22 = v1.ComputedState(v20, function(v21) --[[ Line: 81 ]]
                return v21 and Enum.ResamplerMode.Pixelated or Enum.ResamplerMode.Default;
            end);
            local v23 = v1.State(v1._config.ImageColor);
            local v24 = v1.State(v1._config.ImageTransparency);
            v1.InputColor4({
                "Image Tint"
            }, {
                color = v23, 
                transparency = v24
            });
            v1.Combo({
                "Asset"
            }, {
                index = v16
            });
            v1.Selectable({
                "Robux Small", 
                "rbxasset://textures/ui/common/robux.png"
            }, {
                index = v16
            });
            v1.Selectable({
                "Robux Large", 
                "rbxasset://textures//ui/common/robux@3x.png"
            }, {
                index = v16
            });
            v1.Selectable({
                "Loading Texture", 
                "rbxasset://textures//loading/darkLoadingTexture.png"
            }, {
                index = v16
            });
            v1.Selectable({
                "Hue-Saturation Gradient", 
                "rbxasset://textures//TagEditor/huesatgradient.png"
            }, {
                index = v16
            });
            v1.Selectable({
                "famfamfam.png (WHY?)", 
                "rbxasset://textures//TagEditor/famfamfam.png"
            }, {
                index = v16
            });
            v1.End();
            v1.SliderUDim2({
                "Image Size", 
                nil, 
                nil, 
                UDim2.new(1, 240, 1, 240)
            }, {
                number = v17
            });
            v1.SliderRect({
                "Image Rect", 
                nil, 
                nil, 
                Rect.new(256, 256, 256, 256)
            }, {
                number = v18
            });
            v1.Combo({
                "Scale Type"
            }, {
                index = v19
            });
            v1.Selectable({
                "Stretch", 
                Enum.ScaleType.Stretch
            }, {
                index = v19
            });
            v1.Selectable({
                "Fit", 
                Enum.ScaleType.Fit
            }, {
                index = v19
            });
            v1.Selectable({
                "Crop", 
                Enum.ScaleType.Crop
            }, {
                index = v19
            });
            v1.End();
            v1.Checkbox({
                "Pixelated"
            }, {
                isChecked = v20
            });
            v1.PushConfig({
                ImageColor = v23:get(), 
                ImageTransparency = v24:get()
            });
            v1.Image({
                v16:get(), 
                v17:get(), 
                v18:get(), 
                v19:get(), 
                v22:get()
            });
            v1.PopConfig();
            v1.SeparatorText({
                "Tile"
            });
            local v25 = v1.State(UDim2.fromScale(0.5, 0.5));
            v1.SliderUDim2({
                "Tile Size", 
                nil, 
                nil, 
                UDim2.new(1, 240, 1, 240)
            }, {
                number = v25
            });
            v1.PushConfig({
                ImageColor = v23:get(), 
                ImageTransparency = v24:get()
            });
            v1.Image({
                "rbxasset://textures/grid2.png", 
                v17:get(), 
                nil, 
                Enum.ScaleType.Tile, 
                v22:get(), 
                v25:get()
            });
            v1.PopConfig();
            v1.SeparatorText({
                "Slice"
            });
            local v26 = v1.State(1);
            v1.SliderNum({
                "Image Slice Scale", 
                0.1, 
                0.1, 
                5
            }, {
                number = v26
            });
            v1.PushConfig({
                ImageColor = v23:get(), 
                ImageTransparency = v24:get()
            });
            v1.Image({
                "rbxasset://textures/ui/chatBubble_blue_notify_bkg.png", 
                v17:get(), 
                nil, 
                Enum.ScaleType.Slice, 
                v22:get(), 
                nil, 
                Rect.new(12, 12, 56, 56), 
                1
            }, v26:get());
            v1.PopConfig();
            v1.SeparatorText({
                "Image Button"
            });
            local v27 = v1.State(0);
            v1.SameLine();
            v1.PushConfig({
                ImageColor = v23:get(), 
                ImageTransparency = v24:get()
            });
            if v1.ImageButton({
                "rbxasset://textures/AvatarCompatibilityPreviewer/add.png", 
                UDim2.fromOffset(20, 20)
            }).clicked() then
                v27:set(v27.value + 1);
            end;
            v1.PopConfig();
            v1.Text({
                (("Click count: %*"):format(v27.value))
            });
            v1.End();
            v1.End();
        end, 
        Selectable = function() --[[ Line: 162 ]] --[[ Name: Selectable ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Selectable"
            });
            local v28 = v1.State(2);
            v1.Selectable({
                "Selectable #1", 
                1
            }, {
                index = v28
            });
            v1.Selectable({
                "Selectable #2", 
                2
            }, {
                index = v28
            });
            if v1.Selectable({
                "Double click Selectable", 
                3, 
                true
            }, {
                index = v28
            }).doubleClicked() then
                v28:set(3);
            end;
            v1.Selectable({
                "Impossible to select", 
                4, 
                true
            }, {
                index = v28
            });
            if v1.Button({
                "Select last"
            }).clicked() then
                v28:set(4);
            end;
            v1.Selectable({
                "Independent Selectable"
            });
            v1.End();
        end, 
        Combo = function() --[[ Line: 182 ]] --[[ Name: Combo ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Combo"
            });
            v1.PushConfig({
                ContentWidth = UDim.new(1, -200)
            });
            local v29 = v1.State("No Selection");
            local v30 = nil;
            local v31 = nil;
            v1.SameLine();
            v30 = v1.Checkbox({
                "No Preview"
            });
            v31 = v1.Checkbox({
                "No Button"
            });
            if v30.checked() and v31.isChecked.value == true then
                v31.isChecked:set(false);
            end;
            if v31.checked() and v30.isChecked.value == true then
                v30.isChecked:set(false);
            end;
            v1.End();
            v1.Combo({
                "Basic Usage", 
                v31.isChecked:get(), 
                v30.isChecked:get()
            }, {
                index = v29
            });
            v1.Selectable({
                "Select 1", 
                "One"
            }, {
                index = v29
            });
            v1.Selectable({
                "Select 2", 
                "Two"
            }, {
                index = v29
            });
            v1.Selectable({
                "Select 3", 
                "Three"
            }, {
                index = v29
            });
            v1.End();
            v1.ComboArray({
                "Using ComboArray"
            }, {
                index = "No Selection"
            }, {
                "Red", 
                "Green", 
                "Blue"
            });
            local v32 = {};
            for v33 = 1, 50 do
                table.insert(v32, (tostring(v33)));
            end;
            v1.ComboArray({
                "Height Test"
            }, {
                index = "1"
            }, v32);
            local v34 = v1.State("7 AM");
            v1.Combo({
                "Combo with Inner widgets"
            }, {
                index = v34
            });
            v1.Tree({
                "Morning Shifts"
            });
            v1.Selectable({
                "Shift at 7 AM", 
                "7 AM"
            }, {
                index = v34
            });
            v1.Selectable({
                "Shift at 11 AM", 
                "11 AM"
            }, {
                index = v34
            });
            v1.Selectable({
                "Shift at 3 PM", 
                "3 PM"
            }, {
                index = v34
            });
            v1.End();
            v1.Tree({
                "Night Shifts"
            });
            v1.Selectable({
                "Shift at 6 PM", 
                "6 PM"
            }, {
                index = v34
            });
            v1.Selectable({
                "Shift at 9 PM", 
                "9 PM"
            }, {
                index = v34
            });
            v1.End();
            v1.End();
            local v35 = v1.ComboEnum({
                "Using ComboEnum"
            }, {
                index = Enum.UserInputState.Begin
            }, Enum.UserInputState);
            v1.Text({
                "Selected: " .. v35.index:get().Name
            });
            v1.PopConfig();
            v1.End();
        end, 
        Tree = function() --[[ Line: 245 ]] --[[ Name: Tree ]]
            -- upvalues: v1 (copy), v11 (copy)
            v1.Tree({
                "Trees"
            });
            v1.Tree({
                "Tree using SpanAvailWidth", 
                true
            });
            v11("SpanAvailWidth determines if the Tree is selectable from its entire with, or only the text area");
            v1.End();
            local v36 = v1.Tree({
                "Tree with Children"
            });
            v1.Text({
                "Im inside the first tree!"
            });
            v1.Button({
                "Im a button inside the first tree!"
            });
            v1.Tree({
                "Im a tree inside the first tree!"
            });
            v1.Text({
                "I am the innermost text!"
            });
            v1.End();
            v1.End();
            v1.Checkbox({
                "Toggle above tree"
            }, {
                isChecked = v36.state.isUncollapsed
            });
            v1.End();
        end, 
        CollapsingHeader = function() --[[ Line: 271 ]] --[[ Name: CollapsingHeader ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Collapsing Headers"
            });
            v1.CollapsingHeader({
                "A header"
            });
            v1.Text({
                "This is under the first header!"
            });
            v1.End();
            local v37 = v1.State(false);
            v1.CollapsingHeader({
                "Another header"
            }, {
                isUncollapsed = v37
            });
            if v1.Button({
                "Shhh... secret button!"
            }).clicked() then
                v37:set(true);
            end;
            v1.End();
            v1.End();
        end, 
        Group = function() --[[ Line: 292 ]] --[[ Name: Group ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Groups"
            });
            v1.SameLine();
            v1.Group();
            v1.Text({
                "I am in group A"
            });
            v1.Button({
                "Im also in A"
            });
            v1.End();
            v1.Separator();
            v1.Group();
            v1.Text({
                "I am in group B"
            });
            v1.Button({
                "Im also in B"
            });
            v1.Button({
                "Also group B"
            });
            v1.End();
            v1.End();
            v1.End();
        end, 
        Tab = function() --[[ Line: 319 ]] --[[ Name: Tab ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Tabs"
            });
            v1.Tree({
                "Simple"
            });
            v1.TabBar();
            v1.Tab({
                "Apples"
            });
            v1.Text({
                "Who loves apples?"
            });
            v1.End();
            v1.Tab({
                "Broccoli"
            });
            v1.Text({
                "And what about broccoli?"
            });
            v1.End();
            v1.Tab({
                "Carrots"
            });
            v1.Text({
                "But carrots are the best."
            });
            v1.End();
            v1.End();
            v1.Separator();
            v1.Text({
                "Very important questions."
            });
            v1.End();
            v1.Tree({
                "Closable"
            });
            local v38 = v1.State(true);
            local v39 = v1.State(true);
            local v40 = v1.State(true);
            v1.TabBar();
            v1.Tab({
                "\240\159\141\142", 
                true
            }, {
                isOpened = v38
            });
            v1.Text({
                "Who loves apples?"
            });
            if v1.Button({
                "I don't like apples."
            }).clicked() then
                v38:set(false);
            end;
            v1.End();
            v1.Tab({
                "\240\159\165\166", 
                true
            }, {
                isOpened = v39
            });
            v1.Text({
                "And what about broccoli?"
            });
            if v1.Button({
                "Not for me."
            }).clicked() then
                v39:set(false);
            end;
            v1.End();
            v1.Tab({
                "\240\159\165\149", 
                true
            }, {
                isOpened = v40
            });
            v1.Text({
                "But carrots are the best."
            });
            if v1.Button({
                "I disagree with you."
            }).clicked() then
                v40:set(false);
            end;
            v1.End();
            v1.End();
            v1.Separator();
            if v1.Button({
                "Actually, let me reconsider it."
            }).clicked() then
                v38:set(true);
                v39:set(true);
                v40:set(true);
            end;
            v1.End();
            v1.End();
        end, 
        Indent = function() --[[ Line: 394 ]] --[[ Name: Indent ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Indents"
            });
            v1.Text({
                "Not Indented"
            });
            v1.Indent();
            v1.Text({
                "Indented"
            });
            v1.Indent({
                7
            });
            v1.Text({
                "Indented by 7 more pixels"
            });
            v1.End();
            v1.Indent({
                -7
            });
            v1.Text({
                "Indented by 7 less pixels"
            });
            v1.End();
            v1.End();
            v1.End();
        end, 
        Input = function() --[[ Line: 416 ]] --[[ Name: Input ]]
            -- upvalues: v1 (copy), v11 (copy)
            v1.Tree({
                "Input"
            });
            local v41 = v1.State(false);
            local v42 = v1.State(false);
            local v43 = v1.State(0);
            local v44 = v1.State(100);
            local v45 = v1.State(1);
            local v46 = v1.State("%d");
            v1.PushConfig({
                ContentWidth = UDim.new(1, -120)
            });
            local v47 = v1.InputNum({
                [v1.Args.InputNum.Text] = "Input Number", 
                [v1.Args.InputNum.NoButtons] = v42.value, 
                [v1.Args.InputNum.Min] = v43.value, 
                [v1.Args.InputNum.Max] = v44.value, 
                [v1.Args.InputNum.Increment] = v45.value, 
                [v1.Args.InputNum.Format] = {
                    v46.value
                }
            });
            v1.PopConfig();
            v1.Text({
                "The Value is: " .. v47.number.value
            });
            if v1.Button({
                "Randomize Number"
            }).clicked() then
                v47.number:set(math.random(1, 99));
            end;
            local v48 = v1.Checkbox({
                "NoField"
            }, {
                isChecked = v41
            });
            local v49 = v1.Checkbox({
                "NoButtons"
            }, {
                isChecked = v42
            });
            if v48.checked() and v49.isChecked.value == true then
                v49.isChecked:set(false);
            end;
            if v49.checked() and v48.isChecked.value == true then
                v48.isChecked:set(false);
            end;
            v1.PushConfig({
                ContentWidth = UDim.new(1, -120)
            });
            v1.InputVector2({
                "InputVector2"
            });
            v1.InputVector3({
                "InputVector3"
            });
            v1.InputUDim({
                "InputUDim"
            });
            v1.InputUDim2({
                "InputUDim2"
            });
            local v50 = v1.State(false);
            local v51 = v1.State(false);
            local v52 = v1.State(Color3.new());
            local v53 = v1.State(0);
            v1.SliderNum({
                "Transparency", 
                0.01, 
                0, 
                1
            }, {
                number = v53
            });
            v1.InputColor3({
                "InputColor3", 
                v50:get(), 
                v51:get()
            }, {
                color = v52
            });
            v1.InputColor4({
                "InputColor4", 
                v50:get(), 
                v51:get()
            }, {
                color = v52, 
                transparency = v53
            });
            v1.SameLine();
            v1.Text({
                v52:get():ToHex()
            });
            v1.Checkbox({
                "Use Floats"
            }, {
                isChecked = v50
            });
            v1.Checkbox({
                "Use HSV"
            }, {
                isChecked = v51
            });
            v1.End();
            v1.PopConfig();
            v1.Separator();
            v1.SameLine();
            v1.Text({
                "Slider Numbers"
            });
            v11("ctrl + click slider number widgets to input a number");
            v1.End();
            v1.PushConfig({
                ContentWidth = UDim.new(1, -120)
            });
            v1.SliderNum({
                "Slide Int", 
                1, 
                1, 
                8
            });
            v1.SliderNum({
                "Slide Float", 
                0.01, 
                0, 
                100
            });
            v1.SliderNum({
                "Small Numbers", 
                0.001, 
                -2, 
                1, 
                "%f radians"
            });
            v1.SliderNum({
                "Odd Ranges", 
                0.001, 
                -3.141592653589793, 
                3.141592653589793, 
                "%f radians"
            });
            v1.SliderNum({
                "Big Numbers", 
                10000, 
                100000, 
                10000000
            });
            v1.SliderNum({
                "Few Numbers", 
                1, 
                0, 
                3
            });
            v1.PopConfig();
            v1.Separator();
            v1.SameLine();
            v1.Text({
                "Drag Numbers"
            });
            v11("ctrl + click or double click drag number widgets to input a number, hold shift/alt while dragging to increase/decrease speed");
            v1.End();
            v1.PushConfig({
                ContentWidth = UDim.new(1, -120)
            });
            v1.DragNum({
                "Drag Int"
            });
            v1.DragNum({
                "Slide Float", 
                0.001, 
                -10, 
                10
            });
            v1.DragNum({
                "Percentage", 
                1, 
                0, 
                100, 
                "%d %%"
            });
            v1.PopConfig();
            v1.End();
        end, 
        InputText = function() --[[ Line: 499 ]] --[[ Name: InputText ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Input Text"
            });
            local v54 = v1.InputText({
                "Input Text Test", 
                "Input Text here"
            });
            v1.Text({
                "The text is: " .. v54.text.value
            });
            v1.End();
        end, 
        MultiInput = function() --[[ Line: 508 ]] --[[ Name: MultiInput ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Multi-Component Input"
            });
            local v55 = v1.State(Vector2.new());
            local v56 = v1.State((Vector3.new()));
            local v57 = v1.State(UDim.new());
            local v58 = v1.State(UDim2.new());
            local v59 = v1.State(Color3.new());
            local v60 = v1.State(Rect.new(0, 0, 0, 0));
            v1.SeparatorText({
                "Input"
            });
            v1.InputVector2({}, {
                number = v55
            });
            v1.InputVector3({}, {
                number = v56
            });
            v1.InputUDim({}, {
                number = v57
            });
            v1.InputUDim2({}, {
                number = v58
            });
            v1.InputRect({}, {
                number = v60
            });
            v1.SeparatorText({
                "Drag"
            });
            v1.DragVector2({}, {
                number = v55
            });
            v1.DragVector3({}, {
                number = v56
            });
            v1.DragUDim({}, {
                number = v57
            });
            v1.DragUDim2({}, {
                number = v58
            });
            v1.DragRect({}, {
                number = v60
            });
            v1.SeparatorText({
                "Slider"
            });
            v1.SliderVector2({}, {
                number = v55
            });
            v1.SliderVector3({}, {
                number = v56
            });
            v1.SliderUDim({}, {
                number = v57
            });
            v1.SliderUDim2({}, {
                number = v58
            });
            v1.SliderRect({}, {
                number = v60
            });
            v1.SeparatorText({
                "Color"
            });
            v1.InputColor3({}, {
                color = v59
            });
            v1.InputColor4({}, {
                color = v59
            });
            v1.End();
        end, 
        Tooltip = function() --[[ Line: 550 ]] --[[ Name: Tooltip ]]
            -- upvalues: v1 (copy)
            v1.PushConfig({
                ContentWidth = UDim.new(0, 250)
            });
            v1.Tree({
                "Tooltip"
            });
            if v1.Text({
                "Hover over me to reveal a tooltip"
            }).hovered() then
                v1.Tooltip({
                    "I am some helpful tooltip text"
                });
            end;
            local v61 = v1.State("Hello ");
            local v62 = v1.State(1);
            if v1.InputNum({
                "# of repeat", 
                1, 
                1, 
                50
            }, {
                number = v62
            }).numberChanged() then
                v61:set(string.rep("Hello ", v62:get()));
            end;
            if v1.Checkbox({
                "Show dynamic text tooltip"
            }).state.isChecked.value then
                v1.Tooltip({
                    v61:get()
                });
            end;
            v1.End();
            v1.PopConfig();
        end, 
        Plotting = function() --[[ Line: 570 ]] --[[ Name: Plotting ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Plotting"
            });
            v1.SeparatorText({
                "Progress"
            });
            local v63 = os.clock() * 15;
            local v64 = v1.State(0);
            v64:set(math.clamp(math.abs(v63 % 100 - 50) - 7.5, 0, 35) / 35);
            v1.ProgressBar({
                "Progress Bar"
            }, {
                progress = v64
            });
            v1.ProgressBar({
                "Progress Bar", 
                (("%*/1753"):format((math.floor(v64:get() * 1753))))
            }, {
                progress = v64
            });
            v1.SeparatorText({
                "Graphs"
            });
            local v65 = v1.State({
                0.5, 
                0.8, 
                0.2, 
                0.9, 
                0.1, 
                0.6, 
                0.4, 
                0.7, 
                0.3, 
                0
            });
            v1.PlotHistogram({
                "Histogram", 
                100, 
                0, 
                1, 
                "random"
            }, {
                values = v65
            });
            v1.PlotLines({
                "Lines", 
                100, 
                0, 
                1, 
                "random"
            }, {
                values = v65
            });
            v65 = v1.State("Cos");
            local v66 = v1.State(37);
            local v67 = v1.State(0);
            local v68 = v1.State({});
            local v69 = v1.State(0);
            local v70 = v1.Checkbox({
                "Animate"
            });
            local v71 = v1.ComboArray({
                "Plotting Function"
            }, {
                index = v65
            }, {
                "Sin", 
                "Cos", 
                "Tan", 
                "Saw"
            });
            local v72 = v1.SliderNum({
                "Samples", 
                1, 
                1, 
                145, 
                "%d samples"
            }, {
                number = v66
            });
            if v1.SliderNum({
                "Baseline", 
                0.1, 
                -1, 
                1
            }, {
                number = v67
            }).numberChanged() then
                v68:set(v68.value, true);
            end;
            if v70.state.isChecked.value or v71.closed() or v72.numberChanged() or #v68.value == 0 then
                if v70.state.isChecked.value then
                    v69:set(v69.value + v1.Internal._deltaTime);
                end;
                local v73 = math.floor(v69.value * 30) - 1;
                local l_value_0 = v65.value;
                table.clear(v68.value);
                for v75 = 1, v66.value do
                    if l_value_0 == "Sin" then
                        v68.value[v75] = math.sin((math.rad(5 * (v75 + v73))));
                    elseif l_value_0 == "Cos" then
                        v68.value[v75] = math.cos((math.rad(5 * (v75 + v73))));
                    elseif l_value_0 == "Tan" then
                        v68.value[v75] = math.tan((math.rad(5 * (v75 + v73))));
                    elseif l_value_0 == "Saw" then
                        v68.value[v75] = v75 % 2 == v73 % 2 and 1 or -1;
                    end;
                end;
                v68:set(v68.value, true);
            end;
            v1.PlotHistogram({
                "Histogram", 
                100, 
                -1, 
                1, 
                "", 
                v67:get()
            }, {
                values = v68
            });
            v1.PlotLines({
                "Lines", 
                100, 
                -1, 
                1
            }, {
                values = v68
            });
            v1.End();
        end
    };
    local v77 = {
        "Basic", 
        "Image", 
        "Selectable", 
        "Combo", 
        "Tree", 
        "CollapsingHeader", 
        "Group", 
        "Tab", 
        "Indent", 
        "Input", 
        "MultiInput", 
        "InputText", 
        "Tooltip", 
        "Plotting"
    };
    local function v78() --[[ Line: 638 ]] --[[ Name: recursiveTree ]]
        -- upvalues: v1 (copy), v78 (copy)
        if v1.Tree({
            "Recursive Tree"
        }).state.isUncollapsed.value then
            v78();
        end;
        v1.End();
    end;
    local function v79(v80) --[[ Line: 648 ]] --[[ Name: recursiveWindow ]]
        -- upvalues: v1 (copy), v79 (copy)
        local v81 = nil;
        v1.Window({
            "Recursive Window"
        }, {
            size = v1.State(Vector2.new(175, 100)), 
            isOpened = v80
        });
        v81 = v1.Checkbox({
            "Recurse Again"
        });
        v1.End();
        if v81.isChecked.value then
            v79(v81.isChecked);
        end;
    end;
    local function v103() --[[ Line: 662 ]] --[[ Name: runtimeInfo ]]
        -- upvalues: v1 (copy), v4 (copy), v11 (copy)
        local v82 = v1.Window({
            "Runtime Info"
        }, {
            isOpened = v4
        });
        local l__lastVDOM_0 = v1.Internal._lastVDOM;
        local l__states_0 = v1.Internal._states;
        local v85 = v1.State(3);
        local v86 = v1.State(0);
        local v87 = v1.State(os.clock());
        v1.SameLine();
        v1.InputNum({
            [v1.Args.InputNum.Text] = "", 
            [v1.Args.InputNum.Format] = "%d Seconds", 
            [v1.Args.InputNum.Max] = 10
        }, {
            number = v85
        });
        if v1.Button({
            "Disable"
        }).clicked() then
            v1.Disabled = true;
            task.delay(v85:get(), function() --[[ Line: 677 ]]
                -- upvalues: v1 (ref)
                v1.Disabled = false;
            end);
        end;
        v1.End();
        local v88 = os.clock();
        local v89 = v88 - v87.value;
        v86.value = v86.value + (v89 - v86.value) * 0.2;
        v87.value = v88;
        v1.Text({
            string.format("Average %.3f ms/frame (%.1f FPS)", v86.value * 1000, 1 / v86.value)
        });
        v1.Text({
            string.format("Window Position: (%d, %d), Window Size: (%d, %d)", v82.position.value.X, v82.position.value.Y, v82.size.value.X, v82.size.value.Y)
        });
        v1.SameLine();
        v1.Text({
            "Enter an ID to learn more about it."
        });
        v11("every widget and state has an ID which Iris tracks to remember which widget is which. below lists all widgets and states, with their respective IDs");
        v1.End();
        v1.PushConfig({
            ItemWidth = UDim.new(1, -150)
        });
        local l_value_1 = v1.InputText({
            "ID field"
        }, {
            text = v1.State(v82.ID)
        }).state.text.value;
        v1.PopConfig();
        v1.Indent();
        local v91 = l__lastVDOM_0[l_value_1];
        local v92 = l__states_0[l_value_1];
        if v91 then
            v1.Table({
                1
            });
            v1.Text({
                string.format("The ID, \"%s\", is a widget", l_value_1)
            });
            v1.NextRow();
            v1.Text({
                string.format("Widget is type: %s", v91.type)
            });
            v1.NextRow();
            v1.Tree({
                "Widget has Args:"
            }, {
                isUncollapsed = v1.State(true)
            });
            for v93, v94 in v91.arguments do
                v1.Text({
                    v93 .. " - " .. tostring(v94)
                });
            end;
            v1.End();
            v1.NextRow();
            if v91.state then
                v1.Tree({
                    "Widget has State:"
                }, {
                    isUncollapsed = v1.State(true)
                });
                for v95, v96 in v91.state do
                    v1.Text({
                        v95 .. " - " .. tostring(v96.value)
                    });
                end;
                v1.End();
            end;
            v1.End();
        elseif v92 then
            v1.Table({
                1
            });
            v1.Text({
                string.format("The ID, \"%s\", is a state", l_value_1)
            });
            v1.NextRow();
            v1.Text({
                string.format("Value is type: %s, Value = %s", typeof(v92.value), (tostring(v92.value)))
            });
            v1.NextRow();
            v1.Tree({
                "state has connected widgets:"
            }, {
                isUncollapsed = v1.State(true)
            });
            for v97, v98 in v92.ConnectedWidgets do
                v1.Text({
                    v97 .. " - " .. v98.type
                });
            end;
            v1.End();
            v1.NextRow();
            v1.Text({
                string.format("state has: %d connected functions", #v92.ConnectedFunctions)
            });
            v1.End();
        else
            v1.Text({
                string.format("The ID, \"%s\", is not a state or widget", l_value_1)
            });
        end;
        v1.End();
        if v1.Tree({
            "Widgets"
        }).state.isUncollapsed.value then
            v91 = 0;
            v92 = "";
            for _, v100 in l__lastVDOM_0 do
                v91 = v91 + 1;
                v92 = v92 .. "\n" .. v100.ID .. " - " .. v100.type;
            end;
            v1.Text({
                "Number of Widgets: " .. v91
            });
            v1.Text({
                v92
            });
        end;
        v1.End();
        if v1.Tree({
            "States"
        }).state.isUncollapsed.value then
            v91 = 0;
            v92 = "";
            for v101, v102 in l__states_0 do
                v91 = v91 + 1;
                v92 = v92 .. "\n" .. v101 .. " - " .. tostring(v102.value);
            end;
            v1.Text({
                "Number of States: " .. v91
            });
            v1.Text({
                v92
            });
        end;
        v1.End();
        v1.End();
    end;
    local function v104() --[[ Line: 786 ]] --[[ Name: debugPanel ]]
        -- upvalues: v1 (copy), v8 (copy)
        v1.Window({
            "Debug Panel"
        }, {
            isOpened = v8
        });
        v1.CollapsingHeader({
            "Widgets"
        });
        v1.SeparatorText({
            "GuiService"
        });
        v1.Text({
            (("GuiOffset: %*"):format(v1.Internal._utility.GuiOffset))
        });
        v1.Text({
            (("MouseOffset: %*"):format(v1.Internal._utility.MouseOffset))
        });
        v1.SeparatorText({
            "UserInputService"
        });
        v1.Text({
            (("MousePosition: %*"):format((v1.Internal._utility.UserInputService:GetMouseLocation())))
        });
        v1.Text({
            (("MouseLocation: %*"):format((v1.Internal._utility.getMouseLocation())))
        });
        v1.Text({
            (("Left Control: %*"):format((v1.Internal._utility.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl))))
        });
        v1.Text({
            (("Right Control: %*"):format((v1.Internal._utility.UserInputService:IsKeyDown(Enum.KeyCode.RightControl))))
        });
        v1.End();
        v1.End();
    end;
    local function v105() --[[ Line: 807 ]] --[[ Name: recursiveMenu ]]
        -- upvalues: v1 (copy), v105 (copy)
        if v1.Menu({
            "Recursive"
        }).state.isOpened.value then
            v1.MenuItem({
                "New", 
                Enum.KeyCode.N, 
                Enum.ModifierKey.Ctrl
            });
            v1.MenuItem({
                "Open", 
                Enum.KeyCode.O, 
                Enum.ModifierKey.Ctrl
            });
            v1.MenuItem({
                "Save", 
                Enum.KeyCode.S, 
                Enum.ModifierKey.Ctrl
            });
            v1.Separator();
            v1.MenuToggle({
                "Autosave"
            });
            v1.MenuToggle({
                "Checked"
            });
            v1.Separator();
            v1.Menu({
                "Options"
            });
            v1.MenuItem({
                "Red"
            });
            v1.MenuItem({
                "Yellow"
            });
            v1.MenuItem({
                "Green"
            });
            v1.MenuItem({
                "Blue"
            });
            v1.Separator();
            v105();
            v1.End();
        end;
        v1.End();
    end;
    local function v106() --[[ Line: 828 ]] --[[ Name: mainMenuBar ]]
        -- upvalues: v1 (copy), v105 (copy), v2 (copy), v3 (copy), v6 (copy), v7 (copy), v4 (copy), v5 (copy), v8 (copy)
        v1.MenuBar();
        v1.Menu({
            "File"
        });
        v1.MenuItem({
            "New", 
            Enum.KeyCode.N, 
            Enum.ModifierKey.Ctrl
        });
        v1.MenuItem({
            "Open", 
            Enum.KeyCode.O, 
            Enum.ModifierKey.Ctrl
        });
        v1.MenuItem({
            "Save", 
            Enum.KeyCode.S, 
            Enum.ModifierKey.Ctrl
        });
        v105();
        if v1.MenuItem({
            "Quit", 
            Enum.KeyCode.Q, 
            Enum.ModifierKey.Alt
        }).clicked() then
            v2:set(false);
        end;
        v1.End();
        v1.Menu({
            "Examples"
        });
        v1.MenuToggle({
            "Recursive Window"
        }, {
            isChecked = v3
        });
        v1.MenuToggle({
            "Windowless"
        }, {
            isChecked = v6
        });
        v1.MenuToggle({
            "Main Menu Bar"
        }, {
            isChecked = v7
        });
        v1.End();
        v1.Menu({
            "Tools"
        });
        v1.MenuToggle({
            "Runtime Info"
        }, {
            isChecked = v4
        });
        v1.MenuToggle({
            "Style Editor"
        }, {
            isChecked = v5
        });
        v1.MenuToggle({
            "Debug Panel"
        }, {
            isChecked = v8
        });
        v1.End();
        v1.End();
    end;
    local function _() --[[ Line: 862 ]] --[[ Name: mainMenuBarExample ]]
        -- upvalues: v106 (copy)
        v106();
    end;
    local v108 = nil;
    v108 = function() --[[ Line: 877 ]]
        -- upvalues: v1 (copy), v11 (copy), v5 (copy)
        local v130 = {
            {
                "Sizing", 
                function() --[[ Line: 881 ]]
                    -- upvalues: v1 (ref), v11 (ref)
                    local v109 = v1.State({});
                    v1.SameLine();
                    if v1.Button({
                        "Update"
                    }).clicked() then
                        v1.UpdateGlobalConfig(v109.value);
                        v109:set({});
                    end;
                    v11("Update the global config with these changes.");
                    v1.End();
                    local function v113(v110, v111) --[[ Line: 895 ]] --[[ Name: SliderInput ]]
                        -- upvalues: v1 (ref), v109 (copy)
                        local v112 = v1[v110](v111, {
                            number = v1.WeakState(v1._config[v111[1]])
                        });
                        if v112.numberChanged() then
                            v109.value[v111[1]] = v112.number:get();
                        end;
                    end;
                    local function v116(v114) --[[ Line: 902 ]] --[[ Name: BooleanInput ]]
                        -- upvalues: v1 (ref), v109 (copy)
                        local v115 = v1.Checkbox(v114, {
                            isChecked = v1.WeakState(v1._config[v114[1]])
                        });
                        if v115.checked() or v115.unchecked() then
                            v109.value[v114[1]] = v115.isChecked:get();
                        end;
                    end;
                    v1.SeparatorText({
                        "Main"
                    });
                    v113("SliderVector2", {
                        "WindowPadding", 
                        nil, 
                        Vector2.zero, 
                        Vector2.new(20, 20)
                    });
                    v113("SliderVector2", {
                        "WindowResizePadding", 
                        nil, 
                        Vector2.zero, 
                        Vector2.new(20, 20)
                    });
                    v113("SliderVector2", {
                        "FramePadding", 
                        nil, 
                        Vector2.zero, 
                        Vector2.new(20, 20)
                    });
                    v113("SliderVector2", {
                        "ItemSpacing", 
                        nil, 
                        Vector2.zero, 
                        Vector2.new(20, 20)
                    });
                    v113("SliderVector2", {
                        "ItemInnerSpacing", 
                        nil, 
                        Vector2.zero, 
                        Vector2.new(20, 20)
                    });
                    v113("SliderVector2", {
                        "CellPadding", 
                        nil, 
                        Vector2.zero, 
                        Vector2.new(20, 20)
                    });
                    v113("SliderNum", {
                        "IndentSpacing", 
                        1, 
                        0, 
                        36
                    });
                    v113("SliderNum", {
                        "ScrollbarSize", 
                        1, 
                        0, 
                        20
                    });
                    v113("SliderNum", {
                        "GrabMinSize", 
                        1, 
                        0, 
                        20
                    });
                    v1.SeparatorText({
                        "Borders & Rounding"
                    });
                    v113("SliderNum", {
                        "FrameBorderSize", 
                        0.1, 
                        0, 
                        1
                    });
                    v113("SliderNum", {
                        "WindowBorderSize", 
                        0.1, 
                        0, 
                        1
                    });
                    v113("SliderNum", {
                        "PopupBorderSize", 
                        0.1, 
                        0, 
                        1
                    });
                    v113("SliderNum", {
                        "SeparatorTextBorderSize", 
                        1, 
                        0, 
                        20
                    });
                    v113("SliderNum", {
                        "FrameRounding", 
                        1, 
                        0, 
                        12
                    });
                    v113("SliderNum", {
                        "GrabRounding", 
                        1, 
                        0, 
                        12
                    });
                    v113("SliderNum", {
                        "PopupRounding", 
                        1, 
                        0, 
                        12
                    });
                    v1.SeparatorText({
                        "Widgets"
                    });
                    v113("SliderVector2", {
                        "DisplaySafeAreaPadding", 
                        nil, 
                        Vector2.zero, 
                        Vector2.new(20, 20)
                    });
                    v113("SliderVector2", {
                        "SeparatorTextPadding", 
                        nil, 
                        Vector2.zero, 
                        Vector2.new(36, 36)
                    });
                    v113("SliderUDim", {
                        "ItemWidth", 
                        nil, 
                        UDim.new(), 
                        UDim.new(1, 200)
                    });
                    v113("SliderUDim", {
                        "ContentWidth", 
                        nil, 
                        UDim.new(), 
                        UDim.new(1, 200)
                    });
                    v113("SliderNum", {
                        "ImageBorderSize", 
                        1, 
                        0, 
                        12
                    });
                    local v117 = v1.ComboEnum({
                        "WindowTitleAlign"
                    }, {
                        index = v1.WeakState(v1._config.WindowTitleAlign)
                    }, Enum.LeftRight);
                    if v117.closed() then
                        v109.value.WindowTitleAlign = v117.index:get();
                    end;
                    v116({
                        "RichText"
                    });
                    v116({
                        "TextWrapped"
                    });
                    v1.SeparatorText({
                        "Config"
                    });
                    v116({
                        "UseScreenGUIs"
                    });
                    v113("DragNum", {
                        "DisplayOrderOffset", 
                        1, 
                        0
                    });
                    v113("DragNum", {
                        "ZIndexOffset", 
                        1, 
                        0
                    });
                    v113("SliderNum", {
                        "MouseDoubleClickTime", 
                        0.1, 
                        0, 
                        5
                    });
                    v113("SliderNum", {
                        "MouseDoubleClickMaxDist", 
                        0.1, 
                        0, 
                        20
                    });
                end
            }, 
            {
                "Colors", 
                function() --[[ Line: 952 ]]
                    -- upvalues: v1 (ref), v11 (ref)
                    local v118 = v1.State({});
                    v1.SameLine();
                    if v1.Button({
                        "Update"
                    }).clicked() then
                        v1.UpdateGlobalConfig(v118.value);
                        v118:set({});
                    end;
                    v11("Update the global config with these changes.");
                    v1.End();
                    for _, v120 in {
                        "Text", 
                        "TextDisabled", 
                        "WindowBg", 
                        "PopupBg", 
                        "Border", 
                        "BorderActive", 
                        "ScrollbarGrab", 
                        "TitleBg", 
                        "TitleBgActive", 
                        "TitleBgCollapsed", 
                        "MenubarBg", 
                        "FrameBg", 
                        "FrameBgHovered", 
                        "FrameBgActive", 
                        "Button", 
                        "ButtonHovered", 
                        "ButtonActive", 
                        "Image", 
                        "SliderGrab", 
                        "SliderGrabActive", 
                        "Header", 
                        "HeaderHovered", 
                        "HeaderActive", 
                        "SelectionImageObject", 
                        "SelectionImageObjectBorder", 
                        "TableBorderStrong", 
                        "TableBorderLight", 
                        "TableRowBg", 
                        "TableRowBgAlt", 
                        "NavWindowingHighlight", 
                        "NavWindowingDimBg", 
                        "Separator", 
                        "CheckMark"
                    } do
                        local v121 = v1.InputColor4({
                            v120
                        }, {
                            color = v1.WeakState(v1._config[v120 .. "Color"]), 
                            transparency = v1.WeakState(v1._config[v120 .. "Transparency"])
                        });
                        if v121.numberChanged() then
                            v118.value[v120 .. "Color"] = v121.color:get();
                            v118.value[v120 .. "Transparency"] = v121.transparency:get();
                        end;
                    end;
                end
            }, 
            {
                "Fonts", 
                function() --[[ Line: 1015 ]]
                    -- upvalues: v1 (ref), v11 (ref)
                    local v122 = v1.State({});
                    v1.SameLine();
                    if v1.Button({
                        "Update"
                    }).clicked() then
                        v1.UpdateGlobalConfig(v122.value);
                        v122:set({});
                    end;
                    v11("Update the global config with these changes.");
                    v1.End();
                    local v123 = {
                        ["Code (default)"] = Font.fromEnum(Enum.Font.Code), 
                        ["Ubuntu (template)"] = Font.fromEnum(Enum.Font.Ubuntu), 
                        Arial = Font.fromEnum(Enum.Font.Arial), 
                        Highway = Font.fromEnum(Enum.Font.Highway), 
                        Roboto = Font.fromEnum(Enum.Font.Roboto), 
                        ["Roboto Mono"] = Font.fromEnum(Enum.Font.RobotoMono), 
                        ["Noto Sans"] = Font.new("rbxassetid://12187370747"), 
                        ["Builder Sans"] = Font.fromEnum(Enum.Font.BuilderSans), 
                        ["Builder Mono"] = Font.new("rbxassetid://16658246179"), 
                        Sono = Font.new("rbxassetid://12187374537")
                    };
                    v1.Text({
                        (("Current Font: %* Weight: %* Style: %*"):format(v1._config.TextFont.Family, v1._config.TextFont.Weight, v1._config.TextFont.Style))
                    });
                    v1.SeparatorText({
                        "Size"
                    });
                    local v124 = v1.SliderNum({
                        "Font Size", 
                        1, 
                        4, 
                        20
                    }, {
                        number = v1.WeakState(v1._config.TextSize)
                    });
                    if v124.numberChanged() then
                        v122.value.TextSize = v124.state.number:get();
                    end;
                    v1.SeparatorText({
                        "Properties"
                    });
                    local v125 = v1.WeakState(v1._config.TextFont.Family);
                    local v126 = v1.ComboEnum({
                        "Font Weight"
                    }, {
                        index = v1.WeakState(v1._config.TextFont.Weight)
                    }, Enum.FontWeight);
                    local v127 = v1.ComboEnum({
                        "Font Style"
                    }, {
                        index = v1.WeakState(v1._config.TextFont.Style)
                    }, Enum.FontStyle);
                    v1.SeparatorText({
                        "Fonts"
                    });
                    for v128, v129 in v123 do
                        v129 = Font.new(v129.Family, v126.state.index.value, v127.state.index.value);
                        v1.SameLine();
                        v1.PushConfig({
                            TextFont = v129
                        });
                        if v1.Selectable({
                            ("%* | \"The quick brown fox jumps over the lazy dog.\""):format(v128), 
                            v129.Family
                        }, {
                            index = v125
                        }).selected() then
                            v122.value.TextFont = v129;
                        end;
                        v1.PopConfig();
                        v1.End();
                    end;
                end
            }
        };
        v1.Window({
            "Style Editor"
        }, {
            isOpened = v5
        });
        v1.Text({
            "Customize the look of Iris in realtime."
        });
        local v131 = v1.State("Dark Theme");
        if v1.ComboArray({
            "Theme"
        }, {
            index = v131
        }, {
            "Dark Theme", 
            "Light Theme"
        }).closed() then
            if v131.value == "Dark Theme" then
                v1.UpdateGlobalConfig(v1.TemplateConfig.colorDark);
            elseif v131.value == "Light Theme" then
                v1.UpdateGlobalConfig(v1.TemplateConfig.colorLight);
            end;
        end;
        local v132 = v1.State("Classic Size");
        if v1.ComboArray({
            "Size"
        }, {
            index = v132
        }, {
            "Classic Size", 
            "Larger Size"
        }).closed() then
            if v132.value == "Classic Size" then
                v1.UpdateGlobalConfig(v1.TemplateConfig.sizeDefault);
            elseif v132.value == "Larger Size" then
                v1.UpdateGlobalConfig(v1.TemplateConfig.sizeClear);
            end;
        end;
        v1.SameLine();
        if v1.Button({
            "Revert"
        }).clicked() then
            v1.UpdateGlobalConfig(v1.TemplateConfig.colorDark);
            v1.UpdateGlobalConfig(v1.TemplateConfig.sizeDefault);
            v131:set("Dark Theme");
            v132:set("Classic Size");
        end;
        v11("Reset Iris to the default theme and size.");
        v1.End();
        v1.TabBar();
        for v133, v134 in ipairs(v130) do
            v1.Tab({
                v134[1]
            });
            v130[v133][2]();
            v1.End();
        end;
        v1.End();
        v1.Separator();
        v1.End();
    end;
    local function v140() --[[ Line: 1129 ]] --[[ Name: widgetEventInteractivity ]]
        -- upvalues: v1 (copy)
        v1.CollapsingHeader({
            "Widget Event Interactivity"
        });
        local v135 = v1.State(0);
        if v1.Button({
            "Click to increase Number"
        }).clicked() then
            v135:set(v135:get() + 1);
        end;
        v1.Text({
            "The Number is: " .. v135:get()
        });
        v1.Separator();
        local v136 = v1.State(false);
        local v137 = v1.State("clicked");
        v1.SameLine();
        v1.RadioButton({
            "clicked", 
            "clicked"
        }, {
            index = v137
        });
        v1.RadioButton({
            "rightClicked", 
            "rightClicked"
        }, {
            index = v137
        });
        v1.RadioButton({
            "doubleClicked", 
            "doubleClicked"
        }, {
            index = v137
        });
        v1.RadioButton({
            "ctrlClicked", 
            "ctrlClicked"
        }, {
            index = v137
        });
        v1.End();
        v1.SameLine();
        if v1.Button({
            v137:get() .. " to reveal text"
        })[v137:get()]() then
            v136:set(not v136:get());
        end;
        if v136:get() then
            v1.Text({
                "Here i am!"
            });
        end;
        v1.End();
        v1.Separator();
        local v138 = v1.State(0);
        v1.SameLine();
        if v1.Button({
            "Click to show text for 20 frames"
        }).clicked() then
            v138:set(20);
        end;
        if v138:get() > 0 then
            v1.Text({
                "Here i am!"
            });
        end;
        v1.End();
        v138:set((math.max(0, v138:get() - 1)));
        v1.Text({
            "Text Timer: " .. v138:get()
        });
        local v139 = v1.Checkbox({
            "Event-tracked checkbox"
        });
        v1.Indent();
        v1.Text({
            "unchecked: " .. tostring(v139.unchecked())
        });
        v1.Text({
            "checked: " .. tostring(v139.checked())
        });
        v1.End();
        v1.SameLine();
        if v1.Button({
            "Hover over me"
        }).hovered() then
            v1.Text({
                "The button is hovered"
            });
        end;
        v1.End();
        v1.End();
    end;
    local function v153() --[[ Line: 1200 ]] --[[ Name: widgetStateInteractivity ]]
        -- upvalues: v1 (copy)
        v1.CollapsingHeader({
            "Widget State Interactivity"
        });
        local v141 = v1.Checkbox({
            "Widget-Generated State"
        });
        v1.Text({
            (("isChecked: %*\n"):format(v141.state.isChecked.value))
        });
        local v142 = v1.State(false);
        local v143 = v1.Checkbox({
            "User-Generated State"
        }, {
            isChecked = v142
        });
        v1.Text({
            (("isChecked: %*\n"):format(v143.state.isChecked.value))
        });
        local v144 = v1.Checkbox({
            "Widget Coupled State"
        });
        local v145 = v1.Checkbox({
            "Coupled to above Checkbox"
        }, {
            isChecked = v144.state.isChecked
        });
        v1.Text({
            (("isChecked: %*\n"):format(v145.state.isChecked.value))
        });
        local v146 = v1.State(false);
        local _ = v1.Checkbox({
            "Widget and Code Coupled State"
        }, {
            isChecked = v146
        });
        if v1.Button({
            "Click to toggle above checkbox"
        }).clicked() then
            v146:set(not v146:get());
        end;
        v1.Text({
            (("isChecked: %*\n"):format(v146.value))
        });
        local v148 = v1.State(true);
        local v150 = v1.ComputedState(v148, function(v149) --[[ Line: 1223 ]]
            return not v149;
        end);
        local _ = v1.Checkbox({
            "ComputedState (dynamic coupling)"
        }, {
            isChecked = v148
        });
        local _ = v1.Checkbox({
            "Inverted of above checkbox"
        }, {
            isChecked = v150
        });
        v1.Text({
            (("isChecked: %*\n"):format(v150.value))
        });
        v1.End();
    end;
    local function v155() --[[ Line: 1233 ]] --[[ Name: dynamicStyle ]]
        -- upvalues: v1 (copy), v11 (copy)
        v1.CollapsingHeader({
            "Dynamic Styles"
        });
        local v154 = v1.State(0);
        v1.SameLine();
        if v1.Button({
            "Change Color"
        }).clicked() then
            v154:set(math.random());
        end;
        v1.Text({
            "Hue: " .. math.floor(v154:get() * 255)
        });
        v11("Using PushConfig with a changing value, this can be done with any config field");
        v1.End();
        v1.PushConfig({
            TextColor = Color3.fromHSV(v154:get(), 1, 1)
        });
        v1.Text({
            "Text with a unique and changable color"
        });
        v1.PopConfig();
        v1.End();
    end;
    local function v199() --[[ Line: 1254 ]] --[[ Name: tablesDemo ]]
        -- upvalues: v1 (copy), v11 (copy)
        local v156 = v1.State(false);
        v1.CollapsingHeader({
            "Tables & Columns"
        }, {
            isUncollapsed = v156
        });
        if v156.value == false then
            v1.End();
            return;
        else
            v1.Tree({
                "Basic"
            });
            v1.SameLine();
            v1.Text({
                "Table using NextColumn syntax:"
            });
            v11("calling Iris.NextColumn() in the inner loop,\nwhich automatically goes to the next row at the end.");
            v1.End();
            v1.Table({
                3
            });
            for v157 = 1, 4 do
                for v158 = 1, 3 do
                    v1.Text({
                        (("Row: %*, Column: %*"):format(v157, v158))
                    });
                    v1.NextColumn();
                end;
            end;
            v1.End();
            v1.Text({
                ""
            });
            v1.SameLine();
            v1.Text({
                "Table using NextColumn and NextRow syntax:"
            });
            v11("Calling Iris.NextColumn() in the inner loop and Iris.NextRow() in the outer loop,\nto acehieve a visually identical result. Technically they are not the same.");
            v1.End();
            v1.Table({
                3
            });
            for v159 = 1, 4 do
                for v160 = 1, 3 do
                    v1.Text({
                        (("Row: %*, Column: %*"):format(v159, v160))
                    });
                    v1.NextColumn();
                end;
                v1.NextRow();
            end;
            v1.End();
            v1.End();
            v1.Tree({
                "Headers, borders and backgrounds"
            });
            local v161 = v1.State(0);
            local v162 = v1.State(false);
            local v163 = v1.State(false);
            local v164 = v1.State(true);
            local v165 = v1.State(true);
            v1.Checkbox({
                "Table header row"
            }, {
                isChecked = v162
            });
            v1.Checkbox({
                "Table row backgrounds"
            }, {
                isChecked = v163
            });
            v1.Checkbox({
                "Table outer border"
            }, {
                isChecked = v164
            });
            v1.Checkbox({
                "Table inner borders"
            }, {
                isChecked = v165
            });
            v1.SameLine();
            v1.Text({
                "Cell contents"
            });
            v1.RadioButton({
                "Text", 
                0
            }, {
                index = v161
            });
            v1.RadioButton({
                "Fill button", 
                1
            }, {
                index = v161
            });
            v1.End();
            v1.Table({
                3, 
                v162.value, 
                v163.value, 
                v164.value, 
                v165.value
            });
            v1.SetHeaderColumnIndex(1);
            for v166 = 0, 4 do
                for v167 = 1, 3 do
                    if v161.value == 0 then
                        v1.Text({
                            (("Cell (%*, %*)"):format(v167, v166))
                        });
                    else
                        v1.Button({
                            ("Cell (%*, %*)"):format(v167, v166), 
                            UDim2.fromScale(1, 0)
                        });
                    end;
                    v1.NextColumn();
                end;
            end;
            v1.End();
            v1.End();
            v1.Tree({
                "Sizing"
            });
            v161 = v1.State(false);
            v162 = v1.State(false);
            v1.Checkbox({
                "Resizable"
            }, {
                isChecked = v161
            });
            v1.Checkbox({
                "Limit Table Width"
            }, {
                isChecked = v162
            });
            v1.SeparatorText({
                "stretch, equal"
            });
            v1.Table({
                3, 
                false, 
                true, 
                true, 
                true, 
                v161.value
            });
            for _ = 1, 3 do
                for _ = 1, 3 do
                    v1.Text({
                        "stretch"
                    });
                    v1.NextColumn();
                end;
            end;
            v1.End();
            v1.Table({
                3, 
                false, 
                true, 
                true, 
                true, 
                v161.value
            });
            for _ = 1, 3 do
                for v171 = 1, 3 do
                    v1.Text({
                        string.rep(string.char(64 + v171), 4 * v171)
                    });
                    v1.NextColumn();
                end;
            end;
            v1.End();
            v1.SeparatorText({
                "stretch, proportional"
            });
            v1.Table({
                3, 
                false, 
                true, 
                true, 
                true, 
                v161.value, 
                false, 
                true
            });
            for _ = 1, 3 do
                for _ = 1, 3 do
                    v1.Text({
                        "stretch"
                    });
                    v1.NextColumn();
                end;
            end;
            v1.End();
            v1.Table({
                3, 
                false, 
                true, 
                true, 
                true, 
                v161.value, 
                false, 
                true
            });
            for _ = 1, 3 do
                for v175 = 1, 3 do
                    v1.Text({
                        string.rep(string.char(64 + v175), 4 * v175)
                    });
                    v1.NextColumn();
                end;
            end;
            v1.End();
            v1.SeparatorText({
                "fixed, equal"
            });
            v1.Table({
                3, 
                false, 
                true, 
                true, 
                true, 
                v161.value, 
                true, 
                false, 
                v162.value
            });
            for _ = 1, 3 do
                for _ = 1, 3 do
                    v1.Text({
                        "fixed"
                    });
                    v1.NextColumn();
                end;
            end;
            v1.End();
            v1.Table({
                3, 
                false, 
                true, 
                true, 
                true, 
                v161.value, 
                true, 
                false, 
                v162.value
            });
            for _ = 1, 3 do
                for v179 = 1, 3 do
                    v1.Text({
                        string.rep(string.char(64 + v179), 4 * v179)
                    });
                    v1.NextColumn();
                end;
            end;
            v1.End();
            v1.SeparatorText({
                "fixed, proportional"
            });
            v1.Table({
                3, 
                false, 
                true, 
                true, 
                true, 
                v161.value, 
                true, 
                true, 
                v162.value
            });
            for _ = 1, 3 do
                for _ = 1, 3 do
                    v1.Text({
                        "fixed"
                    });
                    v1.NextColumn();
                end;
            end;
            v1.End();
            v1.Table({
                3, 
                false, 
                true, 
                true, 
                true, 
                v161.value, 
                true, 
                true, 
                v162.value
            });
            for _ = 1, 3 do
                for v183 = 1, 3 do
                    v1.Text({
                        string.rep(string.char(64 + v183), 4 * v183)
                    });
                    v1.NextColumn();
                end;
            end;
            v1.End();
            v1.End();
            v1.Tree({
                "Resizable"
            });
            v161 = v1.State(4);
            v162 = v1.State(3);
            v163 = v1.State(false);
            v164 = v1.State(true);
            v165 = v1.State(true);
            local v184 = v1.State(true);
            local v185 = v1.State(true);
            local v186 = v1.State(false);
            local v187 = v1.State(false);
            local v188 = v1.State(false);
            local v189 = v1.State(false);
            local v190 = v1.State(false);
            local v191 = v1.State(table.create(10, 100));
            v1.SliderNum({
                "Num Columns", 
                1, 
                1, 
                10
            }, {
                number = v161
            });
            v1.SliderNum({
                "Number of rows", 
                1, 
                0, 
                100
            }, {
                number = v162
            });
            v1.SameLine();
            v1.RadioButton({
                "Buttons", 
                true
            }, {
                index = v163
            });
            v1.RadioButton({
                "Text", 
                false
            }, {
                index = v163
            });
            v1.End();
            v1.Table({
                3
            });
            v1.Checkbox({
                "Show Header Row"
            }, {
                isChecked = v164
            });
            v1.NextColumn();
            v1.Checkbox({
                "Show Row Backgrounds"
            }, {
                isChecked = v165
            });
            v1.NextColumn();
            v1.Checkbox({
                "Show Outer Border"
            }, {
                isChecked = v184
            });
            v1.NextColumn();
            v1.Checkbox({
                "Show Inner Border"
            }, {
                isChecked = v185
            });
            v1.NextColumn();
            v1.Checkbox({
                "Resizable"
            }, {
                isChecked = v186
            });
            v1.NextColumn();
            v1.Checkbox({
                "Fixed Width"
            }, {
                isChecked = v187
            });
            v1.NextColumn();
            v1.Checkbox({
                "Proportional Width"
            }, {
                isChecked = v188
            });
            v1.NextColumn();
            v1.Checkbox({
                "Limit Table Width"
            }, {
                isChecked = v189
            });
            v1.NextColumn();
            v1.Checkbox({
                "Add extra"
            }, {
                isChecked = v190
            });
            v1.NextColumn();
            v1.End();
            for v192 = 1, v161.value do
                local v193 = v187.value == true and 1 or 0.05;
                local v194 = v187.value == true and 2 or 0.05;
                local v195 = v187.value == true and 480 or 1;
                v1.SliderNum({
                    ("Column %* Width"):format(v192), 
                    v193, 
                    v194, 
                    v195
                }, {
                    number = v1.TableState(v191.value, v192, function(v196) --[[ Line: 1507 ]]
                        -- upvalues: v191 (copy), v192 (copy)
                        v191.value[v192] = v196;
                        v191:set(v191.value, true);
                        return false;
                    end)
                });
            end;
            v1.PushConfig({
                NumColumns = v161.value
            });
            v1.Table({
                v161.value, 
                v164.value, 
                v165.value, 
                v184.value, 
                v185.value, 
                v186.value, 
                v187.value, 
                v188.value, 
                v189.value
            }, {
                widths = v191
            });
            v1.SetHeaderColumnIndex(1);
            for v197 = 0, v162:get() do
                for v198 = 1, v161.value do
                    if v197 == 0 then
                        if v163.value then
                            v1.Button({
                                (("H: %*"):format(v198))
                            });
                        else
                            v1.Text({
                                (("H: %*"):format(v198))
                            });
                        end;
                    elseif v163.value then
                        v1.Button({
                            (("R: %*, C: %*"):format(v197, v198))
                        });
                        v1.Button({
                            string.rep("...", v198)
                        });
                    else
                        v1.Text({
                            (("R: %*, C: %*"):format(v197, v198))
                        });
                        v1.Text({
                            string.rep("...", v198)
                        });
                    end;
                    v1.NextColumn();
                end;
            end;
            if v190.value then
                v1.Text({
                    "A really long piece of text!"
                });
            end;
            v1.End();
            v1.PopConfig();
            v1.End();
            v1.End();
            return;
        end;
    end;
    local function v205() --[[ Line: 1559 ]] --[[ Name: layoutDemo ]]
        -- upvalues: v1 (copy), v11 (copy)
        v1.CollapsingHeader({
            "Widget Layout"
        });
        v1.Tree({
            "Widget Alignment"
        });
        v1.Text({
            "Iris.SameLine has optional argument supporting horizontal and vertical alignments."
        });
        v1.Text({
            "This allows widgets to be place anywhere on the line."
        });
        v1.Separator();
        v1.SameLine();
        v1.Text({
            "By default child widgets will be aligned to the left."
        });
        v11("Iris.SameLine()\n\tIris.Button({ \"Button A\" })\n\tIris.Button({ \"Button B\" })\nIris.End()");
        v1.End();
        v1.SameLine();
        v1.Button({
            "Button A"
        });
        v1.Button({
            "Button B"
        });
        v1.End();
        v1.SameLine();
        v1.Text({
            "But can be aligned to the center."
        });
        v11("Iris.SameLine({ nil, nil, Enum.HorizontalAlignment.Center })\n\tIris.Button({ \"Button A\" })\n\tIris.Button({ \"Button B\" })\nIris.End()");
        v1.End();
        v1.SameLine({
            nil, 
            nil, 
            Enum.HorizontalAlignment.Center
        });
        v1.Button({
            "Button A"
        });
        v1.Button({
            "Button B"
        });
        v1.End();
        v1.SameLine();
        v1.Text({
            "Or right."
        });
        v11("Iris.SameLine({ nil, nil, Enum.HorizontalAlignment.Right })\n\tIris.Button({ \"Button A\" })\n\tIris.Button({ \"Button B\" })\nIris.End()");
        v1.End();
        v1.SameLine({
            nil, 
            nil, 
            Enum.HorizontalAlignment.Right
        });
        v1.Button({
            "Button A"
        });
        v1.Button({
            "Button B"
        });
        v1.End();
        v1.Separator();
        v1.SameLine();
        v1.Text({
            "You can also specify the padding."
        });
        v11("Iris.SameLine({ 0, nil, Enum.HorizontalAlignment.Center })\n\tIris.Button({ \"Button A\" })\n\tIris.Button({ \"Button B\" })\nIris.End()");
        v1.End();
        v1.SameLine({
            0, 
            nil, 
            Enum.HorizontalAlignment.Center
        });
        v1.Button({
            "Button A"
        });
        v1.Button({
            "Button B"
        });
        v1.End();
        v1.End();
        v1.Tree({
            "Widget Sizing"
        });
        v1.Text({
            "Nearly all widgets are the minimum size of the content."
        });
        v1.Text({
            "For example, text and button widgets will be the size of the text labels."
        });
        v1.Text({
            "Some widgets, such as the Image and Button have Size arguments will will set the size of them."
        });
        v1.Separator();
        v1.SameLine();
        v1.Text({
            "The button takes up the full screen-width."
        });
        v11("Iris.Button({ \"Button\", UDim2.fromScale(1, 0) })");
        v1.End();
        v1.Button({
            "Button", 
            UDim2.fromScale(1, 0)
        });
        v1.SameLine();
        v1.Text({
            "The button takes up half the screen-width."
        });
        v11("Iris.Button({ \"Button\", UDim2.fromScale(0.5, 0) })");
        v1.End();
        v1.Button({
            "Button", 
            UDim2.fromScale(0.5, 0)
        });
        v1.SameLine();
        v1.Text({
            "Combining with SameLine, the buttons can fill the screen width."
        });
        v11("The button will still be larger that the text size.");
        v1.End();
        local v200 = v1.State(2);
        v1.SliderNum({
            "Number of Buttons", 
            1, 
            1, 
            8
        }, {
            number = v200
        });
        v1.SameLine({
            0, 
            nil, 
            Enum.HorizontalAlignment.Center
        });
        for v201 = 1, v200.value do
            v1.Button({
                ("Button %*"):format(v201), 
                UDim2.fromScale(1 / v200.value, 0)
            });
        end;
        v1.End();
        v1.End();
        v1.Tree({
            "Content Width"
        });
        v200 = v1.State(50);
        local v202 = v1.State(Enum.Axis.X);
        v1.Text({
            "The Content Width is a size property which determines the width of input fields."
        });
        v1.SameLine();
        v1.Text({
            "By default the value is UDim.new(0.65, 0)"
        });
        v11("This is the default value from Dear ImGui.\nIt is 65% of the window width.");
        v1.End();
        v1.Text({
            "This works well, but sometimes we know how wide elements are going to be and want to maximise the space."
        });
        v1.Text({
            "Therefore, we can use Iris.PushConfig() to change the width"
        });
        v1.Separator();
        v1.SameLine();
        v1.Text({
            "Content Width = 150 pixels"
        });
        v11("UDim.new(0, 150)");
        v1.End();
        v1.PushConfig({
            ContentWidth = UDim.new(0, 150)
        });
        v1.DragNum({
            "number", 
            1, 
            0, 
            100
        }, {
            number = v200
        });
        v1.InputEnum({
            "axis"
        }, {
            index = v202
        }, Enum.Axis);
        v1.PopConfig();
        v1.SameLine();
        v1.Text({
            "Content Width = 50% window width"
        });
        v11("UDim.new(0.5, 0)");
        v1.End();
        v1.PushConfig({
            ContentWidth = UDim.new(0.5, 0)
        });
        v1.DragNum({
            "number", 
            1, 
            0, 
            100
        }, {
            number = v200
        });
        v1.InputEnum({
            "axis"
        }, {
            index = v202
        }, Enum.Axis);
        v1.PopConfig();
        v1.SameLine();
        v1.Text({
            "Content Width = -150 pixels from the right side"
        });
        v11("UDim.new(1, -150)");
        v1.End();
        v1.PushConfig({
            ContentWidth = UDim.new(1, -150)
        });
        v1.DragNum({
            "number", 
            1, 
            0, 
            100
        }, {
            number = v200
        });
        v1.InputEnum({
            "axis"
        }, {
            index = v202
        }, Enum.Axis);
        v1.PopConfig();
        v1.End();
        v1.Tree({
            "Content Height"
        });
        v200 = v1.State("a single line");
        v202 = v1.State(50);
        local v203 = v1.State(Enum.Axis.X);
        local v204 = v1.State(0);
        v204:set(math.clamp(math.abs(os.clock() * 15 % 100 - 50) - 7.5, 0, 35) / 35);
        v1.Text({
            "The Content Height is a size property that determines the minimum size of certain widgets."
        });
        v1.Text({
            "By default the value is UDim.new(0, 0), so there is no minimum height."
        });
        v1.Text({
            "We use Iris.PushConfig() to change this value."
        });
        v1.Separator();
        v1.SameLine();
        v1.Text({
            "Content Height = 0 pixels"
        });
        v11("UDim.new(0, 0)");
        v1.End();
        v1.InputText({
            "text"
        }, {
            text = v200
        });
        v1.ProgressBar({
            "progress"
        }, {
            progress = v204
        });
        v1.DragNum({
            "number", 
            1, 
            0, 
            100
        }, {
            number = v202
        });
        v1.ComboEnum({
            "axis"
        }, {
            index = v203
        }, Enum.Axis);
        v1.SameLine();
        v1.Text({
            "Content Height = 60 pixels"
        });
        v11("UDim.new(0, 60)");
        v1.End();
        v1.PushConfig({
            ContentHeight = UDim.new(0, 60)
        });
        v1.InputText({
            "text", 
            nil, 
            nil, 
            true
        }, {
            text = v200
        });
        v1.ProgressBar({
            "progress"
        }, {
            progress = v204
        });
        v1.DragNum({
            "number", 
            1, 
            0, 
            100
        }, {
            number = v202
        });
        v1.ComboEnum({
            "axis"
        }, {
            index = v203
        }, Enum.Axis);
        v1.PopConfig();
        v1.Text({
            "This property can be used to force the height of a text box."
        });
        v1.Text({
            "Just make sure you enable the MultiLine argument."
        });
        v1.End();
        v1.End();
    end;
    local function v206() --[[ Line: 1760 ]] --[[ Name: windowlessDemo ]]
        -- upvalues: v1 (copy), v11 (copy)
        v1.PushConfig({
            ItemWidth = UDim.new(0, 150)
        });
        v1.SameLine();
        v1.TextWrapped({
            "Windowless widgets"
        });
        v11("Widgets which are placed outside of a window will appear on the top left side of the screen.");
        v1.End();
        v1.Button({});
        v1.Tree({});
        v1.InputText({});
        v1.End();
        v1.PopConfig();
    end;
    return function() --[[ Line: 1780 ]]
        -- upvalues: v1 (copy), v2 (copy), v106 (copy), v140 (copy), v153 (copy), v78 (copy), v155 (copy), v77 (copy), v76 (copy), v199 (copy), v205 (copy), v3 (copy), v79 (copy), v4 (copy), v103 (copy), v8 (copy), v104 (copy), v5 (copy), v108 (ref), v6 (copy), v206 (copy), v7 (copy)
        local v207 = v1.State(false);
        local v208 = v1.State(false);
        local v209 = v1.State(false);
        local v210 = v1.State(true);
        local v211 = v1.State(false);
        local v212 = v1.State(false);
        local v213 = v1.State(false);
        local v214 = v1.State(false);
        local v215 = v1.State(false);
        if v2.value == false then
            v1.Checkbox({
                "Open main window"
            }, {
                isChecked = v2
            });
            return;
        else
            debug.profilebegin("Iris/Demo/Window");
            local v216 = v1.Window({
                [v1.Args.Window.Title] = "Iris Demo Window", 
                [v1.Args.Window.NoTitleBar] = v207.value, 
                [v1.Args.Window.NoBackground] = v208.value, 
                [v1.Args.Window.NoCollapse] = v209.value, 
                [v1.Args.Window.NoClose] = v210.value, 
                [v1.Args.Window.NoMove] = v211.value, 
                [v1.Args.Window.NoScrollbar] = v212.value, 
                [v1.Args.Window.NoResize] = v213.value, 
                [v1.Args.Window.NoNav] = v214.value, 
                [v1.Args.Window.NoMenu] = v215.value
            }, {
                size = v1.State(Vector2.new(600, 550)), 
                position = v1.State(Vector2.new(100, 25)), 
                isOpened = v2
            });
            if v216.state.isUncollapsed.value and v216.state.isOpened.value then
                debug.profilebegin("Iris/Demo/MenuBar");
                v106();
                debug.profileend();
                v1.Text({
                    "Iris says hello. (" .. v1.Internal._version .. ")"
                });
                debug.profilebegin("Iris/Demo/Options");
                v1.CollapsingHeader({
                    "Window Options"
                });
                v1.Table({
                    3, 
                    false, 
                    false, 
                    false
                });
                v1.Checkbox({
                    "NoTitleBar"
                }, {
                    isChecked = v207
                });
                v1.NextColumn();
                v1.Checkbox({
                    "NoBackground"
                }, {
                    isChecked = v208
                });
                v1.NextColumn();
                v1.Checkbox({
                    "NoCollapse"
                }, {
                    isChecked = v209
                });
                v1.NextColumn();
                v1.Checkbox({
                    "NoClose"
                }, {
                    isChecked = v210
                });
                v1.NextColumn();
                v1.Checkbox({
                    "NoMove"
                }, {
                    isChecked = v211
                });
                v1.NextColumn();
                v1.Checkbox({
                    "NoScrollbar"
                }, {
                    isChecked = v212
                });
                v1.NextColumn();
                v1.Checkbox({
                    "NoResize"
                }, {
                    isChecked = v213
                });
                v1.NextColumn();
                v1.Checkbox({
                    "NoNav"
                }, {
                    isChecked = v214
                });
                v1.NextColumn();
                v1.Checkbox({
                    "NoMenu"
                }, {
                    isChecked = v215
                });
                v1.NextColumn();
                v1.End();
                v1.End();
                debug.profileend();
                debug.profilebegin("Iris/Demo/Events");
                v140();
                debug.profileend();
                debug.profilebegin("Iris/Demo/States");
                v153();
                debug.profileend();
                debug.profilebegin("Iris/Demo/Recursive");
                v1.CollapsingHeader({
                    "Recursive Tree"
                });
                if v1.Tree({
                    "Recursive Tree"
                }).state.isUncollapsed.value then
                    v78();
                end;
                v1.End();
                v1.End();
                debug.profileend();
                debug.profilebegin("Iris/Demo/Style");
                v155();
                debug.profileend();
                v1.Separator();
                debug.profilebegin("Iris/Demo/Widgets");
                v1.CollapsingHeader({
                    "Widgets"
                });
                for _, v218 in v77 do
                    debug.profilebegin((("Iris/Demo/Widgets/%*"):format(v218)));
                    v76[v218]();
                    debug.profileend();
                end;
                v1.End();
                debug.profileend();
                debug.profilebegin("Iris/Demo/Tables");
                v199();
                debug.profileend();
                debug.profilebegin("Iris/Demo/Layout");
                v205();
                debug.profileend();
            end;
            v1.End();
            debug.profileend();
            if v3.value then
                v79(v3);
            end;
            if v4.value then
                v103();
            end;
            if v8.value then
                v104();
            end;
            if v5.value then
                v108();
            end;
            if v6.value then
                v206();
            end;
            if v7.value then
                v106();
            end;
            return v216;
        end;
    end;
end;