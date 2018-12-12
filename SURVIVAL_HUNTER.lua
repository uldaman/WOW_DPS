local serpentSting = function()
    if not hasDebuff("target", "毒蛇钉刺") or hasBuff("player", "xxx") then
        return true
    end
    return false
end

SurvivalHunter = {
    {condition = serpentSting, macro = "/cast 毒蛇钉刺"},
}

