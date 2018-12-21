SurvivalHunter = {
    guard = [[
/stopmacro [noexists][dead][noharm]
/cast [@pet,nogroup][@focus,group] 误导
    ]],

    -- change 自动按键 hitPress
    sequence = {
        "/cast 鱼叉猛刺",
        "/cast 杀戮命令",
        "/cast 野火炸弹",
        "/cast 猛禽一击",
        "/cast 野火炸弹", -- 必须反着才能保证顺序
        "/cast 杀戮命令",
    },

    clean = [[
/petattack
/startattack
    ]]
}
