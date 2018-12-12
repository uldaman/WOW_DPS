WOW_BUTTON = {
    sequences = SurvivalHunter
}

WOW_BUTTON.createMacroButton = function(name)
    local button = CreateFrame("Button", name, nil, "SecureActionButtonTemplate,SecureHandlerBaseTemplate")
    button:SetAttribute("type", "macro")
    button:WrapScript(button, "OnClick", "self:CallMethod('mainLogic')")
    button.mainLogic = WOW_BUTTON.mainLogic
end

WOW_BUTTON.mainLogic = function(button)
    sequence = FP.find(function(sequence) return sequence.condition() end, WOW_BUTTON.sequences)
    if sequence then
        WOW_BUTTON.runMacro(button, sequence.macro)
    end
end

-- macro like: /cast 愈合 or /petattack
WOW_BUTTON.runMacro = function(button, macro)
    button:SetAttribute("macrotext", macro)
end
