WOW_BUTTON = {}

WOW_BUTTON.createMacroButton = function(name)
    local button = CreateFrame("Button", name, nil, "SecureActionButtonTemplate,SecureHandlerBaseTemplate")
    button:SetAttribute("type", "macro")
    -- local script = [[
    -- self:CallMethod("logic")
    -- self:SetAttribute("macrotext", "/cast " .. self:GetAttribute("macro"))]]
    button:WrapScript(button, "OnClick", "self:CallMethod('mainLogic')")
    button.mainLogic = WOW_BUTTON.mainLogic
    return button
end

WOW_BUTTON.mainLogic = function(button)
    -- WOW_COMMAND.calcMacroCondition()
    -- WOW_BUTTON.runMacro(button, "cast 愈合")
    WOW_COMMAND.canUseSkill("愈合")
end

-- macro like: cast 愈合 or petattack
WOW_BUTTON.runMacro = function(button, macro)
    -- SetMacroSpell(button.GetName(), skill, nil)
    -- button:SetAttribute("macro", macro)
    button:SetAttribute("macrotext", "/" .. macro)
end
