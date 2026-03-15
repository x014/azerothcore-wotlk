-- ============================================
-- 附魔卷轴物品 SQL
-- 通过物品名称显示附魔信息
-- ============================================

-- ============================================
-- 附魔法术定义
-- ============================================

-- 附魔法术：萌萌之力
INSERT INTO `spell_dbc` (
    `ID`,
    `Category`,
    `DispelType`,
    `Mechanic`,
    `Attributes`,
    `AttributesEx`,
    `AttributesEx2`,
    `AttributesEx3`,
    `AttributesEx4`,
    `AttributesEx5`,
    `AttributesEx6`,
    `AttributesEx7`,
    `Stances`,
    `StancesNot`,
    `Targets`,
    `TargetCreatureType`,
    `RequiresSpellFocus`,
    `FacingCasterFlags`,
    `CasterAuraState`,
    `TargetAuraState`,
    `ExcludeCasterAuraState`,
    `ExcludeTargetAuraState`,
    `CasterAuraSpell`,
    `TargetAuraSpell`,
    `ExcludeCasterAuraSpell`,
    `ExcludeTargetAuraSpell`,
    `CastingTimeIndex`,
    `RecoveryTime`,
    `CategoryRecoveryTime`,
    `InterruptFlags`,
    `AuraInterruptFlags`,
    `ChannelInterruptFlags`,
    `ProcTypeMask`,
    `ProcChance`,
    `ProcCharges`,
    `MaxLevel`,
    `BaseLevel`,
    `SpellLevel`,
    `DurationIndex`,
    `PowerType`,
    `ManaCost`,
    `ManaCostPerLevel`,
    `ManaPerSecond`,
    `ManaPerSecondPerLevel`,
    `RangeIndex`,
    `Speed`,
    `StackAmount`,
    `Totem_1`,
    `Totem_2`,
    `Reagent_1`,
    `Reagent_2`,
    `Reagent_3`,
    `Reagent_4`,
    `Reagent_5`,
    `Reagent_6`,
    `Reagent_7`,
    `Reagent_8`,
    `ReagentCount_1`,
    `ReagentCount_2`,
    `ReagentCount_3`,
    `ReagentCount_4`,
    `ReagentCount_5`,
    `ReagentCount_6`,
    `ReagentCount_7`,
    `ReagentCount_8`,
    `EquippedItemClass`,
    `EquippedItemSubClassMask`,
    `EquippedItemInventoryTypeMask`,
    `Effect_1`,
    `Effect_2`,
    `Effect_3`,
    `EffectDieSides_1`,
    `EffectDieSides_2`,
    `EffectDieSides_3`,
    `EffectRealPointsPerLevel_1`,
    `EffectRealPointsPerLevel_2`,
    `EffectRealPointsPerLevel_3`,
    `EffectBasePoints_1`,
    `EffectBasePoints_2`,
    `EffectBasePoints_3`,
    `EffectMechanic_1`,
    `EffectMechanic_2`,
    `EffectMechanic_3`,
    `ImplicitTargetA_1`,
    `ImplicitTargetA_2`,
    `ImplicitTargetA_3`,
    `ImplicitTargetB_1`,
    `ImplicitTargetB_2`,
    `ImplicitTargetB_3`,
    `EffectRadiusIndex_1`,
    `EffectRadiusIndex_2`,
    `EffectRadiusIndex_3`,
    `EffectAura_1`,
    `EffectAura_2`,
    `EffectAura_3`,
    `EffectAuraPeriod_1`,
    `EffectAuraPeriod_2`,
    `EffectAuraPeriod_3`,
    `EffectAuraAmplitude_1`,
    `EffectAuraAmplitude_2`,
    `EffectAuraAmplitude_3`,
    `EffectMiscValue_1`,
    `EffectMiscValue_2`,
    `EffectMiscValue_3`,
    `EffectMiscValueB_1`,
    `EffectMiscValueB_2`,
    `EffectMiscValueB_3`,
    `EffectTriggerSpell_1`,
    `EffectTriggerSpell_2`,
    `EffectTriggerSpell_3`,
    `EffectPointsPerComboPoint_1`,
    `EffectPointsPerComboPoint_2`,
    `EffectPointsPerComboPoint_3`,
    `SpellVisual_1`,
    `SpellVisual_2`,
    `SpellIconID`,
    `ActiveIconID`,
    `SpellPriority`,
    `Name_Lang_enUS`,
    `Name_Lang_enGB`,
    `Name_Lang_koKR`,
    `Name_Lang_frFR`,
    `Name_Lang_deDE`,
    `Name_Lang_enCN`,
    `Name_Lang_zhCN`,
    `Name_Lang_enTW`,
    `Name_Lang_zhTW`,
    `Name_Lang_esES`,
    `Name_Lang_esMX`,
    `Name_Lang_ruRU`,
    `Name_Lang_ptPT`,
    `Name_Lang_ptBR`,
    `Name_Lang_itIT`,
    `Name_Lang_Unk`,
    `Name_Lang_Mask`,
    `Description_Lang_enUS`,
    `Description_Lang_enGB`,
    `Description_Lang_koKR`,
    `Description_Lang_frFR`,
    `Description_Lang_deDE`,
    `Description_Lang_enCN`,
    `Description_Lang_zhCN`,
    `Description_Lang_enTW`,
    `Description_Lang_zhTW`,
    `Description_Lang_esES`,
    `Description_Lang_esMX`,
    `Description_Lang_ruRU`,
    `Description_Lang_ptPT`,
    `Description_Lang_ptBR`,
    `Description_Lang_itIT`,
    `Description_Lang_Unk`,
    `Description_Lang_Mask`
) VALUES (
    12345,      -- ID
    0,          -- Category
    0,          -- DispelType
    0,          -- Mechanic
    384,        -- Attributes
    0,          -- AttributesEx
    0,          -- AttributesEx2
    0,          -- AttributesEx3
    0,          -- AttributesEx4
    0,          -- AttributesEx5
    0,          -- AttributesEx6
    0,          -- AttributesEx7
    0,          -- Stances
    0,          -- StancesNot
    0,          -- Targets
    0,          -- TargetCreatureType
    0,          -- RequiresSpellFocus
    0,          -- FacingCasterFlags
    0,          -- CasterAuraState
    0,          -- TargetAuraState
    0,          -- ExcludeCasterAuraState
    0,          -- ExcludeTargetAuraState
    0,          -- CasterAuraSpell
    0,          -- TargetAuraSpell
    0,          -- ExcludeCasterAuraSpell
    0,          -- ExcludeTargetAuraSpell
    1,          -- CastingTimeIndex
    0,          -- RecoveryTime
    0,          -- CategoryRecoveryTime
    0,          -- InterruptFlags
    0,          -- AuraInterruptFlags
    0,          -- ChannelInterruptFlags
    0,          -- ProcTypeMask
    101,        -- ProcChance
    0,          -- ProcCharges
    0,          -- MaxLevel
    0,          -- BaseLevel
    0,          -- SpellLevel
    0,          -- DurationIndex
    0,          -- PowerType
    0,          -- ManaCost
    0,          -- ManaCostPerLevel
    0,          -- ManaPerSecond
    0,          -- ManaPerSecondPerLevel
    1,          -- RangeIndex
    0,          -- Speed
    0,          -- StackAmount
    0,          -- Totem_1
    0,          -- Totem_2
    0,          -- Reagent_1
    0,          -- Reagent_2
    0,          -- Reagent_3
    0,          -- Reagent_4
    0,          -- Reagent_5
    0,          -- Reagent_6
    0,          -- Reagent_7
    0,          -- Reagent_8
    0,          -- ReagentCount_1
    0,          -- ReagentCount_2
    0,          -- ReagentCount_3
    0,          -- ReagentCount_4
    0,          -- ReagentCount_5
    0,          -- ReagentCount_6
    0,          -- ReagentCount_7
    0,          -- ReagentCount_8
    2,          -- EquippedItemClass
    -1,         -- EquippedItemSubClassMask
    -1,         -- EquippedItemInventoryTypeMask
    53,         -- Effect_1: Enchant Item Permanent
    0,          -- Effect_2
    0,          -- Effect_3
    0,          -- EffectDieSides_1
    0,          -- EffectDieSides_2
    0,          -- EffectDieSides_3
    0,          -- EffectRealPointsPerLevel_1
    0,          -- EffectRealPointsPerLevel_2
    0,          -- EffectRealPointsPerLevel_3
    0,          -- EffectBasePoints_1
    0,          -- EffectBasePoints_2
    0,          -- EffectBasePoints_3
    0,          -- EffectMechanic_1
    0,          -- EffectMechanic_2
    0,          -- EffectMechanic_3
    1,          -- ImplicitTargetA_1
    0,          -- ImplicitTargetA_2
    0,          -- ImplicitTargetA_3
    0,          -- ImplicitTargetB_1
    0,          -- ImplicitTargetB_2
    0,          -- ImplicitTargetB_3
    0,          -- EffectRadiusIndex_1
    0,          -- EffectRadiusIndex_2
    0,          -- EffectRadiusIndex_3
    0,          -- EffectAura_1
    0,          -- EffectAura_2
    0,          -- EffectAura_3
    0,          -- EffectAuraPeriod_1
    0,          -- EffectAuraPeriod_2
    0,          -- EffectAuraPeriod_3
    0,          -- EffectAuraAmplitude_1
    0,          -- EffectAuraAmplitude_2
    0,          -- EffectAuraAmplitude_3
    400001,     -- EffectMiscValue_1: 附魔ID
    0,          -- EffectMiscValue_2
    0,          -- EffectMiscValue_3
    0,          -- EffectMiscValueB_1
    0,          -- EffectMiscValueB_2
    0,          -- EffectMiscValueB_3
    0,          -- EffectTriggerSpell_1
    0,          -- EffectTriggerSpell_2
    0,          -- EffectTriggerSpell_3
    0,          -- EffectPointsPerComboPoint_1
    0,          -- EffectPointsPerComboPoint_2
    0,          -- EffectPointsPerComboPoint_3
    0,          -- SpellVisual_1
    0,          -- SpellVisual_2
    0,          -- SpellIconID
    0,          -- ActiveIconID
    0,          -- SpellPriority
    'Enchant Weapon - Titan\'s Might',  -- Name_Lang_enUS
    '',         -- Name_Lang_enGB
    '',         -- Name_Lang_koKR
    '',         -- Name_Lang_frFR
    '',         -- Name_Lang_deDE
    '',         -- Name_Lang_enCN
    '附魔武器 - 萌萌之力',  -- Name_Lang_zhCN
    '',         -- Name_Lang_enTW
    '',         -- Name_Lang_zhTW
    '',         -- Name_Lang_esES
    '',         -- Name_Lang_esMX
    '',         -- Name_Lang_ruRU
    '',         -- Name_Lang_ptPT
    '',         -- Name_Lang_ptBR
    '',         -- Name_Lang_itIT
    '',         -- Name_Lang_Unk
    16712190,   -- Name_Lang_Mask
    '',         -- Description_Lang_enUS
    '',         -- Description_Lang_enGB
    '',         -- Description_Lang_koKR
    '',         -- Description_Lang_frFR
    '',         -- Description_Lang_deDE
    '',         -- Description_Lang_enCN
    '附魔武器，增加力量2000、攻击强度5000、耐力2000',  -- Description_Lang_zhCN
    '',         -- Description_Lang_enTW
    '',         -- Description_Lang_zhTW
    '',         -- Description_Lang_esES
    '',         -- Description_Lang_esMX
    '',         -- Description_Lang_ruRU
    '',         -- Description_Lang_ptPT
    '',         -- Description_Lang_ptBR
    '',         -- Description_Lang_itIT
    '',         -- Description_Lang_Unk
    16712190    -- Description_Lang_Mask
);

-- 附魔法术：萌萌之敏
INSERT INTO `spell_dbc` (
    `ID`, `Category`, `DispelType`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `Stances`, `StancesNot`, `Targets`, `TargetCreatureType`, `RequiresSpellFocus`, `FacingCasterFlags`, `CasterAuraState`, `TargetAuraState`, `ExcludeCasterAuraState`, `ExcludeTargetAuraState`, `CasterAuraSpell`, `TargetAuraSpell`, `ExcludeCasterAuraSpell`, `ExcludeTargetAuraSpell`, `CastingTimeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `ProcTypeMask`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `PowerType`, `ManaCost`, `ManaCostPerLevel`, `ManaPerSecond`, `ManaPerSecondPerLevel`, `RangeIndex`, `Speed`, `StackAmount`, `Totem_1`, `Totem_2`, `Reagent_1`, `Reagent_2`, `Reagent_3`, `Reagent_4`, `Reagent_5`, `Reagent_6`, `Reagent_7`, `Reagent_8`, `ReagentCount_1`, `ReagentCount_2`, `ReagentCount_3`, `ReagentCount_4`, `ReagentCount_5`, `ReagentCount_6`, `ReagentCount_7`, `ReagentCount_8`, `EquippedItemClass`, `EquippedItemSubClassMask`, `EquippedItemInventoryTypeMask`, `Effect_1`, `Effect_2`, `Effect_3`, `EffectDieSides_1`, `EffectDieSides_2`, `EffectDieSides_3`, `EffectRealPointsPerLevel_1`, `EffectRealPointsPerLevel_2`, `EffectRealPointsPerLevel_3`, `EffectBasePoints_1`, `EffectBasePoints_2`, `EffectBasePoints_3`, `EffectMechanic_1`, `EffectMechanic_2`, `EffectMechanic_3`, `ImplicitTargetA_1`, `ImplicitTargetA_2`, `ImplicitTargetA_3`, `ImplicitTargetB_1`, `ImplicitTargetB_2`, `ImplicitTargetB_3`, `EffectRadiusIndex_1`, `EffectRadiusIndex_2`, `EffectRadiusIndex_3`, `EffectAura_1`, `EffectAura_2`, `EffectAura_3`, `EffectAuraPeriod_1`, `EffectAuraPeriod_2`, `EffectAuraPeriod_3`, `EffectAuraAmplitude_1`, `EffectAuraAmplitude_2`, `EffectAuraAmplitude_3`, `EffectMiscValue_1`, `EffectMiscValue_2`, `EffectMiscValue_3`, `EffectMiscValueB_1`, `EffectMiscValueB_2`, `EffectMiscValueB_3`, `EffectTriggerSpell_1`, `EffectTriggerSpell_2`, `EffectTriggerSpell_3`, `EffectPointsPerComboPoint_1`, `EffectPointsPerComboPoint_2`, `EffectPointsPerComboPoint_3`, `SpellVisual_1`, `SpellVisual_2`, `SpellIconID`, `ActiveIconID`, `SpellPriority`, `Name_Lang_enUS`, `Name_Lang_enGB`, `Name_Lang_koKR`, `Name_Lang_frFR`, `Name_Lang_deDE`, `Name_Lang_enCN`, `Name_Lang_zhCN`, `Name_Lang_enTW`, `Name_Lang_zhTW`, `Name_Lang_esES`, `Name_Lang_esMX`, `Name_Lang_ruRU`, `Name_Lang_ptPT`, `Name_Lang_ptBR`, `Name_Lang_itIT`, `Name_Lang_Unk`, `Name_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_enGB`, `Description_Lang_koKR`, `Description_Lang_frFR`, `Description_Lang_deDE`, `Description_Lang_enCN`, `Description_Lang_zhCN`, `Description_Lang_enTW`, `Description_Lang_zhTW`, `Description_Lang_esES`, `Description_Lang_esMX`, `Description_Lang_ruRU`, `Description_Lang_ptPT`, `Description_Lang_ptBR`, `Description_Lang_itIT`, `Description_Lang_Unk`, `Description_Lang_Mask`
) VALUES (
    12346, 0, 0, 0, 384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, -1, -1, 53, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 400002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enchant Weapon - Panther\'s Agility', '', '', '', '', '', '附魔武器 - 萌萌之敏', '', '', '', '', '', '', '', '', '', 16712190, '', '', '', '', '', '', '附魔武器，增加敏捷2000、攻击强度5000、耐力2000', '', '', '', '', '', '', '', '', '', 16712190
);

-- 附魔法术：萌萌之智
INSERT INTO `spell_dbc` (
    `ID`, `Category`, `DispelType`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `Stances`, `StancesNot`, `Targets`, `TargetCreatureType`, `RequiresSpellFocus`, `FacingCasterFlags`, `CasterAuraState`, `TargetAuraState`, `ExcludeCasterAuraState`, `ExcludeTargetAuraState`, `CasterAuraSpell`, `TargetAuraSpell`, `ExcludeCasterAuraSpell`, `ExcludeTargetAuraSpell`, `CastingTimeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `ProcTypeMask`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `PowerType`, `ManaCost`, `ManaCostPerLevel`, `ManaPerSecond`, `ManaPerSecondPerLevel`, `RangeIndex`, `Speed`, `StackAmount`, `Totem_1`, `Totem_2`, `Reagent_1`, `Reagent_2`, `Reagent_3`, `Reagent_4`, `Reagent_5`, `Reagent_6`, `Reagent_7`, `Reagent_8`, `ReagentCount_1`, `ReagentCount_2`, `ReagentCount_3`, `ReagentCount_4`, `ReagentCount_5`, `ReagentCount_6`, `ReagentCount_7`, `ReagentCount_8`, `EquippedItemClass`, `EquippedItemSubClassMask`, `EquippedItemInventoryTypeMask`, `Effect_1`, `Effect_2`, `Effect_3`, `EffectDieSides_1`, `EffectDieSides_2`, `EffectDieSides_3`, `EffectRealPointsPerLevel_1`, `EffectRealPointsPerLevel_2`, `EffectRealPointsPerLevel_3`, `EffectBasePoints_1`, `EffectBasePoints_2`, `EffectBasePoints_3`, `EffectMechanic_1`, `EffectMechanic_2`, `EffectMechanic_3`, `ImplicitTargetA_1`, `ImplicitTargetA_2`, `ImplicitTargetA_3`, `ImplicitTargetB_1`, `ImplicitTargetB_2`, `ImplicitTargetB_3`, `EffectRadiusIndex_1`, `EffectRadiusIndex_2`, `EffectRadiusIndex_3`, `EffectAura_1`, `EffectAura_2`, `EffectAura_3`, `EffectAuraPeriod_1`, `EffectAuraPeriod_2`, `EffectAuraPeriod_3`, `EffectAuraAmplitude_1`, `EffectAuraAmplitude_2`, `EffectAuraAmplitude_3`, `EffectMiscValue_1`, `EffectMiscValue_2`, `EffectMiscValue_3`, `EffectMiscValueB_1`, `EffectMiscValueB_2`, `EffectMiscValueB_3`, `EffectTriggerSpell_1`, `EffectTriggerSpell_2`, `EffectTriggerSpell_3`, `EffectPointsPerComboPoint_1`, `EffectPointsPerComboPoint_2`, `EffectPointsPerComboPoint_3`, `SpellVisual_1`, `SpellVisual_2`, `SpellIconID`, `ActiveIconID`, `SpellPriority`, `Name_Lang_enUS`, `Name_Lang_enGB`, `Name_Lang_koKR`, `Name_Lang_frFR`, `Name_Lang_deDE`, `Name_Lang_enCN`, `Name_Lang_zhCN`, `Name_Lang_enTW`, `Name_Lang_zhTW`, `Name_Lang_esES`, `Name_Lang_esMX`, `Name_Lang_ruRU`, `Name_Lang_ptPT`, `Name_Lang_ptBR`, `Name_Lang_itIT`, `Name_Lang_Unk`, `Name_Lang_Mask`, `Description_Lang_enUS`, `Description_Lang_enGB`, `Description_Lang_koKR`, `Description_Lang_frFR`, `Description_Lang_deDE`, `Description_Lang_enCN`, `Description_Lang_zhCN`, `Description_Lang_enTW`, `Description_Lang_zhTW`, `Description_Lang_esES`, `Description_Lang_esMX`, `Description_Lang_ruRU`, `Description_Lang_ptPT`, `Description_Lang_ptBR`, `Description_Lang_itIT`, `Description_Lang_Unk`, `Description_Lang_Mask`
) VALUES (
    12347, 0, 0, 0, 384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, -1, -1, 53, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 400003, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enchant Weapon - Archmage\'s Wisdom', '', '', '', '', '', '附魔武器 - 萌萌之智', '', '', '', '', '', '', '', '', '', 16712190, '', '', '', '', '', '', '附魔武器，增加智力2000、法术强度8000、耐力2000', '', '', '', '', '', '', '', '', '', 16712190
);

-- ============================================
-- 附魔卷轴物品定义
-- ============================================

-- 萌萌之力卷轴
INSERT INTO `item_template` (
    `entry`,
    `class`,
    `subclass`,
    `SoundOverrideSubclass`,
    `name`,
    `displayid`,
    `Quality`,
    `Flags`,
    `FlagsExtra`,
    `BuyCount`,
    `BuyPrice`,
    `SellPrice`,
    `InventoryType`,
    `AllowableClass`,
    `AllowableRace`,
    `ItemLevel`,
    `RequiredLevel`,
    `RequiredSkill`,
    `RequiredSkillRank`,
    `requiredspell`,
    `requiredhonorrank`,
    `RequiredCityRank`,
    `RequiredReputationFaction`,
    `RequiredReputationRank`,
    `maxcount`,
    `stackable`,
    `ContainerSlots`,
    `StatsCount`,
    `stat_type1`,
    `stat_value1`,
    `stat_type2`,
    `stat_value2`,
    `stat_type3`,
    `stat_value3`,
    `stat_type4`,
    `stat_value4`,
    `stat_type5`,
    `stat_value5`,
    `stat_type6`,
    `stat_value6`,
    `stat_type7`,
    `stat_value7`,
    `stat_type8`,
    `stat_value8`,
    `stat_type9`,
    `stat_value9`,
    `stat_type10`,
    `stat_value10`,
    `ScalingStatDistribution`,
    `ScalingStatValue`,
    `dmg_min1`,
    `dmg_max1`,
    `dmg_type1`,
    `dmg_min2`,
    `dmg_max2`,
    `dmg_type2`,
    `armor`,
    `holy_res`,
    `fire_res`,
    `nature_res`,
    `frost_res`,
    `shadow_res`,
    `arcane_res`,
    `delay`,
    `ammo_type`,
    `RangedModRange`,
    `spellid_1`,
    `spelltrigger_1`,
    `spellcharges_1`,
    `spellppmRate_1`,
    `spellcooldown_1`,
    `spellcategory_1`,
    `spellcategorycooldown_1`,
    `spellid_2`,
    `spelltrigger_2`,
    `spellcharges_2`,
    `spellppmRate_2`,
    `spellcooldown_2`,
    `spellcategory_2`,
    `spellcategorycooldown_2`,
    `spellid_3`,
    `spelltrigger_3`,
    `spellcharges_3`,
    `spellppmRate_3`,
    `spellcooldown_3`,
    `spellcategory_3`,
    `spellcategorycooldown_3`,
    `spellid_4`,
    `spelltrigger_4`,
    `spellcharges_4`,
    `spellppmRate_4`,
    `spellcooldown_4`,
    `spellcategory_4`,
    `spellcategorycooldown_4`,
    `spellid_5`,
    `spelltrigger_5`,
    `spellcharges_5`,
    `spellppmRate_5`,
    `spellcooldown_5`,
    `spellcategory_5`,
    `spellcategorycooldown_5`,
    `bonding`,
    `description`,
    `PageText`,
    `LanguageID`,
    `PageMaterial`,
    `startquest`,
    `lockid`,
    `Material`,
    `sheath`,
    `RandomProperty`,
    `RandomSuffix`,
    `block`,
    `itemset`,
    `MaxDurability`,
    `area`,
    `Map`,
    `BagFamily`,
    `TotemCategory`,
    `socketColor_1`,
    `socketContent_1`,
    `socketColor_2`,
    `socketContent_2`,
    `socketColor_3`,
    `socketContent_3`,
    `socketBonus`,
    `GemProperties`,
    `RequiredDisenchantSkill`,
    `ArmorDamageModifier`,
    `Duration`,
    `ItemLimitCategory`,
    `HolidayId`,
    `ScriptName`,
    `DisenchantID`,
    `FoodType`,
    `minMoneyLoot`,
    `maxMoneyLoot`,
    `flagsCustom`,
    `WDBVerified`
) VALUES (
    600001,     -- entry
    0,          -- class: Consumable
    0,          -- subclass
    -1,         -- SoundOverrideSubclass
    '萌萌之力卷轴',  -- name
    2588,       -- displayid: 卷轴图标
    4,          -- Quality: Epic
    64,         -- Flags
    0,          -- FlagsExtra
    1,          -- BuyCount
    0,          -- BuyPrice
    0,          -- SellPrice
    0,          -- InventoryType
    -1,         -- AllowableClass
    -1,         -- AllowableRace
    80,         -- ItemLevel
    0,          -- RequiredLevel
    0,          -- RequiredSkill
    0,          -- RequiredSkillRank
    0,          -- requiredspell
    0,          -- requiredhonorrank
    0,          -- RequiredCityRank
    0,          -- RequiredReputationFaction
    0,          -- RequiredReputationRank
    0,          -- maxcount
    1,          -- stackable
    0,          -- ContainerSlots
    0,          -- StatsCount
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  -- stats
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,          -- ScalingStatDistribution
    0,          -- ScalingStatValue
    0, 0, 0, 0, 0, 0,  -- damage
    0,          -- armor
    0, 0, 0, 0, 0, 0,  -- resistances
    0,          -- delay
    0,          -- ammo_type
    0,          -- RangedModRange
    12345,      -- spellid_1: 附魔法术ID
    0,          -- spelltrigger_1: On Use
    -1,         -- spellcharges_1
    0,          -- spellppmRate_1
    -1,         -- spellcooldown_1
    0,          -- spellcategory_1
    -1,         -- spellcategorycooldown_1
    0, 0, 0, 0, -1, 0, -1,  -- spell 2
    0, 0, 0, 0, -1, 0, -1,  -- spell 3
    0, 0, 0, 0, -1, 0, -1,  -- spell 4
    0, 0, 0, 0, -1, 0, -1,  -- spell 5
    0,          -- bonding
    '附魔武器，增加力量2000、攻击强度5000、耐力2000',  -- description
    0, 0, 0, 0, 0,  -- PageText, LanguageID, PageMaterial, startquest, lockid
    -1,         -- Material
    0,          -- sheath
    0,          -- RandomProperty
    0,          -- RandomSuffix
    0,          -- block
    0,          -- itemset
    0,          -- MaxDurability
    0, 0, 0, 0,  -- area, Map, BagFamily, TotemCategory
    0, 0, 0, 0, 0, 0,  -- sockets
    0,          -- socketBonus
    0,          -- GemProperties
    -1,         -- RequiredDisenchantSkill
    0,          -- ArmorDamageModifier
    0,          -- Duration
    0,          -- ItemLimitCategory
    0,          -- HolidayId
    '',         -- ScriptName
    0,          -- DisenchantID
    0,          -- FoodType
    0, 0,       -- minMoneyLoot, maxMoneyLoot
    0,          -- flagsCustom
    12340       -- WDBVerified
);

-- 萌萌之敏卷轴
INSERT INTO `item_template` (
    `entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `Duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `WDBVerified`
) VALUES (
    600002, 0, 0, -1, '萌萌之敏卷轴', 2588, 4, 64, 0, 1, 0, 0, 0, -1, -1, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12346, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, '附魔武器，增加敏捷2000、攻击强度5000、耐力2000', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 12340
);

-- 萌萌之智卷轴
INSERT INTO `item_template` (
    `entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `Duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `WDBVerified`
) VALUES (
    600003, 0, 0, -1, '萌萌之智卷轴', 2588, 4, 64, 0, 1, 0, 0, 0, -1, -1, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12347, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, '附魔武器，增加智力2000、法术强度8000、耐力2000', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 12340
);

-- ============================================
-- 验证查询
-- ============================================
-- 查看附魔卷轴物品
SELECT entry, name, Quality, description FROM item_template WHERE entry IN (600001, 600002, 600003);

-- 查看附魔法术
SELECT ID, Name_Lang_zhCN, Description_Lang_zhCN FROM spell_dbc WHERE ID IN (12345, 12346, 12347);

-- ============================================
-- 使用说明
-- ============================================
/*
1. 执行此SQL文件导入数据库
2. 重启AzerothCore服务器
3. 在游戏中使用GM命令获取卷轴：
   .additem 600001  (萌萌之力卷轴)
   .additem 600002  (萌萌之敏卷轴)
   .additem 600003  (萌萌之智卷轴)
4. 对武器使用卷轴进行附魔
5. 检查附魔效果

注意：
- 卷轴物品名称会显示在物品提示框中
- 附魔后装备会显示属性加成
- 属性加成会自动显示，无需修改客户端
*/
