#!/bin/bash

# 安装必要组件
apt-get update
apt-get install -y curl sed util-linux coreutils

# 创建 1GB 的 swap 文件
dd if=/dev/zero of=/swapfile bs=1M count=1024
mkswap /swapfile
swapon /swapfile

# 清屏
script -q -c "clear" /tmp/result_rhg
sed -i -e '/Script started on/d' -e '/Script done on/d' /tmp/result_rhg

# 脚本1
echo -e "\033[1;31m[流媒体平台及游戏区域限制测试]\033[0m" >> /tmp/result_rhg
script -a -q -c "bash <(curl -L -s check.unlock.media) <<< '4'" /tmp/result_rhg
sed -i -e '/Script started on/,/广告推广投放/d' -e '/本次测试已结束，感谢使用此脚本/,/Script done on/d' /tmp/result_rhg
sed -i '/[^31m]\[流媒体平台及游戏区域限制测试/d' /tmp/result_rhg

# 脚本2
echo -e "\n\n\033[1;31m[三网回程线路测试]\033[0m\n" >> /tmp/result_rhg
script -a -q -c "curl https://raw.githubusercontent.com/zhanghanyun/backtrace/main/install.sh -sSf | sh" /tmp/result_rhg
sed -i -e '/Script started on/d' -e '/Script done on/d' /tmp/result_rhg

# 脚本3
echo -e "\n\033[1;31m[YABS测试]\033[0m\n" >> /tmp/result_rhg
script -a -q -c "curl -sL yabs.sh | bash -s -- -i" /tmp/result_rhg
sed -i -e '/Script started on/d' -e '/Script done on/d' /tmp/result_rhg

# 脚本4
echo -e "\n\033[1;31m[三网单线程速度测试]\033[0m\n" >> /tmp/result_rhg
script -a -q -c "bash <(curl -s https://raw.githubusercontent.com/i-abc/Speedtest/main/speedtest.sh | sed '/clear/d') <<< '2'" /tmp/result_rhg
sed -i -e '/Script started on/,/--:--:--/d' -e '/Script done on/d' /tmp/result_rhg

# 提示语
sed -i '$d' /tmp/result_rhg
echo -e "\n\033[1;31m结果查看命令：\ncat /tmp/result_rhg\033[0m\n" >> /tmp/result_rhg

clear
cat /tmp/result_rhg
