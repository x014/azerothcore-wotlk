#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"

IMAGE_TAG="${IMAGE_TAG:-latest}"
DOCKER_REGISTRY="${DOCKER_REGISTRY:-}"
IMAGE_PREFIX="${IMAGE_PREFIX:-}"

ALL_SERVICES=("authserver" "worldserver" "db-import" "client-data")

function usage() {
    cat <<EOF
AzerothCore Docker 镜像构建脚本 (群晖 DSM 6.2)

用法: $(basename "$0") [命令] [服务]

命令:
  build [服务]    构建镜像 (不指定服务则构建全部)
  push [服务]     推送镜像到仓库 (不指定服务则推送全部)
  all [服务]      构建并推送镜像
  clean [服务]    清理本地镜像

服务:
  authserver    认证服务器
  worldserver   世界服务器
  db-import     数据库导入工具
  client-data   客户端数据

环境变量:
  IMAGE_TAG         镜像标签 (默认: latest)
  DOCKER_REGISTRY   Docker 仓库地址 (如: docker.io/username)
  IMAGE_PREFIX      镜像名称前缀 (如: acore/)

示例:
  # 构建所有镜像
  ./build-images.sh build

  # 只构建 db-import
  ./build-images.sh build db-import

  # 推送单个服务到仓库
  DOCKER_REGISTRY=docker.io/yourname ./build-images.sh push db-import

  # 构建并推送单个服务
  DOCKER_REGISTRY=registry.example.com ./build-images.sh all db-import
EOF
}

function get_services() {
    local service="${1:-}"
    if [[ -n "$service" ]]; then
        if [[ ! " ${ALL_SERVICES[*]} " =~ " ${service} " ]]; then
            echo "错误: 未知服务 '$service'" >&2
            echo "可用服务: ${ALL_SERVICES[*]}" >&2
            exit 1
        fi
        echo "$service"
    else
        echo "${ALL_SERVICES[@]}"
    fi
}

function build_images() {
    local services
    services=$(get_services "${1:-}")
    
    echo "=== 构建镜像 (标签: $IMAGE_TAG) ==="
    
    cd "$PROJECT_ROOT"
    
    for service in $services; do
        echo "--- 构建 $service ---"
        docker build \
            -f apps/docker/synology/Dockerfile \
            --target "$service" \
            -t "${DOCKER_REGISTRY}${IMAGE_PREFIX}ac-wotlk-${service}:${IMAGE_TAG}" \
            .
    done
    
    echo "=== 构建完成 ==="
    docker images | grep ac-wotlk
}

function push_images() {
    local services
    services=$(get_services "${1:-}")
    
    echo "=== 推送镜像到仓库 ==="
    
    if [[ -z "$DOCKER_REGISTRY" ]]; then
        echo "错误: 请设置 DOCKER_REGISTRY 环境变量"
        echo "示例: DOCKER_REGISTRY=docker.io/yourname"
        exit 1
    fi
    
    for service in $services; do
        local image="${DOCKER_REGISTRY}${IMAGE_PREFIX}ac-wotlk-${service}:${IMAGE_TAG}"
        echo "--- 推送 $image ---"
        docker push "$image"
    done
    
    echo "=== 推送完成 ==="
}

function clean_images() {
    local services
    services=$(get_services "${1:-}")
    
    echo "=== 清理本地镜像 ==="
    
    for service in $services; do
        local image="${DOCKER_REGISTRY}${IMAGE_PREFIX}ac-wotlk-${service}:${IMAGE_TAG}"
        docker rmi -f "$image" 2>/dev/null || true
    done
    
    echo "=== 清理完成 ==="
}

case "${1:-}" in
    build)
        build_images "${2:-}"
        ;;
    push)
        push_images "${2:-}"
        ;;
    all)
        build_images "${2:-}"
        push_images "${2:-}"
        ;;
    clean)
        clean_images "${2:-}"
        ;;
    -h|--help|help)
        usage
        ;;
    *)
        usage
        exit 1
        ;;
esac
