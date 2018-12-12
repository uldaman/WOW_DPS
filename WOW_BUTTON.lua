WOW_BUTTON = {}

-- loop 加入优先级， 1，12，123，1234
local OnClick =  [=[
    local step = self:GetAttribute("step")
    local limit = self:GetAttribute("limit")
    self:SetAttribute("macrotext", macros[step])
    local next = (step == limit and 1 or step + 1)
    self:SetAttribute("step", next)
    self:CallMethod('updateIcon', macros[next])
]=]

WOW_BUTTON.createMacroButton = function(name)
    local button = CreateFrame("Button", name, nil, "SecureActionButtonTemplate,SecureHandlerBaseTemplate")
    button:SetAttribute("type", "macro")
    button:SetAttribute("limit", #SurvivalHunter)
    button:SetAttribute("step", 1)
    button:Execute('name, macros = self:GetName(), newtable([=======[' .. strjoin(']=======],[=======[', unpack(SurvivalHunter)) .. ']=======])')
    button:WrapScript(button, "OnClick", OnClick)
    button.updateIcon = WOW_BUTTON.updateIcon
end

WOW_BUTTON.updateIcon = function(button, a)
    -- 1. 去空格，2. 去 /，3. 去英文
    skill = a:gsub("%s*",""):gsub("%/",""):gsub("%a+","")
    if skill ~= "" then
        SetMacroSpell(button:GetName(), skill, nil)
    end

    -- 考虑做个普攻技能的提示， 因为普攻技能没有CD，会卡循环，所以再好不要加入序列
end
