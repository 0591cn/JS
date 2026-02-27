#!/bin/bash

# ==========================================
# Debian/Ubuntu 中文环境一键配置脚本 
# 兼容：Debian 10/11/12, Ubuntu 20.04/22.04/24.04
# 
# ==========================================

# 定义颜色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=== 开始配置中文环境 (兼容 Debian & Ubuntu) ===${NC}"

# 1. 检查 Root 权限
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}错误：请使用 root 权限运行此脚本 (sudo bash setup_chinese_pro.sh)${NC}"
  exit 1
fi

# 2. 检测系统类型
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo -e "${YELLOW}无法检测系统版本，默认按 Debian 处理...${NC}"
    OS="debian"
fi

echo -e "${GREEN}检测到系统: $OS${NC}"

# 3. 更新软件源并安装基础包
echo -e "${GREEN}[1/6] 更新软件源...${NC}"
apt update -y

echo -e "${GREEN}[2/6] 安装中文字体和 Man 手册...${NC}"
# 安装常用中文字体、中文手册、Locales管理工具
apt install -y fonts-noto-cjk fonts-wqy-microhei fonts-wqy-zenhei manpages-zh locales

# 4. 核心步骤：修复 Lite 系统/Ubuntu 的翻译缺失
echo -e "${GREEN}[3/6] 修复精简版系统翻译文件缺失...${NC}"
if [ "$OS" == "ubuntu" ]; then
    # Ubuntu 专用语言包
    apt install -y language-pack-zh-hans
    apt install --reinstall -y locales
else
    # Debian/其他：强制重装核心包以找回 .mo 翻译文件
    echo "正在强制重装 coreutils, bash, grep, sed 以恢复被裁剪的翻译..."
    apt install --reinstall -y locales bash coreutils grep sed
fi

# 5. 配置 Locale 生成
echo -e "${GREEN}[4/6] 生成中文 Locale...${NC}"
# 确保 /etc/locale.gen 存在
[ -f /etc/locale.gen ] || touch /etc/locale.gen

# 开启 zh_CN.UTF-8
sed -i 's/^# *zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g' /etc/locale.gen
# 确保 en_US.UTF-8 也开启 (作为备用)
sed -i 's/^# *en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen

# 生成
locale-gen zh_CN.UTF-8
locale-gen en_US.UTF-8

# 6. 设置系统环境变量 (强制覆盖)
echo -e "${GREEN}[5/6] 设置环境变量...${NC}"

# 方法A: 标准 update-locale
update-locale LANG=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8 LANGUAGE=zh_CN:zh

# 方法B: 暴力写入 .bashrc (针对某些云主机不读取 /etc/default/locale 的情况)
if ! grep -q "export LANG=zh_CN.UTF-8" ~/.bashrc; then
    echo "export LANG=zh_CN.UTF-8" >> ~/.bashrc
    echo "export LANGUAGE=zh_CN:zh" >> ~/.bashrc
    echo "export LC_ALL=zh_CN.UTF-8" >> ~/.bashrc
fi

# 方法C: 修正 SSH 客户端设置覆盖问题
# 很多时候本地是英文，SSH连接时会把服务器强制变成英文
if [ -f /etc/ssh/sshd_config ]; then
    echo "正在修改 SSH 配置，禁止客户端覆盖语言设置..."
    sed -i 's/^AcceptEnv LANG LC_*/#AcceptEnv LANG LC_*/g' /etc/ssh/sshd_config
    # 重启 SSH 服务
    service ssh restart 2>/dev/null || systemctl restart sshd 2>/dev/null
fi

# 7. 配置别名 (可选)
if ! grep -q "alias cman=" ~/.bashrc; then
    echo "alias cman='man -L zh_CN'" >> ~/.bashrc
fi

echo -e "${GREEN}=== 配置完成！ ===${NC}"
echo -e "为了确保 100% 生效，请执行以下操作："
echo -e "1. 输入命令: ${YELLOW}source ~/.bashrc${NC} (立即生效)"
echo -e "2. 如果依然显示英文，请断开 SSH 并重新连接。"
echo -e "3. 验证命令: ${YELLOW}date${NC} (应显示中文日期)"



