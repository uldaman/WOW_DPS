local Condition = ...
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


WOW_COMMAND.calcMacroCondition = function()
    if not next(Condition) then
        print('Failed to load Condition.lua.')
        return
    end

    return condition
end
