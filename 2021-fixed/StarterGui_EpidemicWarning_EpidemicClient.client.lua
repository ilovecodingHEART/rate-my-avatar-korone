-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-15 10:00:19
-- Luau version 6, Types version 3
-- Time taken: 0.000788 seconds

script.Parent.Enabled = workspace:GetAttribute("Epidemic")
workspace:GetAttributeChangedSignal("Epidemic"):Connect(function() -- Line 2
	script.Parent.Enabled = workspace:GetAttribute("Epidemic")
end)