-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ButtonFactory_0 = require(script:WaitForChild("Factory"):WaitForChild("ButtonFactory"));
local l_TextButtonFactory_0 = require(script:WaitForChild("Factory"):WaitForChild("TextButtonFactory"));
local _ = require(script:WaitForChild("Packages"):WaitForChild("NexusInstance"));
local l_Button_0 = require(script:WaitForChild("Button"));
local l_ControllerIcon_0 = require(script:WaitForChild("ControllerIcon"));
local l_ThemedFrame_0 = require(script:WaitForChild("ThemedFrame"));
return (setmetatable({
    ButtonFactory = l_ButtonFactory_0, 
    TextButtonFactory = l_TextButtonFactory_0, 
    ControllerIcon = l_ControllerIcon_0, 
    ThemedFrame = l_ThemedFrame_0
}, l_Button_0));