local l_TextChatService_0 = game:GetService("TextChatService");
local l_Players_0 = game:GetService("Players");
l_TextChatService_0.OnIncomingMessage = function(v3) --[[ Line: 6 ]]
	local l_TextChatMessageProperties_0 = Instance.new("TextChatMessageProperties");
	if v3.TextSource then
		l_TextChatMessageProperties_0.PrefixText = ("<b>%*</b>"):format((l_Players_0:GetPlayerByUserId(v3.TextSource.UserId):GetAttribute("ChatTags"))) .. v3.PrefixText;
		return l_TextChatMessageProperties_0;
	else
		l_TextChatMessageProperties_0.PrefixText = v3.PrefixText;
		return l_TextChatMessageProperties_0;
	end;
end;