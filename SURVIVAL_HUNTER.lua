SurvivalHunter = {
    guard = [[
/stopmacro [noexists][dead]
/petattack
    ]],

    -- change 自动按键 hitPress
    sequence = {
        "/cast 鱼叉猛刺",
        "/cast 杀戮命令",
        "/cast 野火炸弹",
        "/cast [exists,harm,nodead] 削凿"
    }
}
