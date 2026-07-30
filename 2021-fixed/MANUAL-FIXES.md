# Manual fixes required (if-expressions / `continue` — do not compile on 2021)

Rewrite recipes are in REPORT-2021.md (section "Fixing scripts yourself").
Files are otherwise fixed and paste-ready. Total files: 14

## extracted/ReplicatedStorage_AdidasPackages__Index_kampfkarren_roact-hooks_0_5_1_roact-hook.781946b84f.lua
- line 74 [continue]: `continue;`

## extracted/ReplicatedStorage_Client_UI_UIRoot.lua
- line 74 [if-expr (could not auto-convert)]: `Group = if v29 then l_createElement_0(l_Group_0, {}, {`

## extracted/ReplicatedStorage_HypeTrainDebugClient_Iris.lua
- line 87 [if-expr (could not auto-convert)]: `v15.Parent = if v2._config.Parent then v2._config.Parent else v2._widgets[v16.type].ChildAdded(v16, {`

## extracted/ReplicatedStorage_HypeTrainDebugClient_Iris_widgets.lua
- line 77 [if-expr (could not auto-convert)]: `v8 = if v8.X + v9.X + 20 > v11.X then if v8.Y + v9.Y + 20 > v11.Y then v8 + Vector2.new(0, -(20 + v9.Y)) else `

## extracted/ReplicatedStorage_NexusVRCharacterModel_UI_View_EnigmaView.lua
- line 159 [if-expr (could not auto-convert)]: `v39 = if v40 then if v10.Offsets.LeftFoot then ("%sLeft Foot Tracker: %s"):format(v39, (("<font color=\"rgb(%s`
- line 160 [if-expr (could not auto-convert)]: `v39 = if v41 then if v10.Offsets.RightFoot then ("%s\nRight Foot Tracker: %s"):format(v39, (("<font color=\"rg`

## extracted/ReplicatedStorage_Packages__Index_kampfkarren_roact-hooks_0_5_1_roact-hooks.lua
- line 69 [continue]: `continue;`

## extracted/ServerScriptService_Cmdr_BuiltInCommands_Utility_runLines.lua
- line 26 [continue]: `continue`

## extracted/ServerScriptService_RobaseService_Promise.lua
- line 977 [if-expr (could not auto-convert)]: `Used to decrease the number of consumers by 1, and if there are no more,`

## extracted/ServerScriptService_RobaseService_Robase.lua
- line 48 [continue]: `continue`

## extracted/ServerScriptService_Shop.server.lua
- line 116 [continue]: `continue`
- line 123 [continue]: `continue`

## extracted/StarterPlayer_StarterPlayerScripts_RealismClient.client.lua
- line 157 [continue]: `continue;`

## extracted/Workspace_AssetReuploader_Plugin_App_AssetIdFilter_ChangeIds.lua
- line 164 [continue]: `continue`

## extracted/Workspace_AssetReuploader_Plugin_App_AssetIdFilter_GetAssetIds.lua
- line 106 [continue]: `continue`

## extracted/Workspace_AssetReuploader_Plugin_UiLibrary_Theme.lua
- line 152 [continue]: `continue`
- line 157 [continue]: `continue`
- line 162 [continue]: `continue`

