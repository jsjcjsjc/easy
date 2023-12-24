#!/bin/bash

安装必要组件
apt-get update
apt-get install -y curl sed util-linux coreutils

# 创建 1GB 的 swap 文件
dd if=/dev/zero of=/swapfile bs=1M count=1024
mkswap /swapfile
swapon /swapfile

# 执行第一个命令，并将结果保存到 /tmp/result_rhg
bash <(curl -L -s check.unlock.media) <<< '4' | tee /tmp/result_rhg

# 添加彩色文本到文件
echo -e "\n\033[1;31m[三网回程线路测试]\033[0m\n" >> /tmp/result_rhg

# 执行第二个命令，假设它支持彩色输出，并追加到文件
curl -L raw.githubusercontent.com/zhanghanyun/backtrace/main/install.sh -sSf | sh | tee -a /tmp/result_rhg

# 添加彩色文本到文件
echo -e "\n\033[1;31m[YABS测试]\033[0m\n" >> /tmp/result_rhg

# 执行第三个命令，并追加到文件
curl -sL yabs.sh | bash -s -- -i | tee -a /tmp/result_rhg

# 添加彩色文本到文件
echo -e "\n\033[1;31m[三网单线程速度测试]\033[0m\n\nRemoval Flag" >> /tmp/result_rhg

# 执行第四个命令，并追加到文件
bash <(curl -s -L raw.githubusercontent.com/i-abc/Speedtest/main/speedtest.sh | sed '/clear/d') <<< '2' | tee -a /tmp/result_rhg

# 删除文件中的特定部分
sed -i '/AD No.1/,/即日起老用户下单买一个月送一个月/d' /tmp/result_rhg
sed -i '/Removal Flag/,/请输入您想选择的节点序号/d' /tmp/result_rhg

# 在文件中插入彩色文本
sed -i '/Version               :/i\------------------------ 多功能 自更新 测速脚本 ------------------------' /tmp/result_rhg

# 清除屏幕并显示文件内容
clear
cat /tmp/result_rhg
