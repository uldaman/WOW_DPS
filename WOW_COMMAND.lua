WOW_COMMAND = {}

WOW_COMMAND.canUseSkill = function(skill)
    usable, nomana = IsUsableSpell(skill)
    if (not usable) then
        if (not nomana) then
            print("The spell cannot be cast")
        else
            print("You do not have enough mana to cast the spell")
        end
    else
        print("The spell may be cast")
    end
end

-- fn: UnitBuff UnitDebuff
-- unit: "player" "target"
WOW_COMMAND.checkBuff = function(fn, unit, buffName)
    for i = 1, 40 do
        local name = fn(unit, i)
        if name and name == buffName then
            return true
        end
    end
    return false
end

WOW_COMMAND.hasBuff = function(unit, buffName)
    return WOW_COMMAND.checkBuff(UnitBuff, unit, debuffName)
end

WOW_COMMAND.hasDebuff = function(unit, debuffName)
    return WOW_COMMAND.checkBuff(UnitDebuff, unit, debuffName)
end
