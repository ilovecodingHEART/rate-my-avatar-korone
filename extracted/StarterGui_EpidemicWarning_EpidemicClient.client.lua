-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-15 10:00:19
-- Luau version 6, Types version 3
-- Time taken: 0.000788 seconds

script.Parent.Enabled = workspace:GetAttribute("Epidemic")
workspace:GetAttributeChangedSignal("Epidemic"):Connect(function() -- Line 2
	script.Parent.Enabled = workspace:GetAttribute("Epidemic")
end)