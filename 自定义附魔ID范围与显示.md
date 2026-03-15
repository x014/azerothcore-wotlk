# 自定义附魔ID范围与客户端显示

## 附魔ID范围分析

### 当前系统中的ID范围

根据你的 `spellitemenchantment_dbc.sql` 文件分析：

| ID范围 | 说明 | 来源 |
|--------|------|------|
| 1 - 999 | 官方基础附魔 | 客户端DBC |
| 1000 - 299999 | 官方扩展附魔 | 客户端DBC |
| **300000 - 500000** | **自定义附魔区域** | 数据库表 |

**你的自定义附魔ID**：
- 300252 - 300733：自定义附魔
- 500169 - 500188：自定义附魔

### ID冲突风险分析

#### 低风险区域（推荐）
```
300000 - 399999：安全区域，几乎不会冲突
400000 - 499999：安全区域，几乎不会冲突
```

#### 中等风险区域
```
200000 - 299999：可能被官方扩展使用
```

#### 高风险区域（避免使用）
```
1 - 199999：官方附魔ID，绝对不要使用
```

### 如何避免冲突

**方法1：查询现有ID**
```sql
-- 检查ID是否已存在
SELECT ID FROM spellitemenchantment_dbc WHERE ID = 300733;
SELECT ID FROM spell_dbc WHERE ID = 300733;
```

**方法2：使用安全的ID范围**
```sql
-- 推荐使用 300000-399999 范围
INSERT INTO spellitemenchantment_dbc (ID, ...) VALUES (300001, ...);
INSERT INTO spellitemenchantment_dbc (ID, ...) VALUES (300002, ...);
```

## 客户端显示机制

### 1. 附魔可视化

位置：`src/server/game/Entities/Player/PlayerStorage.cpp:2958-2960`

```cpp
// 装备物品时设置可见的附魔ID
SetUInt32Value(PLAYER_VISIBLE_ITEM_1_ENTRYID + (slot * 2), pItem->GetEntry());
SetUInt16Value(PLAYER_VISIBLE_ITEM_1_ENCHANTMENT + (slot * 2), 0, pItem->GetEnchantmentId(PERM_ENCHANTMENT_SLOT));
SetUInt16Value(PLAYER_VISIBLE_ITEM_1_ENCHANTMENT + (slot * 2), 1, pItem->GetEnchantmentId(TEMP_ENCHANTMENT_SLOT));
```

### 2. 附魔显示流程

```
玩家装备物品
    ↓
服务器发送物品数据包 (SMSG_ITEM_QUERY_SINGLE_RESPONSE)
    ↓
客户端接收物品数据（包括附魔ID）
    ↓
客户端查询本地DBC文件获取附魔信息
    ↓
显示附魔名称和效果
```

### 3. 客户端显示内容

客户端会显示以下信息：

#### A. 物品提示框（Tooltip）
```
[物品名称]
+30 力量
+30 敏捷
装备：增加攻击强度 40 点
```

#### B. 武器光效
- 永久附魔：武器发光效果
- 临时附魔：临时光效

#### C. 角色面板
- 属性面板显示增加的属性
- 装备栏显示附魔图标

## 自定义附魔的客户端显示问题

### 问题1：客户端不显示附魔名称

**原因**：客户端DBC文件中没有对应的附魔名称

**解决方案**：

#### 方案A：修改客户端DBC文件（不推荐）
需要修改客户端的 `SpellItemEnchantment.dbc` 文件，但这会：
- 违反客户端完整性
- 需要所有玩家修改客户端
- 更新困难

#### 方案B：使用服务器端显示（推荐）
服务器会自动计算属性加成，客户端显示为：
```
装备：+30 力量
装备：+30 敏捷
```

### 问题2：武器光效不显示

**原因**：客户端DBC文件中没有附魔的视觉效果ID

**解决方案**：
- 接受没有光效（属性仍然生效）
- 或使用现有附魔的视觉效果ID

## 完整的自定义附魔示例

### 示例1：简单的属性附魔

```sql
-- 野性之心五：+30 力量 + 30 敏捷
INSERT INTO spellitemenchantment_dbc (
    ID, Charges, 
    Effect_1, EffectPointsMin_1, EffectArg_1,
    Effect_2, EffectPointsMin_2, EffectArg_2,
    Name_Lang_enUS
) VALUES (
    300001, 0,
    5, 30, 4,    -- +30 力量
    5, 30, 3,    -- +30 敏捷
    'Wild Heart V'
);
```

**客户端显示**：
```
装备：+30 力量
装备：+30 敏捷
```

### 示例2：法术强度附魔

```sql
-- 法术强度附魔：+40 法术强度
INSERT INTO spellitemenchantment_dbc (
    ID, Charges, 
    Effect_1, EffectPointsMin_1, EffectArg_1,
    Name_Lang_enUS
) VALUES (
    300002, 0,
    5, 40, 45,   -- +40 法术强度
    'Enchant Weapon - Spell Power'
);
```

**客户端显示**：
```
装备：+40 法术强度
```

### 示例3：多属性附魔

```sql
-- 全能附魔：+15 全属性
INSERT INTO spellitemenchantment_dbc (
    ID, Charges, 
    Effect_1, EffectPointsMin_1, EffectArg_1,
    Effect_2, EffectPointsMin_2, EffectArg_2,
    Effect_3, EffectPointsMin_3, EffectArg_3,
    Name_Lang_enUS
) VALUES (
    300003, 0,
    5, 15, 3,    -- +15 敏捷
    5, 15, 4,    -- +15 力量
    5, 15, 7,    -- +15 耐力
    'All Stats Enchant'
);
```

**客户端显示**：
```
装备：+15 敏捷
装备：+15 力量
装备：+15 耐力
```

## 客户端显示对照表

### 属性类型显示

| EffectArg值 | 属性类型 | 客户端显示文本 |
|------------|---------|---------------|
| 3 | 敏捷 | "装备：+X 敏捷" |
| 4 | 力量 | "装备：+X 力量" |
| 5 | 智力 | "装备：+X 智力" |
| 6 | 精神 | "装备：+X 精神" |
| 7 | 耐力 | "装备：+X 耐力" |
| 38 | 攻击强度 | "装备：+X 攻击强度" |
| 45 | 法术强度 | "装备：+X 法术强度" |

### 评定类型显示

| EffectArg值 | 评定类型 | 客户端显示文本 |
|------------|---------|---------------|
| 31 | 命中等级 | "装备：+X 命中等级" |
| 32 | 暴击等级 | "装备：+X 暴击等级" |
| 35 | 韧性等级 | "装备：+X 韧性等级" |
| 36 | 急速等级 | "装备：+X 急速等级" |
| 37 | 精通等级 | "装备：+X 精通等级" |
| 44 | 护甲穿透 | "装备：+X 护甲穿透等级" |

## 如何测试自定义附魔

### 步骤1：添加附魔数据

```sql
-- 添加附魔
INSERT INTO spellitemenchantment_dbc (
    ID, Charges, Effect_1, EffectPointsMin_1, EffectArg_1, Name_Lang_enUS
) VALUES (
    300001, 0, 5, 30, 4, 'Test Enchant'
);
```

### 步骤2：创建附魔卷轴物品

```sql
-- 创建附魔卷轴物品
INSERT INTO item_template (
    entry, class, subclass, name, spellid_1, spelltrigger_1
) VALUES (
    600001, 0, 0, 'Test Enchant Scroll', 12345, 0
);
```

### 步骤3：创建附魔法术

```sql
-- 创建附魔法术
INSERT INTO spell_dbc (
    ID, Effect_1, EffectMiscValue_1, Name_Lang_enUS
) VALUES (
    12345, 53, 300001, 'Apply Test Enchant'
);
```

### 步骤4：测试

1. 重启服务器
2. 在游戏中获取附魔卷轴
3. 对物品使用附魔
4. 检查物品提示框
5. 检查属性面板

## 常见问题解答

### Q1: 自定义附魔ID会冲突吗？

**A**: 使用 300000-399999 范围几乎不会冲突。官方ID通常在 1-299999 范围内。

### Q2: 客户端为什么不显示附魔名称？

**A**: 客户端DBC文件中没有自定义附魔的名称。但属性加成仍然生效，客户端会显示属性增加。

### Q3: 如何让客户端显示自定义名称？

**A**: 需要修改客户端DBC文件（不推荐），或接受服务器端显示的属性描述。

### Q4: 武器光效能自定义吗？

**A**: 可以使用现有附魔的视觉效果ID（ItemVisual字段），但无法创建全新的光效。

### Q5: 自定义附魔会影响其他玩家吗？

**A**: 不会。自定义附魔只影响你的服务器，其他服务器不会看到这些附魔。

## 总结

### ID范围建议
- **安全范围**：300000 - 399999
- **避免范围**：1 - 299999（官方ID）

### 客户端显示
- **属性加成**：自动显示
- **附魔名称**：需要修改客户端DBC（不推荐）
- **武器光效**：可使用现有效果ID

### 最佳实践
1. 使用安全的ID范围
2. 使用属性加成类型（Effect_1 = 5）
3. 接受服务器端显示
4. 充分测试后再部署

自定义附魔完全可行，只要遵循正确的ID范围和配置方式！
