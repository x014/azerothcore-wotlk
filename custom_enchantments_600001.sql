-- ============================================
-- 自定义附魔 SQL（中文版）
-- ID范围：600001-600003
-- 客户端语言：zhCN（简体中文）
-- ============================================

-- ============================================
-- 附魔 600001：萌萌之力（力量2000 + 攻击强度5000 + 耐力2000）
-- ============================================
INSERT INTO `spellitemenchantment_dbc` (
    `ID`,
    `Charges`,
    `Effect_1`,
    `EffectPointsMin_1`,
    `EffectPointsMax_1`,
    `EffectArg_1`,
    `Effect_2`,
    `EffectPointsMin_2`,
    `EffectPointsMax_2`,
    `EffectArg_2`,
    `Effect_3`,
    `EffectPointsMin_3`,
    `EffectPointsMax_3`,
    `EffectArg_3`,
    `Name_Lang_enUS`,
    `Name_Lang_zhCN`,
    `Name_Lang_Mask`
) VALUES (
    600001,     -- 附魔ID
    0,          -- 充能次数（0=无限制）
    5,          -- Effect_1: STAT类型
    2000,       -- EffectPointsMin_1: 2000
    2000,       -- EffectPointsMax_1: 2000
    4,          -- EffectArg_1: 力量
    5,          -- Effect_2: STAT类型
    5000,       -- EffectPointsMin_2: 5000
    5000,       -- EffectPointsMax_2: 5000
    38,         -- EffectArg_2: 攻击强度
    5,          -- Effect_3: STAT类型
    2000,       -- EffectPointsMin_3: 2000
    2000,       -- EffectPointsMax_3: 2000
    7,          -- EffectArg_3: 耐力
    'Titan\'s Might',  -- 英文名称
    '萌萌之力',         -- 中文名称
    16712190    -- 名称掩码
);

-- ============================================
-- 附魔 600002：萌萌之敏（敏捷2000 + 攻击强度5000 + 耐力2000）
-- ============================================
INSERT INTO `spellitemenchantment_dbc` (
    `ID`,
    `Charges`,
    `Effect_1`,
    `EffectPointsMin_1`,
    `EffectPointsMax_1`,
    `EffectArg_1`,
    `Effect_2`,
    `EffectPointsMin_2`,
    `EffectPointsMax_2`,
    `EffectArg_2`,
    `Effect_3`,
    `EffectPointsMin_3`,
    `EffectPointsMax_3`,
    `EffectArg_3`,
    `Name_Lang_enUS`,
    `Name_Lang_zhCN`,
    `Name_Lang_Mask`
) VALUES (
    600002,     -- 附魔ID
    0,          -- 充能次数（0=无限制）
    5,          -- Effect_1: STAT类型
    2000,       -- EffectPointsMin_1: 2000
    2000,       -- EffectPointsMax_1: 2000
    3,          -- EffectArg_1: 敏捷
    5,          -- Effect_2: STAT类型
    5000,       -- EffectPointsMin_2: 5000
    5000,       -- EffectPointsMax_2: 5000
    38,         -- EffectArg_2: 攻击强度
    5,          -- Effect_3: STAT类型
    2000,       -- EffectPointsMin_3: 2000
    2000,       -- EffectPointsMax_3: 2000
    7,          -- EffectArg_3: 耐力
    'Panther\'s Agility',  -- 英文名称
    '萌萌之敏',             -- 中文名称
    16712190    -- 名称掩码
);

-- ============================================
-- 附魔 600003：萌萌之智（智力2000 + 法术强度8000 + 耐力2000）
-- ============================================
INSERT INTO `spellitemenchantment_dbc` (
    `ID`,
    `Charges`,
    `Effect_1`,
    `EffectPointsMin_1`,
    `EffectPointsMax_1`,
    `EffectArg_1`,
    `Effect_2`,
    `EffectPointsMin_2`,
    `EffectPointsMax_2`,
    `EffectArg_2`,
    `Effect_3`,
    `EffectPointsMin_3`,
    `EffectPointsMax_3`,
    `EffectArg_3`,
    `Name_Lang_enUS`,
    `Name_Lang_zhCN`,
    `Name_Lang_Mask`
) VALUES (
    600003,     -- 附魔ID
    0,          -- 充能次数（0=无限制）
    5,          -- Effect_1: STAT类型
    2000,       -- EffectPointsMin_1: 2000
    2000,       -- EffectPointsMax_1: 2000
    5,          -- EffectArg_1: 智力
    5,          -- Effect_2: STAT类型
    8000,       -- EffectPointsMin_2: 8000
    8000,       -- EffectPointsMax_2: 8000
    45,         -- EffectArg_2: 法术强度
    5,          -- Effect_3: STAT类型
    2000,       -- EffectPointsMin_3: 2000
    2000,       -- EffectPointsMax_3: 2000
    7,          -- EffectArg_3: 耐力
    'Archmage\'s Wisdom',  -- 英文名称
    '萌萌之智',              -- 中文名称
    16712190    -- 名称掩码
);

-- ============================================
-- 验证查询
-- ============================================
-- 查看已添加的附魔
SELECT 
    ID,
    Name_Lang_enUS,
    Name_Lang_zhCN,
    Effect_1, EffectPointsMin_1, EffectArg_1,
    Effect_2, EffectPointsMin_2, EffectArg_2,
    Effect_3, EffectPointsMin_3, EffectArg_3
FROM spellitemenchantment_dbc 
WHERE ID IN (600001, 600002, 600003);

-- ============================================
-- 属性类型对照表
-- ============================================
/*
EffectArg 值对照：
3  = 敏捷 (AGILITY)
4  = 力量 (STRENGTH)
5  = 智力 (INTELLECT)
7  = 耐力 (STAMINA)
38 = 攻击强度 (ATTACK_POWER)
45 = 法术强度 (SPELL_POWER)
*/

-- ============================================
-- 客户端显示效果（中文客户端）
-- ============================================
/*
附魔 600001 - 萌萌之力:
装备：+2000 力量
装备：+5000 攻击强度
装备：+2000 耐力

附魔 600002 - 萌萌之敏:
装备：+2000 敏捷
装备：+5000 攻击强度
装备：+2000 耐力

附魔 600003 - 萌萌之智:
装备：+2000 智力
装备：+8000 法术强度
装备：+2000 耐力
*/

-- ============================================
-- 使用说明
-- ============================================
/*
1. 执行此SQL文件导入数据库
2. 重启AzerothCore服务器
3. 在游戏中测试附魔效果

注意：
- 中文客户端会显示中文名称（萌萌之力、萌萌之敏、萌萌之智）
- 英文客户端会显示英文名称（Titan's Might、Panther's Agility、Archmage's Wisdom）
- 属性加成会自动显示，无需修改客户端
*/
