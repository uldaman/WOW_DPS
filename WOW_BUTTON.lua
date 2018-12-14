WOW_BUTTON = {}
local sequence = SurvivalHunter.sequence
local guard = SurvivalHunter.guard
local clean = SurvivalHunter.clean

 -- 优先级， 1，12，123，1234 ...
local PriorityOnClick =  [=[
    local length = self:GetAttribute("length")
    local limit = self:GetAttribute("limit")
    local step = self:GetAttribute("step")
    self:SetAttribute("macrotext", self:GetAttribute("guard") .. macros[step] .. self:GetAttribute("clean"))
    if step == limit then
        step = 1
        limit = limit == length and 1 or limit + 1
    else
        step = step + 1
    end
    self:SetAttribute("step", step)
    self:SetAttribute("limit", limit)
    self:CallMethod('updateIcon', macros[step])
]=]

-- 顺序， 1234，1234 ...
local OnClick =  [=[
    local length = self:GetAttribute("length")
    local step = self:GetAttribute("step")
    self:SetAttribute("macrotext", self:GetAttribute("guard") .. macros[step] .. self:GetAttribute("clean"))
    step = (step == length and 1 or step + 1)
    self:SetAttribute("step", step)
    self:CallMethod('updateIcon', macros[step])
]=]

WOW_BUTTON.createMacroButton = function(name)
    local button = CreateFrame("Button", name, nil, "SecureActionButtonTemplate,SecureHandlerBaseTemplate")
    button:SetAttribute("type", "macro")
    button:SetAttribute("guard", guard .. "\n")
    button:SetAttribute("clean", "\n" .. clean)
    button:SetAttribute("length", #sequence)
    button:SetAttribute("limit", 1)
    button:SetAttribute("step", 1)
    button:Execute('name, macros = self:GetName(), newtable([=======[' .. strjoin(']=======],[=======[', unpack(sequence)) .. ']=======])')
    button:WrapScript(button, "OnClick", PriorityOnClick)
    button.updateIcon = WOW_BUTTON.updateIcon
end

WOW_BUTTON.updateIcon = function(button, a)
    -- 1. 去空格，2. 去 /，3. 去英文，4. 去方括号
    skill = a:gsub("%s*",""):gsub("%/",""):gsub("%a+",""):gsub("%b[]","")
    if skill ~= "" then
        SetMacroSpell(button:GetName(), skill, nil)
    end
    -- 考虑做个普攻技能的提示， 因为普攻技能没有CD，会卡循环，所以再好不要加入序列
end
