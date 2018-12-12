WOW_BUTTON = {
    step = 1,
    sequences = SurvivalHunter
}

WOW_BUTTON.createMacroButton = function(name)
    local button = CreateFrame("Button", name, nil, "SecureActionButtonTemplate,SecureHandlerBaseTemplate")
    button:SetAttribute("type", "macro")
    button:WrapScript(button, "OnClick", "self:CallMethod('mainLogic')")
    button.mainLogic = WOW_BUTTON.mainLogic
end

WOW_BUTTON.mainLogic = function(button)
    index = FP.findIndex(function(sequence) return sequence.condition() end, WOW_BUTTON.sequences, WOW_BUTTON.step)
    if index then
        WOW_BUTTON.step = (index == #WOW_BUTTON.sequences) and 1 or (index + 1)
        WOW_BUTTON.runMacro(button, WOW_BUTTON.sequences[index].macro)
    end
end

-- macro like: /cast 愈合 or /petattack
WOW_BUTTON.runMacro = function(button, macro)
    button:SetAttribute("macrotext", macro)
end
