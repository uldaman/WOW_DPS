BeastHunter = {
    guard = [[
/stopmacro [noexists][dead][noharm]
/cast [@pet,nogroup][@focus,group] 误导
    ]],

    -- 倒刺射击 手动
    sequence = {
        -- "/cast 夺命黑鸦", 还没学
        -- "/cast 野性守护", 还没学
        "/cast 狂野怒火",
        "/castsequence reset=6 杀戮命令,眼镜蛇射击,眼镜蛇射击",
        "/castsequence reset=6 杀戮命令,倒刺射击,眼镜蛇射击",
        -- /castsequence reset=8 杀戮命令,倒刺射击,眼镜蛇射击,眼镜蛇射击
        "/cast 奇美拉射击"
    },

    clean = [[
/petattack
/startattack
    ]]
}
