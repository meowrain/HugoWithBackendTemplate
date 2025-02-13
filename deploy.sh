#!/bin/bash
# 定义颜色代码
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # 无颜色

# 执行相关命令
# 构建静态文件
echo -e "${YELLOW} Start Building blog....${NC}\n"
hugo --gc

# 上传到github
echo -e "${YELLOW} Start push to github....${NC}\n"
git add .
git commit -m "posts added"
git push -u origin main
echo -e "${GREEN} push over! ${NC}\n"
