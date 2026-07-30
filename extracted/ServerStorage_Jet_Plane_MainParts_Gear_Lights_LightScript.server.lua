while true do
	for _,v in pairs(script.Parent.Main:GetChildren()) do
		if v.Transparency ~= 1 then
			v.Light.Enabled = true
			v.Light2.Enabled = true
		elseif v.Transparency == 1 then
			v.Light.Enabled = false
			v.Light2.Enabled = false
		end
	end
	wait()
end