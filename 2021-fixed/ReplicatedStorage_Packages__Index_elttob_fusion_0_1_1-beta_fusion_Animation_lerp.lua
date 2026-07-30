-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Colour.Oklab);
return function(v3, v4, v5) --[[ Line: 11 ]] --[[ Name: lerpType ]]
    local v6 = typeof(v3);
    if typeof(v4) == v6 then
        if v6 == "number" then
            return (v4 - v3) * v5 + v3;
        elseif v6 == "CFrame" then
            return v3:Lerp(v4, v5);
        elseif v6 == "Color3" then
            local v7 = v2.to(v3);
            local v8 = v2.to(v4);
            return v2.from(v7:Lerp(v8, v5), false);
        elseif v6 == "ColorSequenceKeypoint" then
            local v9 = v2.to(v3.Value);
            local v10 = v2.to(v4.Value);
            return ColorSequenceKeypoint.new((v4.Time - v3.Time) * v5 + v3.Time, v2.from(v9:Lerp(v10, v5), false));
        elseif v6 == "DateTime" then
            return DateTime.fromUnixTimestampMillis((v4.UnixTimestampMillis - v3.UnixTimestampMillis) * v5 + v3.UnixTimestampMillis);
        elseif v6 == "NumberRange" then
            return NumberRange.new((v4.Min - v3.Min) * v5 + v3.Min, (v4.Max - v3.Max) * v5 + v3.Max);
        elseif v6 == "NumberSequenceKeypoint" then
            return NumberSequenceKeypoint.new((v4.Time - v3.Time) * v5 + v3.Time, (v4.Value - v3.Value) * v5 + v3.Value, (v4.Envelope - v3.Envelope) * v5 + v3.Envelope);
        elseif v6 == "PhysicalProperties" then
            return PhysicalProperties.new((v4.Density - v3.Density) * v5 + v3.Density, (v4.Friction - v3.Friction) * v5 + v3.Friction, (v4.Elasticity - v3.Elasticity) * v5 + v3.Elasticity, (v4.FrictionWeight - v3.FrictionWeight) * v5 + v3.FrictionWeight, (v4.ElasticityWeight - v3.ElasticityWeight) * v5 + v3.ElasticityWeight);
        elseif v6 == "Ray" then
            return Ray.new(v3.Origin:Lerp(v4.Origin, v5), v3.Direction:Lerp(v4.Direction, v5).Unit * (v4.Direction.Magnitude - v3.Direction.Magnitude) * v5 + v3.Direction.Magnitude);
        elseif v6 == "Rect" then
            return Rect.new(v3.Min:Lerp(v4.Min, v5), v3.Max:Lerp(v4.Max, v5));
        elseif v6 == "Region3" then
            local v11 = v3.CFrame.Position:Lerp(v4.CFrame.Position, v5);
            local v12 = v3.Size:Lerp(v4.Size, v5) / 2;
            return Region3.new(v11 - v12, v11 + v12);
        elseif v6 == "Region3int16" then
            return Region3int16.new(Vector3int16.new((v4.Min.X - v3.Min.X) * v5 + v3.Min.X, (v4.Min.Y - v3.Min.Y) * v5 + v3.Min.Y, (v4.Min.Z - v3.Min.Z) * v5 + v3.Min.Z), Vector3int16.new((v4.Max.X - v3.Max.X) * v5 + v3.Max.X, (v4.Max.Y - v3.Max.Y) * v5 + v3.Max.Y, (v4.Max.Z - v3.Max.Z) * v5 + v3.Max.Z));
        elseif v6 == "UDim" then
            return UDim.new((v4.Scale - v3.Scale) * v5 + v3.Scale, (v4.Offset - v3.Offset) * v5 + v3.Offset);
        elseif v6 == "UDim2" then
            return v3:Lerp(v4, v5);
        elseif v6 == "Vector2" then
            return v3:Lerp(v4, v5);
        elseif v6 == "Vector2int16" then
            return Vector2int16.new((v4.X - v3.X) * v5 + v3.X, (v4.Y - v3.Y) * v5 + v3.Y);
        elseif v6 == "Vector3" then
            return v3:Lerp(v4, v5);
        elseif v6 == "Vector3int16" then
            return Vector3int16.new((v4.X - v3.X) * v5 + v3.X, (v4.Y - v3.Y) * v5 + v3.Y, (v4.Z - v3.Z) * v5 + v3.Z);
        end;
    end;
    if v5 < 0.5 then
        return v3;
    else
        return v4;
    end;
end;