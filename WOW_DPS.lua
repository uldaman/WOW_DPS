local name = "DPS"

local test = "树皮术"

local function main()
    return '\
    self:CallMethod("Logic")\
    self:SetAttribute("macrotext",  "/cast " .. self:GetAttribute("skill"))'
end


local button = CreateFrame("Button", name, nil, "SecureActionButtonTemplate,SecureHandlerBaseTemplate")
button:SetAttribute("type", "macro")


button.Logic = function()
    SetMacroSpell(name, test, nil)
    button:SetAttribute("skill", test)
end


button:WrapScript(button, "OnClick", main())

