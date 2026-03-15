# 客户端DBC文件修改指南

## 需要修改的DBC文件

### 主要文件：SpellItemEnchantment.dbc

**文件位置**：
```
客户端目录/Data/zhCN/patch-zhCN-2.MPQ
    └─ SpellItemEnchantment.dbc
```

**作用**：定义附魔的名称、效果、视觉效果等

### 相关DBC文件

| DBC文件 | 作用 | 是否需要修改 |
|---------|------|-------------|
| SpellItemEnchantment.dbc | 附魔定义 | ✅ **必须修改** |
| SpellItemEnchantmentCondition.dbc | 附魔条件 | ❌ 不需要（如果有多彩宝石条件） |
| Spell.dbc | 法术定义 | ❌ 不需要（服务器端已有） |
| SpellVisual.dbc | 法术视觉效果 | ❌ 不需要（可选） |

## 修改工具

### 推荐工具

#### 1. MyDBCEditor（推荐）⭐⭐⭐⭐⭐
- **下载地址**：https://github.com/Barncore/MyDBCEditor
- **优点**：
  - 图形界面，易于使用
  - 支持中文
  - 支持批量编辑
  - 自动备份

#### 2. DBCUtil
- **下载地址**：https://github.com/TrinityCore/TrinityCore/tree/master/contrib/dbc_extractor
- **优点**：
  - 命令行工具
  - 支持批量处理
  - 开源免费

#### 3. WoW DBC Editor
- **下载地址**：各大魔兽世界开发论坛
- **优点**：
  - 专门为魔兽世界设计
  - 支持所有DBC格式

### MPQ编辑工具

#### 1. Ladik's MPQ Editor（推荐）⭐⭐⭐⭐⭐
- **下载地址**：http://www.zezula.net/en/mpq/download.html
- **优点**：
  - 支持所有MPQ格式
  - 图形界面
  - 支持批量操作

#### 2. WinMPQ
- **下载地址**：各大游戏开发论坛
- **优点**：
  - 轻量级
  - 操作简单

## 详细修改步骤

### 步骤1：准备工作

#### 1.1 备份客户端文件
```bash
# 备份整个客户端（重要！）
复制整个魔兽世界客户端目录到其他位置

# 或至少备份MPQ文件
复制 Data/zhCN/patch-zhCN-2.MPQ 到安全位置
```

#### 1.2 安装工具
```bash
# 下载并安装
1. MyDBCEditor
2. Ladik's MPQ Editor
```

### 步骤2：提取DBC文件

#### 2.1 使用MPQ编辑器提取
```
1. 打开 Ladik's MPQ Editor
2. 文件 -> 打开 -> 选择 patch-zhCN-2.MPQ
3. 找到 SpellItemEnchantment.dbc
4. 右键 -> 提取
5. 保存到工作目录
```

#### 2.2 使用命令行提取
```bash
# 使用MPQEditor命令行
MPQEditor.exe extract patch-zhCN-2.MPQ SpellItemEnchantment.dbc ./output/
```

### 步骤3：编辑DBC文件

#### 3.1 使用MyDBCEditor编辑

**打开文件**：
```
1. 启动 MyDBCEditor
2. 文件 -> 打开 -> 选择 SpellItemEnchantment.dbc
3. 选择格式：SpellItemEnchantment.dbc
```

**添加新附魔**：
```
1. 点击 "添加行" 或 "插入行"
2. 填写字段：

ID: 400001
Charges: 0
Effect_1: 5 (STAT)
EffectPointsMin_1: 2000
EffectPointsMax_1: 2000
EffectArg_1: 4 (力量)
Effect_2: 5 (STAT)
EffectPointsMin_2: 5000
EffectPointsMax_2: 5000
EffectArg_2: 38 (攻击强度)
Effect_3: 5 (STAT)
EffectPointsMin_3: 2000
EffectPointsMax_3: 2000
EffectArg_3: 7 (耐力)
Name_Lang_enUS: Titan's Might
Name_Lang_zhCN: 萌萌之力
ItemVisual: 0 (或选择现有视觉效果ID)
Flags: 0
Src_ItemID: 0
Condition_Id: 0
RequiredSkillID: 0
RequiredSkillRank: 0
MinLevel: 0
```

**复制粘贴法（推荐）**：
```
1. 找到现有的类似附魔（如ID 3847）
2. 右键 -> 复制行
3. 右键 -> 粘贴行
4. 修改ID和名称
5. 修改效果数值
```

#### 3.2 字段说明

| 字段名 | 类型 | 说明 | 示例值 |
|--------|------|------|--------|
| ID | uint32 | 附魔ID | 400001 |
| Charges | uint32 | 充能次数 | 0 |
| Effect_1 | uint32 | 效果类型1 | 5 (STAT) |
| EffectPointsMin_1 | uint32 | 效果最小值1 | 2000 |
| EffectPointsMax_1 | uint32 | 效果最大值1 | 2000 |
| EffectArg_1 | uint32 | 效果参数1 | 4 (力量) |
| ... | ... | ... | ... |
| Name_Lang_enUS | string | 英文名称 | Titan's Might |
| Name_Lang_zhCN | string | 中文名称 | 萌萌之力 |
| ItemVisual | uint32 | 视觉效果ID | 0 |
| Flags | uint32 | 标志 | 0 |
| Src_ItemID | uint32 | 来源物品ID | 0 |
| Condition_Id | uint32 | 条件ID | 0 |
| RequiredSkillID | uint32 | 所需技能ID | 0 |
| RequiredSkillRank | uint32 | 所需技能等级 | 0 |
| MinLevel | uint32 | 最低等级 | 0 |

#### 3.3 批量添加

**使用SQL转DBC**：
```sql
-- 先在服务器端数据库添加
INSERT INTO spellitemenchantment_dbc (...) VALUES (...);

-- 然后导出为DBC格式
-- 使用工具将数据库数据转换为DBC文件
```

### 步骤4：保存DBC文件

#### 4.1 保存修改
```
1. 文件 -> 保存
2. 保存为 SpellItemEnchantment.dbc
3. 确保格式正确
```

#### 4.2 验证文件
```
1. 文件 -> 验证
2. 检查是否有错误
3. 确保所有字段正确
```

### 步骤5：打包回MPQ文件

#### 5.1 创建新MPQ文件（推荐）

**使用MPQ编辑器**：
```
1. 打开 Ladik's MPQ Editor
2. 文件 -> 新建MPQ
3. 添加文件 -> 选择修改后的 SpellItemEnchantment.dbc
4. 保存为 patch-zhCN-3.MPQ（注意：使用更高的编号）
5. 放到客户端 Data/zhCN/ 目录
```

**命名规则**：
```
patch-zhCN-2.MPQ  ← 原始文件（不要修改）
patch-zhCN-3.MPQ  ← 你的自定义文件（新增）
patch-zhCN-4.MPQ  ← 其他自定义文件（如果有）
```

#### 5.2 替换原MPQ文件（不推荐）

**警告**：不推荐直接修改原始MPQ文件！

```
1. 备份原始 patch-zhCN-2.MPQ
2. 打开原始MPQ文件
3. 删除原始 SpellItemEnchantment.dbc
4. 添加修改后的 SpellItemEnchantment.dbc
5. 保存
```

### 步骤6：测试

#### 6.1 启动客户端
```
1. 启动魔兽世界客户端
2. 检查是否有错误
3. 进入游戏
```

#### 6.2 测试附魔
```
1. 获取附魔物品
2. 对武器使用附魔
3. 检查附魔名称是否显示
4. 检查属性是否正确
```

## 完整示例：添加三个附魔

### 示例DBC数据

```
ID: 400001
Name_Lang_zhCN: 萌萌之力
Effect_1: 5, EffectPointsMin_1: 2000, EffectArg_1: 4 (力量)
Effect_2: 5, EffectPointsMin_2: 5000, EffectArg_2: 38 (攻击强度)
Effect_3: 5, EffectPointsMin_3: 2000, EffectArg_3: 7 (耐力)

ID: 400002
Name_Lang_zhCN: 萌萌之敏
Effect_1: 5, EffectPointsMin_1: 2000, EffectArg_1: 3 (敏捷)
Effect_2: 5, EffectPointsMin_2: 5000, EffectArg_2: 38 (攻击强度)
Effect_3: 5, EffectPointsMin_3: 2000, EffectArg_3: 7 (耐力)

ID: 400003
Name_Lang_zhCN: 萌萌之智
Effect_1: 5, EffectPointsMin_1: 2000, EffectArg_1: 5 (智力)
Effect_2: 5, EffectPointsMin_2: 8000, EffectArg_2: 45 (法术强度)
Effect_3: 5, EffectPointsMin_3: 2000, EffectArg_3: 7 (耐力)
```

## 注意事项

### ⚠️ 重要警告

#### 1. 客户端完整性
```
❌ 修改客户端违反用户协议
❌ 可能导致账号封禁
❌ 可能导致客户端不稳定
❌ 更新时会被覆盖
```

#### 2. 分发问题
```
❌ 所有玩家都需要修改客户端
❌ 难以统一管理
❌ 更新困难
```

#### 3. 兼容性问题
```
⚠️ 不同客户端版本可能不兼容
⚠️ 64位/32位客户端可能需要不同处理
⚠️ Mac客户端需要单独处理
```

### ✅ 最佳实践

#### 1. 使用自定义MPQ文件
```
✅ 创建 patch-zhCN-3.MPQ（不修改原文件）
✅ 只包含自定义内容
✅ 易于分发和更新
```

#### 2. 版本控制
```
✅ 保留原始DBC文件备份
✅ 记录所有修改
✅ 使用版本号管理
```

#### 3. 测试流程
```
✅ 在测试环境先测试
✅ 检查所有功能
✅ 确认无错误后再分发
```

## 替代方案对比

| 方案 | 难度 | 效果 | 风险 | 推荐度 |
|------|------|------|------|--------|
| 修改客户端DBC | ⭐⭐⭐⭐⭐ | 完美显示 | 高 | ⭐ |
| 创建卷轴物品 | ⭐⭐ | 物品名称显示 | 低 | ⭐⭐⭐⭐⭐ |
| 接受现状 | ⭐ | 属性显示 | 无 | ⭐⭐⭐⭐ |

## 工具下载链接

### DBC编辑工具
- MyDBCEditor: https://github.com/Barncore/MyDBCEditor
- DBCUtil: https://github.com/TrinityCore/TrinityCore/tree/master/contrib/dbc_extractor

### MPQ编辑工具
- Ladik's MPQ Editor: http://www.zezula.net/en/mpq/download.html
- WinMPQ: https://www.hiveworkshop.com/threads/winmpq.107282/

### 其他工具
- CascView (新格式): https://github.com/ladislav-zezula/CascView
- DBCViewer: https://wowdev.wiki/DBC

## 总结

### 如果坚持修改客户端DBC：

**推荐流程**：
1. 提取 SpellItemEnchantment.dbc
2. 使用 MyDBCEditor 编辑
3. 创建 patch-zhCN-3.MPQ
4. 放到客户端 Data/zhCN/ 目录
5. 测试验证

**但是强烈建议**：
- 使用服务器端方案（创建卷轴物品）
- 不修改客户端
- 避免潜在风险

### 最终建议

**对于私服运营**：
- ✅ 使用服务器端方案
- ✅ 创建附魔卷轴物品
- ✅ 不要求玩家修改客户端

**对于个人学习**：
- ✅ 可以尝试修改DBC
- ✅ 了解客户端结构
- ✅ 积累开发经验

选择最适合你的方案！
