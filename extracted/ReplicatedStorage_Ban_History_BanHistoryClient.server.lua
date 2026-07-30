-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-15 09:58:34
-- Luau version 6, Types version 3
-- Time taken: 0.004422 seconds

local Remotes_upvr = require(game:GetService("ReplicatedStorage").Remotes)
if not Remotes_upvr.Function("AmIAdmin"):InvokeServer() then
else
	local any_Init_result1_upvr = require(script.Iris).Init()
	any_Init_result1_upvr.UpdateGlobalConfig(any_Init_result1_upvr.TemplateConfig.colorLight)
	any_Init_result1_upvr.UpdateGlobalConfig(any_Init_result1_upvr.TemplateConfig.sizeClear)
	local any_State_result1_upvr = any_Init_result1_upvr.State(false)
	local var4_upvw
	local tbl_upvw = {}
	local Players_upvr = game:GetService("Players")
	local function searchf_upvr(arg1) -- Line 21, Named "searchf"
		--[[ Upvalues[4]:
			[1]: var4_upvw (read and write)
			[2]: tbl_upvw (read and write)
			[3]: Players_upvr (readonly)
			[4]: Remotes_upvr (readonly)
		]]
		var4_upvw = nil
		tbl_upvw = {}
		var4_upvw = Players_upvr:GetUserIdFromNameAsync(arg1)
		tbl_upvw = Remotes_upvr.Function("BanHistory"):InvokeServer(var4_upvw)
	end
	any_Init_result1_upvr:Connect(function() -- Line 28, Named "banHistory"
		--[[ Upvalues[5]:
			[1]: any_Init_result1_upvr (readonly)
			[2]: any_State_result1_upvr (readonly)
			[3]: searchf_upvr (readonly)
			[4]: var4_upvw (read and write)
			[5]: tbl_upvw (read and write)
		]]
		any_Init_result1_upvr.Window({"Ban History"}, {
			isOpened = any_State_result1_upvr;
		})
		local any_InputText_result1 = any_Init_result1_upvr.InputText({"Username"})
		if any_InputText_result1.textChanged() then
			task.spawn(searchf_upvr, any_InputText_result1.text.value)
		end
		any_Init_result1_upvr.Text({"You entered: "..any_InputText_result1.text.value})
		any_Init_result1_upvr.Text({`Userid {var4_upvw}`})
		any_Init_result1_upvr.Table({6, true, true, true, true, false, false, true})
		any_Init_result1_upvr.Text("DisplayReason")
		any_Init_result1_upvr.NextColumn()
		any_Init_result1_upvr.Text("PrivateReason")
		any_Init_result1_upvr.NextColumn()
		any_Init_result1_upvr.Text("StartTime")
		any_Init_result1_upvr.NextColumn()
		any_Init_result1_upvr.Text("Duration")
		any_Init_result1_upvr.NextColumn()
		any_Init_result1_upvr.Text("Ban")
		any_Init_result1_upvr.NextColumn()
		any_Init_result1_upvr.Text("PlaceId")
		any_Init_result1_upvr.NextColumn()
		for _, v in tbl_upvw do
			any_Init_result1_upvr.Text(tostring(v.DisplayReason))
			any_Init_result1_upvr.NextColumn()
			any_Init_result1_upvr.Text(tostring(v.PrivateReason))
			any_Init_result1_upvr.NextColumn()
			any_Init_result1_upvr.Text(tostring(v.StartTime))
			any_Init_result1_upvr.NextColumn()
			any_Init_result1_upvr.Text(tostring(v.Duration))
			any_Init_result1_upvr.NextColumn()
			any_Init_result1_upvr.Text(tostring(v.Ban))
			any_Init_result1_upvr.NextColumn()
			any_Init_result1_upvr.Text(tostring(v.PlaceId))
			any_Init_result1_upvr.NextColumn()
		end
		any_Init_result1_upvr.End()
		any_Init_result1_upvr.End()
	end)
	game:GetService("TextChatService").SendingMessage:Connect(function(arg1) -- Line 74
		--[[ Upvalues[2]:
			[1]: Remotes_upvr (readonly)
			[2]: any_State_result1_upvr (readonly)
		]]
		if arg1.TextSource.UserId == game:GetService("Players").LocalPlayer.UserId and arg1.Text == "!banhistory" and Remotes_upvr.Function("AmIAdmin"):InvokeServer() then
			any_State_result1_upvr:set(not any_State_result1_upvr:get())
		end
	end)
end