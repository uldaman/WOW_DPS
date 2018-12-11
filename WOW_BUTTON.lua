WOW_BUTTON = {}

WOW_BUTTON.createMacroButton = function(name)
    local button = CreateFrame("Button", name, nil, "SecureActionButtonTemplate,SecureHandlerBaseTemplate")
    button:SetAttribute("type", "macro")
    -- local script = "\
    -- self:CallMethod('logic')\
    -- self:SetAttribute('macrotext', '/cast ' .. self:GetAttribute('macro'))"
    button:WrapScript(button, "OnClick", "self:CallMethod('calcMacroCondition')")
    button.calcMacroCondition = WOW_BUTTON.calcMacroCondition
    return button
end

WOW_BUTTON.calcMacroCondition = function(button)
    -- 通过某些计算拿到要释放的技能
    WOW_BUTTON.cast(button, "愈合")
end

WOW_BUTTON.cast = function(button, skill)
    SetMacroSpell(button.GetName(), skill, nil)
    -- button:SetAttribute("macro", macro)
    button:SetAttribute("macrotext", "/cast " .. skill)
end
