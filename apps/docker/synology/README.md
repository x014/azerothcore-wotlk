# AzerothCore Docker 部署指南 - 群晖 DSM 6.2

## 概述

本指南专为群晖 DSM 6.2 的 Docker 环境优化，采用**预构建镜像**方案：
- 在开发机上编译构建镜像
- 推送到镜像仓库
- 群晖只需拉取镜像运行，无需编译

## 目录结构

```
apps/docker/synology/
├── Dockerfile           # 兼容 DSM 6.2 的 Dockerfile
├── docker-compose.yml   # 运行时配置（群晖用）
├── build-images.sh      # 构建脚本（开发机用）
├── entrypoint.sh        # 容器入口脚本
├── .env.example         # 环境变量模板
└── README.md            # 本文档
```

---

## 第一步：在开发机上构建镜像

### 1. 配置镜像仓库

```bash
# 设置镜像仓库地址（二选一）

# Docker Hub
export DOCKER_REGISTRY=docker.io/your-username/

# 或私有仓库
export DOCKER_REGISTRY=registry.cn-hangzhou.aliyuncs.com/x014/

# 设置镜像标签
export IMAGE_TAG=latest
```

### 2. 登录镜像仓库

```bash
# Docker Hub
docker login

# 或私有仓库
docker login registry.cn-hangzhou.aliyuncs.com/x014/
```

### 3. 构建并推送镜像

```bash
cd /path/to/azerothcore-wotlk

# 构建所有镜像
./apps/docker/synology/build-images.sh build

# 推送到仓库
./apps/docker/synology/build-images.sh push

# 或一步完成
./apps/docker/synology/build-images.sh all
```

构建的镜像：
- `ac-wotlk-authserver` - 认证服务器
- `ac-wotlk-worldserver` - 世界服务器
- `ac-wotlk-db-import` - 数据库导入工具

---

## 第二步：在群晖上部署

### 1. 准备目录

```bash
# SSH 登录群晖
ssh admin@your-nas-ip

# 创建项目目录
mkdir -p /volume2/docker/azerothcore/{etc,logs,data}
cd /volume2/docker/azerothcore
```

### 2. 准备数据库

如果群晖上还没有安装MySQL。

创建专用数据库用户：

```bash
# SSH 登录群晖后，连接 MySQL
mysql -u root -p -P 3307

# 创建专用用户
CREATE USER 'acore'@'%' IDENTIFIED BY '你的密码';

# 创建数据库
CREATE DATABASE acore_auth;
CREATE DATABASE acore_world;
CREATE DATABASE acore_characters;
CREATE DATABASE acore_playerbots;

# 授权
GRANT ALL PRIVILEGES ON acore_auth.* TO 'acore'@'%';
GRANT ALL PRIVILEGES ON acore_world.* TO 'acore'@'%';
GRANT ALL PRIVILEGES ON acore_characters.* TO 'acore'@'%';
GRANT ALL PRIVILEGES ON acore_playerbots.* TO 'acore'@'%';
FLUSH PRIVILEGES;
exit;
```

### 3. 下载客户端数据

客户端数据需要手动下载并放置到 `data` 目录：

```bash
# 下载客户端数据包（约 1.5GB）
# 从以下地址下载：
# https://github.com/wowgaming/client-data/releases

# 解压到 data 目录
unzip client-data-*.zip -d data/
```

或者使用 wget：
```bash
cd /volume2/docker/azerothcore/data
wget https://github.com/wowgaming/client-data/releases/download/v14/data.zip
unzip data.zip
rm data.zip
```

### 4. 创建配置文件

创建 `.env` 文件：

```bash
cat > .env << 'EOF'
# 镜像配置 - 填写你的镜像仓库地址
DOCKER_REGISTRY=registry.cn-hangzhou.aliyuncs.com/x014/
IMAGE_PREFIX=
DOCKER_IMAGE_TAG=latest

# 数据库配置 (使用现有 MariaDB)
DB_HOST=host.docker.internal
DB_PORT=3307
DB_USER=acore
DB_PASSWORD=your_password

# 服务器端口
DOCKER_AUTH_EXTERNAL_PORT=3724
DOCKER_WORLD_EXTERNAL_PORT=8085
DOCKER_SOAP_EXTERNAL_PORT=7878

# 用户/组 ID（运行 'id' 命令查看，为空则使用 root）
DOCKER_USER_ID=1026
DOCKER_GROUP_ID=100

# 数据目录（使用绝对路径）
DOCKER_VOL_ETC=/volume2/docker/azerothcore/etc
DOCKER_VOL_LOGS=/volume2/docker/azerothcore/logs
DOCKER_VOL_DATA=/volume2/docker/azerothcore/data
EOF
```

### 5. 创建 docker-compose.yml

将 `apps/docker/synology/docker-compose.yml` 复制到群晖，或直接创建：

```bash
cat > docker-compose.yml << 'EOF'
version: "2.4"

services:
  ac-db-import:
    container_name: ac-db-import
    image: ${DOCKER_REGISTRY}${IMAGE_PREFIX}ac-wotlk-db-import:${DOCKER_IMAGE_TAG:-latest}
    user: ${DOCKER_USER_ID:-0}:${DOCKER_GROUP_ID:-0}
    networks:
      - ac-network
    environment:
      - AC_DATA_DIR=/azerothcore/env/dist/data
      - AC_LOGS_DIR=/azerothcore/env/dist/logs
      - AC_LOGIN_DATABASE_INFO=${DB_HOST};${DB_PORT};${DB_USER:-root};${DB_PASSWORD};acore_auth
      - AC_WORLD_DATABASE_INFO=${DB_HOST};${DB_PORT};${DB_USER:-root};${DB_PASSWORD};acore_world
      - AC_CHARACTER_DATABASE_INFO=${DB_HOST};${DB_PORT};${DB_USER:-root};${DB_PASSWORD};acore_characters
    volumes:
      - ${DOCKER_VOL_ETC:-./etc}:/azerothcore/env/dist/etc
      - ${DOCKER_VOL_LOGS:-./logs}:/azerothcore/env/dist/logs
      - ${DOCKER_VOL_DATA:-./data}:/azerothcore/env/dist/data:ro
    extra_hosts:
      - "host.docker.internal:host-gateway"

  ac-worldserver:
    container_name: ac-worldserver
    image: ${DOCKER_REGISTRY}${IMAGE_PREFIX}ac-wotlk-worldserver:${DOCKER_IMAGE_TAG:-latest}
    user: ${DOCKER_USER_ID:-0}:${DOCKER_GROUP_ID:-0}
    networks:
      - ac-network
    stdin_open: true
    tty: true
    restart: unless-stopped
    environment:
      - AC_DATA_DIR=/azerothcore/env/dist/data
      - AC_LOGS_DIR=/azerothcore/env/dist/logs
      - AC_LOGIN_DATABASE_INFO=${DB_HOST};${DB_PORT};${DB_USER:-root};${DB_PASSWORD};acore_auth
      - AC_WORLD_DATABASE_INFO=${DB_HOST};${DB_PORT};${DB_USER:-root};${DB_PASSWORD};acore_world
      - AC_CHARACTER_DATABASE_INFO=${DB_HOST};${DB_PORT};${DB_USER:-root};${DB_PASSWORD};acore_characters
    ports:
      - "${DOCKER_WORLD_EXTERNAL_PORT:-8085}:8085"
      - "${DOCKER_SOAP_EXTERNAL_PORT:-7878}:7878"
    volumes:
      - ${DOCKER_VOL_ETC:-./etc}:/azerothcore/env/dist/etc
      - ${DOCKER_VOL_LOGS:-./logs}:/azerothcore/env/dist/logs
      - ${DOCKER_VOL_DATA:-./data}:/azerothcore/env/dist/data:ro
    extra_hosts:
      - "host.docker.internal:host-gateway"

  ac-authserver:
    container_name: ac-authserver
    image: ${DOCKER_REGISTRY}${IMAGE_PREFIX}ac-wotlk-authserver:${DOCKER_IMAGE_TAG:-latest}
    user: ${DOCKER_USER_ID:-0}:${DOCKER_GROUP_ID:-0}
    networks:
      - ac-network
    tty: true
    restart: unless-stopped
    environment:
      - AC_LOGS_DIR=/azerothcore/env/dist/logs
      - AC_TEMP_DIR=/azerothcore/env/dist/temp
      - AC_LOGIN_DATABASE_INFO=${DB_HOST};${DB_PORT};${DB_USER:-root};${DB_PASSWORD};acore_auth
    volumes:
      - ${DOCKER_VOL_ETC:-./etc}:/azerothcore/env/dist/etc
      - ${DOCKER_VOL_LOGS:-./logs}:/azerothcore/env/dist/logs
    ports:
      - "${DOCKER_AUTH_EXTERNAL_PORT:-3724}:3724"
    extra_hosts:
      - "host.docker.internal:host-gateway"

networks:
  ac-network:
EOF
```

### 6. 拉取镜像并启动

```bash
# 拉取镜像
docker-compose pull

# 启动服务
docker-compose up -d

# 查看日志
docker-compose logs -f
```

---

## 服务端口

| 服务 | 端口 | 说明 |
|------|------|------|
| authserver | 3724 | 登录认证服务 |
| worldserver | 8085 | 游戏世界服务 |
| SOAP | 7878 | 远程管理接口 |

---

## 常用命令

```bash
# 查看状态
docker-compose ps

# 查看日志
docker-compose logs -f worldserver
docker-compose logs -f authserver

# 重启服务
docker-compose restart

# 停止服务
docker-compose down

# 更新镜像
docker-compose pull
docker-compose up -d

# 进入容器
docker exec -it ac-worldserver bash
```

---

## 故障排除

### 权限问题

```bash
# 修改目录所有权
sudo chown -R 1026:100 /volume2/docker/azerothcore
```

### 镜像拉取失败

```bash
# 登录镜像仓库
docker login docker.io
# 或
docker login registry.example.com
```

### 数据库连接问题

```bash
# 检查数据库状态
docker logs ac-database

# 手动测试连接
docker exec -it ac-database mysql -u root -p
```

---

## 备份

```bash
# 备份数据库
docker exec ac-database mysqldump -u root -p'password' \
  acore_auth acore_world acore_characters > backup_$(date +%Y%m%d).sql

# 备份配置
tar -czvf config_backup.tar.gz etc/
```

---

## 更新流程

1. 在开发机上拉取最新代码
2. 重新构建并推送镜像
3. 在群晖上拉取新镜像并重启

```bash
# 开发机
git pull
./apps/docker/synology/build-images.sh all

# 群晖
docker-compose pull
docker-compose up -d
```
