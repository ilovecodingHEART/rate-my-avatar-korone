#!/usr/bin/env python3
"""Generate 2021-patches/ — paste-ready script replacements for a 2021 client.

Every op is asserted; loud failure = pattern drifted.
Op types:
  replace : exact substring swap
  regex   : re.subn with count check (repl may be callable)
  splice  : replace line range [start,end] (1-based incl.), anchored by optional pattern on start line
  inject_top : insert text at top of file
  whole   : replace whole file
"""
import json, re, os, sys, hashlib

ROOT='/home/user/rate-my-avatar-korone'
man=json.load(open(f'{ROOT}/extracted/manifest.json'))
byh={x['hash'][:8]:x for x in man}

CLEARHELP = "-- [2021 compat] injected by downgrade tool: table.clear does not exist on this client\nlocal function __2021_clear(t)\n\tfor k in pairs(t) do\n\t\tt[k] = nil\n\tend\nend\n"

CHATSHIM = '''-- [2021] TextChatService does not exist on this client. This shim routes the game's
-- system messages (gift alerts etc.) to the legacy chat via StarterGui:SetCore.
local l_TextChatService_0
do
	local function DisplaySystemMessage(_, richText)
		local str = tostring(richText)
		local text = str:gsub("<[^>]*>", "")
		local size = tonumber(str:match('size%s*=%s*"(%d+)"')) or 16
		local r, g, b = str:match("rgb%((%d+),%s*(%d+),%s*(%d+)%)")
		local props = { Text = text, TextSize = size, Font = Enum.Font.SourceSansBold }
		if r then
			props.Color = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
		end
		local ok = pcall(function()
			game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", props)
		end)
		if not ok then print(text) end
	end
	l_TextChatService_0 = { TextChannels = { RBXGeneral = { DisplaySystemMessage = DisplaySystemMessage } } }
end'''

VOICESHIM = ('-- [2021] VoiceChatService does not exist on this client; stubbed (voice always "disabled")\n'
'local l_VoiceChatService_0 = { IsVoiceEnabledForUserIdAsync = function() return false end };')

TaskSyncGuard = ('-- [2021] no parallel Luau on this client: make the parallel-era calls no-ops (runs serially)\n'
'if task and task.synchronize == nil then\n\ttask.synchronize = function() end\nend\n'
'if task and task.desynchronize == nil then\ttask.desynchronize = function() end\nend\n')

BUFFERSHIM = '''-- [2021] pure-Lua shim for the `buffer` library (does not exist on this client).
-- Wire-compatible only with peers running the same shim. Implemented over Lua strings
-- held by reference so writes mutate like real buffers.
local buffer
do
	local mt = {}
	local function raw(b)
		if type(b) == "table" then return b.s end
		return b
	end
	local function put(b, i, chunk)
		local d = raw(b)
		d = d:sub(1, i) .. chunk .. d:sub(i + #chunk + 1)
		if type(b) == "table" then b.s = d end
	end
	buffer = {}
	function buffer.create(n) return setmetatable({ s = string.rep("\\0", n) }, mt) end
	function buffer.len(b) return #raw(b) end
	function buffer.copy(dst, doff, src, soff, n)
		local d, s = raw(dst), raw(src)
		soff = soff or 0
		if n == nil then n = #s - soff end
		d = d:sub(1, doff) .. s:sub(soff + 1, soff + n) .. d:sub(doff + n + 1)
		if type(dst) == "table" then dst.s = d return dst end
		return d
	end
	function buffer.readu8(b, i) return string.byte(raw(b), i + 1) end
	function buffer.writeu8(b, i, v) put(b, i, string.char(v)) end
	function buffer.writeu16(b, i, v) put(b, i, string.pack("<I2", v)) end
	function buffer.writef32(b, i, v) put(b, i, string.pack("<f", v)) end
	function buffer.writestring(b, i, s, n)
		s = s or ""
		put(b, i, s:sub(1, n or #s))
	end
	function buffer.__raw(b) return raw(b) end
	mt.__tostring = raw
end
'''

FAMILY = {
 'GothamSSm':'Gotham','BuilderSans':'GothamSemibold','Montserrat':'Gotham',
 'MontserratMedium':'GothamSemibold','MontserratBold':'GothamBold',
 'FredokaOne':'FredokaOne','RobotoMono':'RobotoMono','Roboto':'Roboto',
}
def font_new_repl(m):
    fam=m.group(1); weight=m.group(3) or ''
    item=FAMILY.get(fam,'Gotham')
    if weight in ('Bold','ExtraBold','Heavy','Black'): item={'Gotham':'GothamBold'}.get(item,item)
    if weight in ('SemiBold','Medium') and item=='Gotham': item='GothamSemibold'
    return f'--[[ Font.new 2021 ]] Enum.Font.{item}'

# ---------------------------------------------------------------- OPS
OPS = {}

def ops(h, lst): OPS[h]=lst

# ---- the two giant twins (ClientMain LocalScript + AdminPanel server-misplaced copy)
for h in ('22e34bbc','47fb11b3'):
    ops(h, [
      {'t':'replace','find':'local l_VoiceChatService_0 = game:GetService("VoiceChatService");','repl':VOICESHIM},
      {'t':'replace','find':'local l_TextChatService_0 = game:GetService("TextChatService");','repl':CHATSHIM},
      {'t':'regex','pattern':r'\ttable\.clear\(v104\);','repl':'\tfor k in pairs(v104) do v104[k] = nil end; -- [2021] table.clear'},
      {'t':'regex','pattern':r'\n\tv816\.RollOffMaxDistance = v815\.RollOffMaxDistance;\n\tv816\.RollOffMinDistance = v815\.RollOffMinDistance;',
                    'repl':'\n\tv816.MaxDistance = v815.MaxDistance; -- [2021] renamed\n\tv816.MinDistance = v815.MinDistance; -- [2021] renamed'},
      {'t':'regex','pattern':r'\tlocal l_ExperienceInviteOptions_0 = Instance\.new\("ExperienceInviteOptions"\);\n\tl_ExperienceInviteOptions_0\.InviteUser = v678;\n\tl_ExperienceInviteOptions_0\.PromptMessage = "Let them know you sent them a gift!";\n\tl_ExperienceInviteOptions_0\.InviteMessageId = "99cde9f1-9c69-5645-9abb-549af45c016f";\n\tl_SocialService_0:PromptGameInvite\(l_LocalPlayer_0, l_ExperienceInviteOptions_0\);',
                    'repl':'\tl_SocialService_0:PromptGameInvite(l_LocalPlayer_0); -- [2021] no ExperienceInviteOptions'},
    ])

ops('882c3a65',[ # YourBooth fade without CanvasGroup (property chosen per-instance-type)
 {'t':'replace','find':'GroupTransparency = 1','repl':'[l_CanvasGroup_0:IsA("CanvasGroup") and "GroupTransparency" or "BackgroundTransparency"] = 1 -- [2021] no CanvasGroup','n':1},
 {'t':'replace','find':'GroupTransparency = 0','repl':'[l_CanvasGroup_1:IsA("CanvasGroup") and "GroupTransparency" or "BackgroundTransparency"] = 0 -- [2021] no CanvasGroup','n':1},
])

ops('58787be4',[
 {'t':'replace','find':'local l_AdService_0 = game:GetService("AdService");','repl':'-- [2021] rewarded ads do not exist; availability check is pcall-guarded below\nlocal l_AdService_0 = game:GetService("AdService");'},
 {'t':'replace','find':'\tif l_AdService_0:GetAdAvailabilityNowAsync(Enum.AdFormat.RewardedVideo).AdAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable then',
  'repl':'\tlocal v30_ok, v30_res = pcall(function()\n\t\treturn l_AdService_0:GetAdAvailabilityNowAsync(Enum.AdFormat.RewardedVideo).AdAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable\n\tend) -- [2021] AdService rewarded-video API does not exist here\n\tif v30_ok and v30_res then'},
])

ops('dce4ad24',[{'t':'whole','repl':'''-- [2021] Experience Events (RSVP) do not exist pre-2023 and can't work on Pekora.
-- The "Notify me" button is hidden; the countdown itself keeps working (Timer script is separate).
script.Parent.Visible = false
'''}])

ops('6b78eb93',[
 {'t':'replace','find':'local l_ExperienceInviteOptions_0 = Instance.new("ExperienceInviteOptions");\nl_ExperienceInviteOptions_0.PromptMessage = "Invite your friends to raise or donate Robux in PLS DONATE!";\n',
  'repl':''},
 {'t':'replace','find':'l_SocialService_0:PromptGameInvite(l_LocalPlayer_0, l_ExperienceInviteOptions_0);',
  'repl':'l_SocialService_0:PromptGameInvite(l_LocalPlayer_0); -- [2021] no ExperienceInviteOptions'},
])

ops('1c9821ae',[{'t':'replace','find':'local l_VoiceChatService_0 = game:GetService("VoiceChatService");','repl':VOICESHIM}])

ops('a52acb68',[
 {'t':'replace','find':'local l_VoiceChatService_0 = game:GetService("VoiceChatService");\n','repl':''},
 {'t':'inject_top','text':'''-- [2021] TextChatService does not exist; route gift alerts to the legacy chat.
local function DisplaySystemMessage2021(richText)
	local str = tostring(richText)
	local text = str:gsub("<[^>]*>", "")
	local r, g, b = str:match("rgb%((%d+),%s*(%d+),%s*(%d+)%)")
	local props = { Text = text, TextSize = 16, Font = Enum.Font.SourceSansBold }
	if r then
		props.Color = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
	end
	local ok = pcall(function()
		game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", props)
	end)
	if not ok then print(text) end
end
'''},
 {'t':'replace','find':'game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage(','repl':'pcall(DisplaySystemMessage2021, ('},
])
# NOTE: that last call gets wrapped in pcall(...(...)) — need closing paren fix handled by regex instead
OPS['a52acb68'][2]={'t':'regex','pattern':r'game\.TextChatService\.TextChannels\.RBXGeneral:DisplaySystemMessage\((\(\(.*</font>"\):format\(v6455, v644\)\))\);',
 'repl':'DisplaySystemMessage2021(\\1); -- [2021] legacy chat'}

ops('312acee8',[
 {'t':'inject_top','text':'''-- [2021] TextChatService does not exist. Assignments to its chat-config objects
-- are swallowed by this shim so the scaling logic keeps working for the rest of the UI.
local TextChatService2021 = setmetatable({}, { __index = function()
	return setmetatable({}, { __newindex = function() end, __index = function() return nil end })
end })
'''},
 {'t':'replace','find':'game.TextChatService','repl':'TextChatService2021','n':10},
])

ops('1186078a',[
 {'t':'replace','find':'local l_TextChatService_0 = game:GetService("TextChatService");\n','repl':''},
 {'t':'replace','find':'l_TextChatService_0.SendingMessage:Connect(function(v19) --[[ Line: 67 ]]',
  'repl':'l_LocalPlayer_0.Chatted:Connect(function(chatMsg) -- [2021] legacy chat command hook (was TextChatService.SendingMessage)\n\tlocal v19 = { Text = chatMsg }'},
])

ops('cd9ba3f9',[
 {'t':'replace','find':'game:GetService("TextChatService").SendingMessage:Connect(function(arg1) -- Line 74',
  'repl':'game:GetService("Players").LocalPlayer.Chatted:Connect(function(chatMsg) -- [2021] legacy chat command hook (was TextChatService.SendingMessage)\n\t\tlocal arg1 = { Text = chatMsg, TextSource = { UserId = game:GetService("Players").LocalPlayer.UserId } }'},
])

ops('d0181f5a',[{'t':'whole','repl':'''-- [2021] DELETE ME / leave empty.
-- This script gave chat prefixes via TextChatService (2023 chat). On the 2021 client the
-- game's tags are handled by the legacy chat system instead: the patched
-- Chat.ChatModules.ExtraDataInitializer reads the player's "ChatTags" attribute
-- (set by ServerScriptService.chattags, unchanged) and attaches speaker Tags.
'''}])

# Legacy chat tag support in the copy of the chat system ships with the place:
ops('__PATH__Chat.ChatModules.ExtraDataInitializer',[
 {'t':'regex','pattern':r'(if not l_v28_Speaker_0:GetExtraData\("Tags"\) then\n\s*l_v28_Speaker_0:SetExtraData\("Tags", \{\}\);\n\s*end;)',
  'repl':'''\\1
		-- [2021] attach staff/VIP chat tags (ported from the removed TextChatService script)
		local l_tagPlayer_0 = l_v28_Speaker_0:GetPlayer();
		local l_tagRaw_0 = l_tagPlayer_0 and l_tagPlayer_0:GetAttribute("ChatTags");
		if l_tagRaw_0 and l_tagRaw_0 ~= "" then
			local l_tagText_0 = tostring(l_tagRaw_0):gsub("<[^>]*>", "");
			local r, g, b = tostring(l_tagRaw_0):match("rgb%((%d+),%s*(%d+),%s*(%d+)%)");
			l_v28_Speaker_0:SetExtraData("Tags", { {
				TagText = " " .. l_tagText_0,
				TagColor = r and Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b)) or Color3.fromRGB(255, 196, 0),
			} });
		end;'''},
])

ops('15c6384a',[
 {'t':'replace','find':'local TextChatService = game:GetService("TextChatService")','repl':'local TextChatService = nil -- [2021] no TextChatService (legacy chat); visibility toggles use SetCoreGuiEnabled below'},
 {'t':'regex','pattern':r'\t\tself\.PreviousChatWindowConfigurationEnabled = TextChatService\.ChatWindowConfiguration\.Enabled\n\t\tself\.PreviousChatInputBarConfigurationEnabled = TextChatService\.ChatInputBarConfiguration\.Enabled\n\t\tTextChatService\.ChatWindowConfiguration\.Enabled = false\n\t\tTextChatService\.ChatInputBarConfiguration\.Enabled = false',
  'repl':'\t\tpcall(function() game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false) end) -- [2021] hide legacy chat while Cmdr is open'},
 {'t':'regex','pattern':r'\t\tTextChatService\.ChatWindowConfiguration\.Enabled = if self\.PreviousChatWindowConfigurationEnabled ~= nil then \n\t\t\tself\.PreviousChatWindowConfigurationEnabled else true\n\t\tTextChatService\.ChatInputBarConfiguration\.Enabled = if self\.PreviousChatInputBarConfigurationEnabled ~= nil then \n\t\t\tself\.PreviousChatInputBarConfigurationEnabled else true',
  'repl':'\t\tpcall(function() game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true) end) -- [2021] restore legacy chat'},
])

ops('28274b70',[{'t':'replace','find':'local l_IKControl_0 = Instance.new("IKControl");',
 'repl':'local l_IKControl_0 = {}; -- [2021] IKControl does not exist here; plain table stub so the aim code no-ops safely'}])

ops('6701b3ef',[{'t':'inject_top','text':TaskSyncGuard}])

# ---- sound property renames + removed RollOffMode lines
for h in ('930dd2db','b230460d','de58fcee'):
    ops(h,[
      {'t':'regex','pattern':r'\.RollOffMinDistance','repl':'.MinDistance','n':None},
      {'t':'regex','pattern':r'\.RollOffMaxDistance','repl':'.MaxDistance','n':None},
      {'t':'regex','pattern':r'[ \t]*\w+\.RollOffMode ?= ?Enum\.RollOffMode\.\w+;?\n','repl':'-- [2021] RollOffMode dropped (does not exist here; default falloff is close enough)\n','n':None},
    ])
ops('ee6fc602',[{'t':'regex','pattern':r'\.RollOffMinDistance','repl':'.MinDistance','n':None}])
# Trampolines has a RollOffMaxDistance + raycast enum
T_ENUM_RAY = [
  {'t':'replace','find':'Enum.RaycastFilterType.Include','repl':'Enum.RaycastFilterType.Whitelist --[[ 2021 ]]','optional':True},
  {'t':'replace','find':'Enum.RaycastFilterType.Exclude','repl':'Enum.RaycastFilterType.Blacklist --[[ 2021 ]]','optional':True},
]
for h in ('b6f8e083','235939ae','9341945c','44481fb0','5f695545','80c03ecc','4f5ab01f','b04bbfef','fcf67b13','9ee3e776','9883dfe6','b044a4ab','25a8ea83'):
    if h in OPS: continue
    extra=list(T_ENUM_RAY)
    if h=='b6f8e083':
        extra+=[{'t':'regex','pattern':r'\.RollOffMaxDistance','repl':'.MaxDistance','n':None}]
    if h in ('9341945c',): pass
    ops(h, extra)
for h in ('4c330d49','993737c5'):
    OPS[h]=[{'t':'replace','find':'Enum.HighlightDepthMode.Occluded','repl':'Enum.HighlightDepthMode.Default --[[ 2021: Occluded does not exist here; closest available ]]'}]
ops('792a5ffb',[
  {'t':'replace','find':'Enum.HighlightDepthMode.Occluded','repl':'Enum.HighlightDepthMode.Default --[[ 2021: Occluded does not exist here; closest available ]]'},
  {'t':'regex','pattern':r'(\t\t\t)repeat\n\t\t\t\ttask\.wait\(\)\n\t\t\tuntil 0 < clone_10_upvr\.VideoBack\.VideoFrame\.TimeLength',
   'repl':'\\1local t2021 = 0 -- [2021] videos never load on revival clients; do not hang forever\n\\1repeat\n\\1\ttask.wait(1)\n\\1\tt2021 = t2021 + 1\n\\1until 0 < clone_10_upvr.VideoBack.VideoFrame.TimeLength or t2021 > 8'},
])

# ---- table.clear users
for h in ('b4a9a2ae','d646fbc5','2fe195ca','4391be55'):
    ops(h,[
      {'t':'inject_top','text':CLEARHELP},
      {'t':'regex','pattern':r'table\.clear\(','repl':'__2021_clear(','n':None},
    ])
ops('8a407f68',[{'t':'replace','find':'local v6 = table.clone(v5);',
 'repl':'local v6 = (function(t) local n = {}; for k, v in pairs(t) do n[k] = v end; return n end)(v5); -- [2021] table.clone'}])

# ---- ZAP-buffer module
ops('b6b87c76',[
  {'t':'inject_top','text':BUFFERSHIM},
  {'t':'replace','find':'l_ZAP_RELIABLE_0:FireServer(v28, v5);','repl':'l_ZAP_RELIABLE_0:FireServer(buffer.__raw(v28), v5); -- [2021] convert shim buffer to a string for the wire'},
  {'t':'replace','find':'table.clear(v5);','repl':'for k in pairs(v5) do v5[k] = nil end; -- [2021] table.clear'},
])

# ---- admin commands ban/unban
ops('8549dd67',[
  {'t':'regex','pattern':r"\t\t\t\t\t_players:BanAsync\(\{\n\t\t\t\t\t\t\['UserIds'\] = \{_userid\},\n\t\t\t\t\t\t\['Duration'\] = \(_days \* 24 \* 60 \* 60\),\n\t\t\t\t\t\t\['DisplayReason'\] = \(\"You have been banned for %s day\(s\)\.\"\):format\(_days\),\n\t\t\t\t\t\t\['PrivateReason'\] = \(\"Banned by admin %s\"\):format\(arg1\.Name\),\n\t\t\t\t\t\t\['ExcludeAltAccounts'\] = false,\n\t\t\t\t\t\t\['ApplyToUniverse'\] = true\n\t\t\t\t\t\}\)",
   'repl':"\t\t\t\t\tif _target then -- [2021] no Ban API on this client; kick instead\n\t\t\t\t\t\t_target:Kick((\"You have been banned for %s day(s).\"):format(_days))\n\t\t\t\t\telse\n\t\t\t\t\t\twarn((\"[2021] Cannot ban offline/unknown user %s (no Ban API here)\"):format(_userid))\n\t\t\t\t\tend"},
  {'t':'regex','pattern':r"\t\t\t\t\t_players:UnbanAsync\(\{\n\t\t\t\t\t\t\['UserIds'\] = \{_userid\},\n\t\t\t\t\t\t\['ApplyToUniverse'\] = true\n\t\t\t\t\t\}\)",
   'repl':"\t\t\t\t\twarn((\"[2021] Cannot unban %s (no Ban API on this client)\"):format(_userid))"},
])

# ---- anticheat: make its GetService proxy tolerant (TextChatService lookup would kill it)
ops('c6142c2a',[
  {'t':'regex','pattern':r'local v41 = l_GetService_0\(l_game_0, v40\);\n\t\tif v41 then\n\t\t\tv39\[v40\] = v41;\n\t\tend;\n\t\treturn v41;',
   'repl':'local v40_ok, v41 = pcall(l_GetService_0, l_game_0, v40); -- [2021] e.g. TextChatService does not exist here\n\t\tif v40_ok and v41 then\n\t\t\tv39[v40] = v41;\n\t\t\treturn v41;\n\t\tend;\n\t\treturn nil;'},
])

# ---- Navigation menu detection: CanvasGroup -> Frame
ops('ecc971a2',[
  {'t':'replace','find':'if v45:IsA("CanvasGroup") or v45:IsA("VideoFrame") then','repl':'if v45:IsA("Frame") or v45:IsA("VideoFrame") then -- [2021] menus are Frames here (no CanvasGroup)'},
  {'t':'replace','find':'if v50 ~= v45 and v50:IsA("CanvasGroup") and not table.find(v43, v50) then','repl':'if v50 ~= v45 and v50:IsA("Frame") and not table.find(v43, v50) then -- [2021] no CanvasGroup'},
])

# ---- PDRewind text fonts (both copies)
for h in ('53297b2e','c4cc7b36'):
    ops(h,[
      {'t':'regex','pattern':r'(\w+) = (\w+) and Enum\.FontStyle\.Italic or Enum\.FontStyle\.Normal;','repl':'\\1 = nil; --[[ 2021: no Enum.FontStyle (italics dropped) ]]','n':None,'optional':True},
      {'t':'regex','pattern':r'(\w+)\.FontFace = Font\.fromName\("Montserrat", Enum\.FontWeight\.(\w+), (\w+)\);','repl':
        lambda m: f'{m.group(1)}.Font = Enum.Font.' + {'Regular':'Gotham','ExtraBold':'GothamBold','Bold':'GothamBold','Medium':'GothamSemibold','SemiBold':'GothamSemibold','Light':'Gotham'}.get(m.group(2),'Gotham') + '; --[[ 2021 ]]','n':None},
    ])

# ---- PenaltyMiniGame label fonts
ops('7553353f',[
  {'t':'regex','pattern':r'FontFace = Font\.new\("rbxassetid://11702779409", Enum\.FontWeight\.Heavy, Enum\.FontStyle\.Normal\)','repl':'Font = Enum.Font.GothamBlack --[[ 2021 ]]'},
  {'t':'regex','pattern':r'FontFace = Font\.new\("rbxassetid://11702779409", Enum\.FontWeight\.SemiBold, Enum\.FontStyle\.Normal\)','repl':'Font = Enum.Font.GothamSemibold --[[ 2021 ]]'},
])

# ---- AdminBulkBan: GetTextSize fallback
ops('abb5d29d',[
  {'t':'regex','pattern':r'local l_GetTextBoundsParams_0 = Instance\.new\("GetTextBoundsParams"\);\n\s*l_GetTextBoundsParams_0\.Text = v29:get\(\);\n\s*l_GetTextBoundsParams_0\.Font = Font\.fromEnum\(Enum\.Font\.RobotoMono\);\n\s*l_GetTextBoundsParams_0\.Size = 20;\n\s*l_GetTextBoundsParams_0\.Width = v36:get\(\);\n\s*l_GetTextBoundsParams_0\.Width = l_GetTextBoundsParams_0\.Width - 36;\n\s*local l_TextBoundsAsync_0 = game:GetService\("TextService"\):GetTextBoundsAsync\(l_GetTextBoundsParams_0\);',
   'repl':'local l_TextBoundsAsync_0 = game:GetService("TextService"):GetTextSize(v29:get(), 20, Enum.Font.RobotoMono, Vector2.new(v36:get() - 36, 1e6)); -- [2021] GetTextBoundsAsync does not exist here'},
])

# ---- Iris demoWindow fonts (best-effort; debug UI)
ops('0c0a9d03',[
  {'t':'regex','pattern':r'Font\.fromEnum\(Enum\.Font\.BuilderSans\)','repl':'--[[ 2021 ]] Enum.Font.GothamSemibold'},
  {'t':'regex','pattern':r'Font\.fromEnum\(Enum\.Font\.RobotoMono\)','repl':'--[[ 2021 ]] Enum.Font.RobotoMono'},
  {'t':'regex','pattern':r'Font\.new\("rbxassetid://12187370747"\)','repl':'--[[ 2021 ]] Enum.Font.Gotham'},
  {'t':'regex','pattern':r'Font\.new\("rbxassetid://16658246179"\)','repl':'--[[ 2021 ]] Enum.Font.Code'},
  {'t':'regex','pattern':r'Font\.new\("rbxassetid://12187374537"\)','repl':'--[[ 2021 ]] Enum.Font.Gotham'},
])
# ---- Iris Window (UIFlexItem etc) best-effort: neutralize unknown-class/enum references
ops('f0c41d75',[
  {'t':'regex','pattern':r'Instance\.new\("UIFlexItem"\)','repl':'(function() local ok, o = pcall(Instance.new, "Frame") return o end)() --[[ 2021: UIFlexItem does not exist ]]'},
  {'t':'regex','pattern':r'Enum\.UIFlexMode\.\w+','repl':'Enum.AutomaticSize.None --[[ 2021: UIFlexMode does not exist; layout flexing disabled ]]'},
  {'t':'regex','pattern':r'Enum\.SelectionBehavior\.\w+','repl':'Enum.ScrollBarInset.ScrollBar --[[ 2021: SelectionBehavior does not exist ]]'},
  {'t':'regex','pattern':r'Enum\.ItemLineAlignment\.\w+','repl':'Enum.TextXAlignment.Left --[[ 2021: ItemLineAlignment does not exist ]]'},
])

# ---- Icon / topbarplus (both copies) — text font system
ops('3ae81ae4',[
  {'t':'regex','pattern':r'''    v18\.setTextFont = function\(v196, v197, v198, v199, v200\) --\[\[ Line: 815 \]\] --\[\[ Name: setTextFont \]\]
        v198 = v198 or Enum\.FontWeight\.Regular;
        v199 = v199 or Enum\.FontStyle\.Normal;
        local v201 = nil;
        local v202 = typeof\(v197\);
        if v202 == "number" then
            v201 = Font\.fromId\(v197, v198, v199\);
        elseif v202 == "EnumItem" then
            v201 = Font\.fromEnum\(v197\);
        elseif v202 == "string" and not v197:match\("rbxasset"\) then
            v201 = Font\.fromName\(v197, v198, v199\);
        end;
        if not v201 then
            v201 = Font\.new\(v197, v198, v199\);
        end;
        v196:modifyTheme\(\{
            "IconLabel", 
            "FontFace", 
            v201, 
            v200
        \}\);
        return v196;
    end;''',
   'repl':'''    v18.setTextFont = function(v196, v197, v198, v199, v200) --[[ 2021: no Font value type or FontFace; translate to legacy Enum.Font ]]
        local FAMILY = {
            GothamSSm = "Gotham", BuilderSans = "GothamSemibold", Montserrat = "Gotham",
            MontserratMedium = "GothamSemibold", MontserratBold = "GothamBold",
            FredokaOne = "FredokaOne", RobotoMono = "RobotoMono", Roboto = "Roboto",
        };
        local v201 = Enum.Font.Gotham;
        local v202 = typeof(v197);
        if v202 == "EnumItem" then
            v201 = v197;
        elseif v202 == "string" and not v197:match("rbxasset") then
            v201 = Enum.Font[FAMILY[v197] or "Gotham"];
        end;
        v196:modifyTheme({
            "IconLabel",
            "Font",
            v201,
            v200
        });
        return v196;
    end;'''},
])
ops('7705ad26',[
  {'t':'regex','pattern':r'''    v15\.setTextFont = function\(v199, v200, v201, v202, v203\) --\[\[ Line: 834 \]\] --\[\[ Name: setTextFont \]\]
        v201 = v201 or Enum\.FontWeight\.Regular;
        v202 = v202 or Enum\.FontStyle\.Normal;
        local v204 = nil;
        local v205 = typeof\(v200\);
        if v205 == "number" then
            v204 = Font\.fromId\(v200, v201, v202\);
        elseif v205 == "EnumItem" then
            v204 = Font\.fromEnum\(v200\);
        elseif v205 == "string" and not v200:match\("rbxasset"\) then
            v204 = Font\.fromName\(v200, v201, v202\);
        end;
        if not v204 then
            v204 = Font\.new\(v200, v201, v202\);
        end;
        v199:modifyTheme\(\{
            "IconLabel", 
            "FontFace", 
            v204, 
            v203
        \}\);
        return v199;
    end;''',
   'repl':'''    v15.setTextFont = function(v199, v200, v201, v202, v203) --[[ 2021: no Font value type or FontFace; translate to legacy Enum.Font ]]
        local FAMILY = {
            GothamSSm = "Gotham", BuilderSans = "GothamSemibold", Montserrat = "Gotham",
            MontserratMedium = "GothamSemibold", MontserratBold = "GothamBold",
            FredokaOne = "FredokaOne", RobotoMono = "RobotoMono", Roboto = "Roboto",
        };
        local v204 = Enum.Font.Gotham;
        local v205 = typeof(v200);
        if v205 == "EnumItem" then
            v204 = v200;
        elseif v205 == "string" and not v200:match("rbxasset") then
            v204 = Enum.Font[FAMILY[v200] or "Gotham"];
        end;
        v199:modifyTheme({
            "IconLabel",
            "Font",
            v204,
            v203
        });
        return v199;
    end;'''},
  {'t':'regex','pattern':r'"FontFace",','repl':'"Font",','n':None,'optional':True},
])
# first copy: any other "FontFace" strings => "Font"
OPS['3ae81ae4'] += [
  {'t':'regex','pattern':r'"FontFace",','repl':'"Font",','n':None,'optional':True},
]

# ---- Icon Elements
for h in ('1c5a59de','03014838'):  # Caption x2
    ops(h,[
      {'t':'replace','find':'Instance.new("CanvasGroup")','repl':'Instance.new("Frame") --[[ 2021: CanvasGroup does not exist; Frame + no group fade ]]'},
      {'t':'regex','pattern':r'\n\s*l_CanvasGroup_0\.GroupTransparency = 1;','repl':''},
      {'t':'regex','pattern':r'\{\s*\n\s*GroupTransparency = (v\d+)\s*\n\s*\}',
       'repl':'{ [l_CanvasGroup_0:IsA("CanvasGroup") and "GroupTransparency" or "BackgroundTransparency"] = \\1 } --[[ 2021 ]]'},
      {'t':'regex','pattern':r'\.FontFace = Font\.new\("rbxasset://fonts/families/GothamSSm\.json", Enum\.FontWeight\.Medium, Enum\.FontStyle\.Normal\);','repl':'.Font = Enum.Font.GothamSemibold; --[[ 2021 ]]','n':None},
      {'t':'regex','pattern':r'\n\s*l_UIListLayout_\d+\.HorizontalFlex = Enum\.UIFlexAlignment\.\w+;','repl':'','n':None},
      {'t':'regex','pattern':r'\n\s*l_UIListLayout_\d+\.VerticalFlex = Enum\.UIFlexAlignment\.\w+;','repl':'','n':None},
    ])
for h in ('bd7e20d8','7edcd68d'):  # Widget x2
    ops(h,[
      {'t':'replace','find':'"FontFace"','repl':'"Font" --[[ 2021 ]]','n':None,'optional':True},
      {'t':'replace','find':'.FontFace','repl':'.Font --[[ 2021 ]]','n':None,'optional':True},
      {'t':'regex','pattern':r'\n\s*l_UIListLayout_\d+\.VerticalFlex = Enum\.UIFlexAlignment\.\w+;','repl':'','n':None},
    ])
ops('10d5917d',[{'t':'regex','pattern':r'\n\s*l_UIListLayout_\d+\.HorizontalFlex = Enum\.UIFlexAlignment\.\w+;','repl':'','n':None}])
for h in ('999f82f5','3e6a6a9b'):  # Menu x2
    ops(h,[
      {'t':'regex','pattern':r'local v16 = Font\.new\("rbxasset://fonts/families/FredokaOne\.json", Enum\.FontWeight\.Light, Enum\.FontStyle\.Normal\);','repl':'local v16 = Enum.Font.FredokaOne; --[[ 2021 ]]'},
      {'t':'replace','find':'"FontFace",','repl':'"Font", --[[ 2021 ]]','n':None},
    ])
for h in ('09a96b08','e7a7d636'):  # Themes.Default x2 (font families as data)
    ops(h,[
      {'t':'regex','pattern':r'Font\.new\("rbxasset://fonts/families/(\w+)\.json"(, Enum\.FontWeight\.(\w+))?(, Enum\.FontStyle\.\w+)?\)','repl':font_new_repl,'n':None},
      {'t':'replace','find':'"FontFace"','repl':'"Font" --[[ 2021 ]]','n':None,'optional':True},
      {'t':'replace','find':'.FontFace','repl':'.Font --[[ 2021 ]]','n':None,'optional':True},
    ])
for _h in ('0c7acda7','cf09015a'):
    ops(_h,[{'t':'replace','find':'if v10 == nil and v12.ScreenInsets == Enum.ScreenInsets.TopbarSafeInsets then','repl':'if v10 == nil and v12.IgnoreGuiInset == false then --[[ 2021: no ScreenInsets; IgnoreGuiInset=false is the analog ]]','optional':True}])
ops('262d706a',[
  {'t':'replace','find':'l_ScreenGui_0.ScreenInsets = Enum.ScreenInsets.TopbarSafeInsets;','repl':'l_ScreenGui_0.IgnoreGuiInset = false; --[[ 2021: no ScreenInsets ]]'},
  {'t':'replace','find':'v11.ScreenInsets = Enum.ScreenInsets.None;','repl':'v11.IgnoreGuiInset = true; --[[ 2021 ]]'},
])

# handle "themes default" third hash variant if present
if '09a96b08' in OPS and 'e7a7d636' in OPS: pass
# ---- Satchel backpack
ops('8b9b8bc9',[
  {'t':'replace','find':'local l_TextChatService_0 = game:GetService("TextChatService");','repl':'local l_UserInputService_99 = game:GetService("UserInputService"); --[[ 2021: legacy chat has no ChatInputBarConfiguration; use focused-textbox check ]]'},
  {'t':'regex','pattern':r'\n\s*local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass\("ChatInputBarConfiguration"\);','repl':''},
  {'t':'regex','pattern':r'and not l_ChatInputBarConfiguration_0\.IsFocused','repl':'and l_UserInputService_99:GetFocusedTextBox() == nil --[[ 2021 ]]'},
  {'t':'regex','pattern':r'local v34 = l_script_0:GetAttribute\("FontFace"\) or Font\.new\("rbxasset://fonts/families/BuilderSans\.json"\);','repl':'local v34 = "BuilderSans"; --[[ 2021: legacy Enum.Font only ]]'},
  {'t':'regex','pattern':r'(\w+)\.FontFace = Font\.new\(v34\.Family, Enum\.FontWeight\.Medium, Enum\.FontStyle\.Normal\);','repl':'\\1.Font = Enum.Font.GothamSemibold; --[[ 2021 ]]','n':None},
  {'t':'regex','pattern':r'(\w+)\.FontFace = Font\.new\(v34\.Family, Enum\.FontWeight\.Heavy, Enum\.FontStyle\.Normal\);','repl':'\\1.Font = Enum.Font.GothamBlack; --[[ 2021 ]]','n':None},
])

ops('0ee34201',[{'t':'whole','repl':'''-- [2021] This script was a joke/broken placeholder: it calls game:GetService("DumbIdiot")
-- and Axes.new("DumbIdiot", ...) which error on EVERY Roblox version (it never worked
-- anywhere, including modern). Safe to delete entirely.
'''}])


# ---- second-pass fixes discovered by residual scan
ops('f0c41d75', OPS['f0c41d75'] + [
  {'t':'regex','pattern':r'\n\s*l_TextButton_0\.SelectionBehavior(Up|Down|Left|Right) = Enum\.ScrollBarInset\.ScrollBar --\[\[ 2021: SelectionBehavior does not exist \]\];','repl':'','n':None},
  {'t':'regex','pattern':r'\n\s*l_UIFlexItem_0\.FlexMode = Enum\.AutomaticSize\.None --\[\[ 2021: UIFlexMode does not exist; layout flexing disabled \]\];','repl':''},
  {'t':'regex','pattern':r'\n\s*l_UIFlexItem_0\.ItemLineAlignment = Enum\.TextXAlignment\.Left --\[\[ 2021: ItemLineAlignment does not exist \]\];','repl':''},
])
ops('0c0a9d03', OPS['0c0a9d03'] + [
  {'t':'inject_top','text':CLEARHELP},
  {'t':'regex','pattern':r'table\.clear\(','repl':'__2021_clear(','n':None},
  {'t':'regex','pattern':r'Font\.fromEnum\((Enum\.Font\.\w+)\)','repl':'\\1 --[[ 2021 ]]','n':None},
  {'t':'replace','find':'v129 = Font.new(v129.Family, v126.state.index.value, v127.state.index.value);','repl':'v129 = v129; --[[ 2021: v123 entries are Enum.Font items now ]]'},
])
for h in ('1c5a59de','03014838'):
    OPS[h] += [
      {'t':'regex','pattern':r'\n\s*l_UIListLayout_\d+\.ItemLineAlignment = Enum\.ItemLineAlignment\.\w+;','repl':'','n':None},
      { 't':'regex','pattern':r'\.FontFace = Font\.new\("rbxasset://fonts/families/(GothamSSm|BuilderSans)\.json", Enum\.FontWeight\.Medium, Enum\.FontStyle\.Normal\);','repl':'.Font = Enum.Font.GothamSemibold; --[[ 2021 ]]','n':None,'optional':True},
    ]
OPS['262d706a'] += [
  {'t':'regex','pattern':r'\n\s*l_ScreenGui_0\.IgnoreGuiInset = true;','repl':''},
]
OPS['cf09015a'] += [
  {'t':'regex','pattern':r'(\w+)\.ScreenInsets == Enum\.ScreenInsets\.TopbarSafeInsets','repl':'\\1.IgnoreGuiInset == false --[[ 2021 ]]','optional':True},
]

# ---- third-pass fixes: Enum.PreferredInput / UserInputService.PreferredInput (2023 API)
# vendored topbarplus (Satchel) references it at module load -> hard error on 2021.
OPS['7705ad26'] += [
  {'t':'regex','pattern':r'''local v22 = \{\n        mobile = Enum\.PreferredInput\.Touch, \n        desktop = Enum\.PreferredInput\.KeyboardAndMouse, \n        console = Enum\.PreferredInput\.Gamepad\n    \};''',
   'repl':'''local v22 = { -- [2021] no Enum.PreferredInput / UserInputService.PreferredInput here; string markers instead
        mobile = "Touch", 
        desktop = "KeyboardAndMouse", 
        console = "Gamepad"
    };
    local function getPreferredInput_2021() -- [2021] device-capability emulation of PreferredInput
        if l_UserInputService_0.GamepadEnabled then
            return v22.console;
        elseif l_UserInputService_0.TouchEnabled and not l_UserInputService_0.KeyboardEnabled then
            return v22.mobile;
        end;
        return v22.desktop;
    end;'''},
  {'t':'replace','find':'local v61 = l_UserInputService_0.PreferredInput ~= v22.desktop;','repl':'local v61 = getPreferredInput_2021() ~= v22.desktop; --[[ 2021 ]]'},
  {'t':'replace','find':'if not v44.locked and l_UserInputService_0.PreferredInput == v22.mobile then','repl':'if not v44.locked and getPreferredInput_2021() == v22.mobile then --[[ 2021 ]]'},
]

# ---- place-side CanvasGroup property usage -> BackgroundTransparency (menus become Frames in 2021)
for _h in ('22e34bbc','47fb11b3','312acee8','703e61e2','733c4202','99624e6e','a78aaf6c','babb3f2a'):
    OPS.setdefault(_h, []) if _h in OPS else ops(_h, [])
    OPS[_h] += [
      {'t':'regex','pattern':r'\.GroupTransparency','repl':'.BackgroundTransparency --[[ 2021: was GroupTransparency (CanvasGroup, 2022) ]]','n':None},
    ]

# ---------------------------------------------------------------- fourth pass
# 2021 Luau cannot COMPILE if-then-else expressions (added 2022) or `continue`
# (added 2022). Decompiler emitted both all over vendor/UI code.
# Every if-expr becomes a lazy ternary call __2021_if(condFn, thenFn, elseFn):
# branches stay unevaluated unless selected (conditions often guard nil/error
# paths, so `and/or` and eager-helper rewrites would be wrong).
THUNKIF = '''-- [2021] no if-then-else expressions on this client; lazy ternary helper
local function __2021_if(vcond, vthen, velse)
	if vcond() then
		return vthen();
	else
		return velse();
	end;
end'''

def _ifx(c, a, b):
    return '__2021_if(function() return %s end, function() return %s end, function() return %s end)' % (c, a, b)

def _ifop(c, a, b, **kw):
    d = {'t':'replace','find':'if %s then %s else %s' % (c, a, b),'repl':_ifx(c, a, b)}
    d.update(kw); return d

def _ifop_find(find, c, a, b, **kw):
    d = {'t':'replace','find':find,'repl':_ifx(c, a, b)}
    d.update(kw); return d

TWIN_IFOPS = [
  {'t':'inject_top','text':THUNKIF},
  _ifop('#v107 < v109', 'string.format("Showing %s %i out of %i gifts", v105 == "Latest" and "latest" or "top donated", #v107, v109)', '#v107 == 1 and "Showing 1 gift" or string.format("Showing %i gifts", #v107)'),
  _ifop('v206.isDeluxe', 'l_UITemplates_0.DeluxeServerFrame:Clone()', 'l_UITemplates_0.ServerFrame:Clone()'),
  _ifop('v266 and v266:IsDescendantOf(game)', 'v266', 'nil', n=2),
  # if-expr used as the CONDITION of an if statement (pattern of the original, 2023-era source)
  _ifop('l_v269_Attribute_1 == "Gamepass"', 'l_MarketplaceService_0:UserOwnsGamePassAsync(l_LocalPlayer_0.UserId, l_l_v269_Attribute_0_0)', 'l_MarketplaceService_0:PlayerOwnsAsset(l_LocalPlayer_0, l_l_v269_Attribute_0_0)'),
]
CAPTION_SHAPES = lambda v: [
  _ifop('%s ~= nil' % v, v, 'l_AbsoluteSize_1'),
]
_by_file = {}
for _x in man:
    _by_file.setdefault(_x['file'], _x['hash'][:8])
_IFEXPR_FILES = {
 'extracted/ServerScriptService_AdminPanel.server.lua': TWIN_IFOPS,
 'extracted/StarterGui_ScreenGui_ClientMain.client.lua': TWIN_IFOPS,
 'extracted/ReplicatedStorage_ClientScripts_Scaling.server.lua': [
   {'t':'inject_top','text':THUNKIF},
   _ifop('v26 < 800', 'v26 / 300', 'v26 / 500'),
 ],
 'extracted/ReplicatedStorage_LeaderboardHistoryClient.server.lua': [
   {'t':'inject_top','text':THUNKIF},
   _ifop('v8[5] == "12"', 'v8[4] + 1', 'v8[4]'),
 ],
 'extracted/ReplicatedStorage_EventManager_Events_Christmas25_Server_Init.lua': [
   {'t':'inject_top','text':THUNKIF},
   {'t':'replace','find':'if not v43 then nil else if not v43 or v43:GetAttribute("IceStun") then nil else v43',
    'repl':_ifx('not v43', 'nil', _ifx('not v43 or v43:GetAttribute("IceStun")', 'nil', 'v43'))},
 ],
 'extracted/ReplicatedStorage_Slerp_Client_Cars.lua': [
   {'t':'inject_top','text':THUNKIF},
   _ifop('not v36', 'nil', 'v24.cars[v36]'),
   _ifop('not v101', 'nil', 'v24.cars[v101]'),
   # if-exprs used as if-conditions (doesCarExist etc.)
   _ifop('not v45', 'nil', 'v24.cars[v45]'),
   _ifop('not v48', 'nil', 'v24.cars[v48]'),
   _ifop('not v59', 'nil', 'v24.cars[v59]'),
   _ifop('not v68', 'nil', 'v24.cars[v68]'),
 ],
 'extracted/ReplicatedStorage_HypeTrainDebugClient_Iris_widgets_Window.lua': [
   {'t':'inject_top','text':THUNKIF},
   _ifop('math.sign(v62.X) == -1', 'Enum.LeftRight.Left', 'Enum.LeftRight.Right'),
   _ifop('math.sign(v62.Y) == -1', 'Enum.TopBottom.Top', 'Enum.TopBottom.Bottom'),
   _ifop('v65.UserInputType == Enum.UserInputType.Touch', 'v65.Delta', 'v2.getMouseLocation() - v24'),
   _ifop('l_Left_0 == Enum.LeftRight.Left', 'v74.X', '0'),
   _ifop('l_Top_0 == Enum.TopBottom.Top', 'v74.Y', '0'),
   {'t':'replace','find':'if l_Left_0 == Enum.LeftRight.Left then -v74.X else if l_Left_0 == Enum.LeftRight.Right then v74.X else 0',
    'repl':_ifx('l_Left_0 == Enum.LeftRight.Left', '-v74.X', _ifx('l_Left_0 == Enum.LeftRight.Right', 'v74.X', '0'))},
   {'t':'replace','find':'if l_Top_0 == Enum.TopBottom.Top then -v74.Y else if l_Top_0 == Enum.TopBottom.Bottom then v74.Y else 0',
    'repl':_ifx('l_Top_0 == Enum.TopBottom.Top', '-v74.Y', _ifx('l_Top_0 == Enum.TopBottom.Bottom', 'v74.Y', '0'))},
   _ifop('v26 and v25', 'v25.state.position.value + Vector2.new(15, 45)', 'Vector2.new(150, 250)'),
 ],
 'extracted/ReplicatedStorage_SatchelLoader_Satchel_Packages__Index_1foreverhd_topbarplus_3_.7705ad26e0.lua': [
   {'t':'inject_top','text':THUNKIF},
   _ifop_find('if tonumber(v162) then ("rbxassetid://%*"):format(v162) else v162', 'tonumber(v162)', '("rbxassetid://%s"):format(v162)', 'v162'),
   # `and 0 or if ...` width calc, occurs twice in file (both identical)
   _ifop('v301.IconImage.Visible == true', 'v280.Frame.AbsoluteSize.X + v282.Parent.Parent.IconImage.AbsoluteSize.X', 'v301.AbsoluteSize.X', n=2),
 ],
 'extracted/ReplicatedStorage_Icon_Elements_Caption.lua': [
   {'t':'inject_top','text':THUNKIF},
 ] + CAPTION_SHAPES('v32') + CAPTION_SHAPES('v35') + CAPTION_SHAPES('v37') + CAPTION_SHAPES('v36'),
 'extracted/ReplicatedStorage_SatchelLoader_Satchel_Packages__Index_1foreverhd_topbarplus_3_.lua': [
   {'t':'inject_top','text':THUNKIF},
 ] + CAPTION_SHAPES('v33') + CAPTION_SHAPES('v36') + CAPTION_SHAPES('v38') + CAPTION_SHAPES('v37'),
 # `continue` (2022 Luau) — restructured with a per-iteration skip flag; semantics
 # preserved exactly (the continue skipped ONLY the inter-word task.wait(0.15)).
 'extracted/StarterGui_Rewind_PDRewind_Main_TextHandler.lua': [
   {'t':'replace','find':'if string.find(v50, "#") or string.find(v50,',
    'repl':'local skip_wait_2021 = false; -- [2021] per-iteration flag replacing "continue"\n        if string.find(v50, "#") or string.find(v50,'},
   {'t':'replace','find':'\n            else\n                continue;\n            end;',
    'repl':'\n            else\n                skip_wait_2021 = true; --[[ 2021: was continue ]]\n            end;'},
   {'t':'replace','find':'\n        task.wait(0.15);',
    'repl':'\n        if not skip_wait_2021 then task.wait(0.15); end; --[[ 2021: "continue" above skipped this wait ]]'},
 ],
}
for _f, _newops in _IFEXPR_FILES.items():
    _hh = _by_file[_f]
    OPS[_hh] = OPS.get(_hh, []) + _newops

# ---- sixth pass: Color3.fromHex (2023 API) -> local polyfill;
# table.freeze (2022 API) -> identity shim (no immutability enforcement, harmless for this code)
HEXHELP = '''-- [2021] no Color3.fromHex on this client (2023 API); local equivalent
local function color3_fromHex_2021(vhex)
	vhex = vhex:gsub("#", "");
	if #vhex == 3 then
		vhex = vhex:gsub("(.)", "%1%1");
	end;
	return Color3.fromRGB(tonumber(vhex:sub(1, 2), 16), tonumber(vhex:sub(3, 4), 16), tonumber(vhex:sub(5, 6), 16));
end'''
FREEZEHELP = '''-- [2021] table.freeze does not exist here (2022 API); identity shim, immutability simply not enforced
local function __2021_freeze(vt)
	return vt;
end'''
for _f in ('extracted/ServerScriptService_AdminPanel.server.lua','extracted/StarterGui_ScreenGui_ClientMain.client.lua','extracted/ReplicatedStorage_ToolManager_Tools_Smite_Hammer_controller.lua','extracted/ReplicatedStorage_ClientScripts_Components.server.lua'):
    _hh = _by_file[_f]
    OPS[_hh] = OPS.get(_hh, []) + [
      {'t':'inject_top','text':HEXHELP},
      {'t':'regex','pattern':r'Color3\.fromHex\(','repl':'color3_fromHex_2021(','n':None},
    ]
for _f in ('extracted/ReplicatedStorage_Slerp_Client_Trampolines.lua','extracted/ReplicatedStorage_Slerp_Client_Cars.lua','extracted/ReplicatedStorage_Client_remotes.lua'):
    _hh = _by_file[_f]
    OPS[_hh] = OPS.get(_hh, []) + [
      {'t':'inject_top','text':FREEZEHELP},
      {'t':'regex','pattern':r'table\.freeze\(','repl':'__2021_freeze(','n':None},
    ]

# ---- fifth pass: 2021 generic-for cannot iterate a bare table value
# (`for k,v in t do` is a runtime error; generalized iteration landed 2022).
# Decompiler emits bare-table explists only for actual tables (bytecode
# distinguishes iterators), so wrapping in pairs() is semantics-preserving.
# Call-expr explists (pairs(...), t:iter()) can't match the regex.
for _h in list(OPS.keys()):
    OPS[_h] = OPS.get(_h, []) + [{'t':'regex','optional':True,'n':None,
      'pattern':r'for([ \t]+[_A-Za-z0-9, \t]+[ \t]+in[ \t]+)((?:[_A-Za-z][_A-Za-z0-9]*\.)*[_A-Za-z][_A-Za-z0-9]*)[ \t]+do',
      'repl':r'for\1pairs(\2) --[[ 2021 ]] do'}]

# ---------------------------------------------------------------- run
log=[]
fails=[]
def apply(file_rel, op_list):
    src=open(f'{ROOT}/{file_rel}').read()
    for idx,op in enumerate(op_list):
        t=op['t']
        desc=' '.join(str(op.get('find', op.get('pattern','whole')))[:80].split())
        try:
            if t=='whole':
                src=op['repl']; log.append((file_rel,idx,'whole',1)); continue
            if t=='replace':
                n=src.count(op['find'])
                if n==0 and op.get('optional'):
                    log.append((file_rel,idx,'replace(opt)',0)); continue
                if n==0: raise ValueError('pattern not found')
                if op.get('n') and n!=op['n']: raise ValueError(f'expected {op["n"]} got {n}')
                src=src.replace(op['find'], op['repl'])
                log.append((file_rel,idx,'replace',n)); continue
            if t=='regex':
                pat=re.compile(op['pattern'])
                src,n=pat.subn(op['repl'], src)
                if n==0 and not op.get('optional'): raise ValueError('regex not found')
                if n and op.get('n') and n!=op['n']: raise ValueError(f'expected {op["n"]} got {n}')
                log.append((file_rel,idx,'regex',n)); continue
            if t=='inject_top':
                src=op['text']+'\n'+src; log.append((file_rel,idx,'inject_top',1)); continue
            raise ValueError('unknown op '+t)
        except Exception as e:
            fails.append((file_rel,idx,str(e)[:120],desc))
    return src

by_path={x['paths'][0]:x for x in man}
resolved={}
for key,op_list in OPS.items():
    if key.startswith('__PATH__'):
        path=key[len('__PATH__'):]
        x=by_path[path]
    else:
        x=byh.get(key)
    if x is None:
        fails.append(('?',key,-1,'hash not found','')); continue
    resolved.setdefault(x['file'], []).extend(op_list)

for file_rel, op_list in resolved.items():
    out=apply(file_rel, op_list)
    dest=f'{ROOT}/2021-patches/'+file_rel[len('extracted/'):]
    os.makedirs(os.path.dirname(dest), exist_ok=True)
    head="-- ============================================================\n-- 2021 CLIENT (PEKORA) REPLACEMENT -- generated by downgrade tool\n-- Paste this whole file over the matching script in your 2021 Studio.\n-- All changes are marked with [2021] or 2021 comments.\n-- ============================================================\n"
    if not out.startswith('--!strict'):
        out=head+out
    else:
        out=out.replace('--!strict','--!strict\n'+head,1)
    # 2021 Luau string.format has no `%*` specifier (decompiler stand-in for string
    # interpolation, supported only on 2022+ Luau). %s is the exact equivalent
    # (tostring() on each argument). All %* in this set are format strings, verified.
    nstar = out.count('%*')
    if nstar:
        out = out.replace('%*', '%s')
        log.append((file_rel, -1, 'interp-fix', f'%* -> %s x{nstar}', ''))
    open(dest,'w').write(out)

print('files patched:',len(resolved))
for f in fails: print('FAIL',f)
print('ops applied:',len(log))
print('--- per file ops:')
import collections
c=collections.Counter(x[0] for x in log)
for k,v in sorted(c.items()): print(f'  {v:3d}  {k}')
