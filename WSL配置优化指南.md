# WSL 配置优化指南

## 问题背景

在使用 VS Code / Trae IDE 连接 WSL 目录时，经常出现连接断开重连的问题。

## 诊断结果

### 当前系统配置

| 项目 | 值 |
|------|-----|
| 物理内存 | 32GB |
| CPU | AMD Ryzen 7 5800 (8核16线程) |
| WSL 版本 | 2.6.3.0 |
| WSL 内核 | 6.6.87.2-WSL2 |
| WSL 默认内存 | 16GB (自动分配 50%) |
| inotify watches | 1,048,576 (已优化) |
| systemd | 已启用 |

### 发现的问题

**没有 `.wslconfig` 文件** - WSL2 默认会在空闲一段时间后自动关闭虚拟机，导致连接断开。

## 解决方案

### 1. 创建 `.wslconfig` 文件

在 Windows 端创建文件 `C:\Users\<用户名>\.wslconfig`：

```ini
[wsl2]
memory=24GB
swap=8GB
processors=16
localhostForwarding=true
vmIdleTimeout=-1
```

**参数说明：**

| 参数 | 作用 |
|------|------|
| `memory=24GB` | WSL 最大可用内存（按需分配，非预占） |
| `swap=8GB` | 交换空间大小 |
| `processors=16` | 可用 CPU 核心数 |
| `localhostForwarding=true` | 确保 localhost 端口转发正常 |
| `vmIdleTimeout=-1` | **禁用自动休眠，防止空闲断连** |

### 2. 重启 WSL 使配置生效

在 Windows PowerShell 中执行：

```powershell
wsl --shutdown
```

然后重新打开 WSL 终端。

## 内存分配机制说明

**重要：`memory` 参数是上限，不是预分配**

- WSL 按需动态分配内存，只占用实际使用的部分
- 空闲时会自动释放内存给 Windows 系统
- 设置 24GB 上限不会影响 Windows 正常使用

| 场景 | 实际内存占用 |
|------|-------------|
| WSL 启动时 | ~500MB - 1GB |
| 编译时 | 逐渐增长到 8-16GB |
| 编译完成后 | 逐渐释放到 2-4GB |
| 空闲时 | 可能释放到 1-2GB |

## 编译建议

AzerothCore 编译在 WSL 中进行，建议配置：

```bash
# 创建 build 目录
mkdir -p build && cd build

# 配置
cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/azeroth-server \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DSCRIPTS=static -DMODULES=static

# 编译 - 使用 12 个并行任务，平衡速度和内存
make -j12
```

**内存与并行任务参考：**

| 并行任务数 | 预估内存需求 |
|-----------|-------------|
| make -j8 | 8-16GB |
| make -j12 | 12-24GB |
| make -j16 | 16-32GB |

## 其他优化建议

### 1. 增加 inotify 监控数量（已配置）

```bash
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```

### 2. 保持 WSL 活跃（可选）

如果仍有断连问题，可以在 WSL 中运行后台进程：

```bash
nohup sleep infinity &
```

### 3. Windows 快速启动

如果问题持续，可以尝试禁用 Windows 快速启动：
- 控制面板 → 电源选项 → 选择电源按钮的功能 → 取消勾选"启用快速启动"

## 验证配置

检查 WSL 配置是否生效：

```bash
# 查看内存
free -h

# 查看 .wslconfig 是否存在
cat /mnt/c/Users/*/\.wslconfig

# 查看 WSL 状态
wsl.exe -l -v
```

## 参考资料

- [WSL 配置官方文档](https://learn.microsoft.com/zh-cn/windows/wsl/wsl-config)
- [WSL 内存管理](https://learn.microsoft.com/zh-cn/windows/wsl/wsl-config#configuration-setting-for-wslconfig)
