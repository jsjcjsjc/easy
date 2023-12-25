#!/bin/bash

# 安装必要组件
apt-get update
apt-get install -y curl sed util-linux coreutils

# 创建 1GB 的 swap 文件
dd if=/dev/zero of=/swapfile bs=1M count=1024
mkswap /swapfile
swapon /swapfile

bash <(curl -L -s check.unlock.media) <<< '4' | tee /tmp/result_rhg
echo -e "\n\033[1;31m[三网回程线路测试]\033[0m\n" >> /tmp/result_rhg
curl -L raw.githubusercontent.com/zhanghanyun/backtrace/main/install.sh -sSf | sh | tee -a /tmp/result_rhg
echo -e "\n\033[1;31m[YABS测试]\033[0m\n" >> /tmp/result_rhg
curl -sL yabs.sh | bash -s -- -i | tee -a /tmp/result_rhg
echo -e "\n\033[1;31m[三网单线程速度测试]\033[0m\n\nRemoval Flag" >> /tmp/result_rhg
bash <(curl -s -L raw.githubusercontent.com/i-abc/Speedtest/main/speedtest.sh | sed '/clear/d') <<< '2' | tee -a /tmp/result_rhg
sed -i '/AD No.1/,/即日起老用户下单买一个月送一个月/d' /tmp/result_rhg
sed -i '/Removal Flag/,/请输入您想选择的节点序号/d' /tmp/result_rhg
sed -i '/Version               :/i\------------------------ 多功能 自更新 测速脚本 ------------------------' /tmp/result_rhg
clear
cat /tmp/result_rhg
