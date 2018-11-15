# 一些从各地转移过来的脚本，一般都只适用于debian
从moeclub.org复制过来的，怕哪天他下架了

使用方法如下

apt-get update && apt-get install -y screen gawk sed grep && screen

wget --no-check-certificate -qO DebianNET.sh 'https://raw.githubusercontent.com/jsjcjsjc/windd/master/DebianNET.sh' && bash DebianNET.sh -dd 'http://xxxxx/xx.vhd.gz'

====================================
从moeclub.org复制过来的，怕哪天他下架了
使用方法如下
apt-get install -y xz-utils openssl gawk file wget --no-check-certificate -qO InstallNET.sh 'https://moeclub.org/attachment/LinuxShell/InstallNET.sh' && chmod a+x InstallNET.sh

#使用默认镜像全自动安装
bash InstallNET.sh -d 8 -v 64 -a

#使用自定义镜像全自动安装
bash InstallNET.sh -c 6.9 -v 64 -a --mirror 'http://mirror.centos.org/centos'

#使用自定义镜像自定义网络参数全自动安装
#bash InstallNET.sh -u 16.04 -v 64 -a --ip-addr x.x.x.x --ip-gate x.x.x.x --ip-mask x.x.x.x --mirror 'http://archive.ubuntu.com/ubuntu'

#使用自定义网络参数全自动dd方式安装
#bash InstallNET.sh --ip-addr x.x.x.x --ip-gate x.x.x.x --ip-mask x.x.x.x -dd 'https://moeclub.org/get-win7embx86-auto'

#使用自定义网络参数全自动dd方式安装存储在谷歌网盘中的镜像(调用文件ID的方式)
#bash InstallNET.sh --ip-addr x.x.x.x --ip-gate x.x.x.x --ip-mask x.x.x.x -dd "$(echo "1cqVl2wSGx92UTdhOxU9pW3wJgmvZMT_J" |xargs -n1 bash <(wget --no-check-certificate -qO- 'https://moeclub.org/get-gdlink'))"

#使用自定义网络参数全自动dd方式安装存储在谷歌网盘中的镜像
#bash InstallNET.sh --ip-addr x.x.x.x --ip-gate x.x.x.x --ip-mask x.x.x.x -dd "$(echo "https://drive.google.com/open?id=1cqVl2wSGx92UTdhOxU9pW3wJgmvZMT_J" |xargs -n1 bash <(wget --no-check-certificate -qO- 'https://moeclub.org/get-gdlink'))"

Usage:
bash InstallNET.sh -d/--debian [dist-name]
-u/--ubuntu [dist-name]
-c/--centos [dist-version]
-v/--ver [32/i386|64/amd64]
--ip-addr/--ip-gate/--ip-mask
-apt/-yum/--mirror
-dd/--image
-a/-m

# dist-name: 发行版本代号
# dist-version: 发行版本号
# -apt/-yum/--mirror : 使用定义镜像
# -a/-m : 询问是否能进入VNC自行操作. -a 为不提示(一般用于全自动安装), -m 为提示.
# 以下示例中,将X.X.X.X替换为自己的网络参数.
# --ip-addr :IP Address/IP地址
# --ip-gate :Gateway /网关
# --ip-mask :Netmask /子网掩码
====================================
从https://blog.ilemonrain.com/linux/aliddns.html复制过来的

测试了多个ddns代码，这个兼容性最强，可以直接用于QNAP原生系统

首先，安装依赖：

Ubuntu/Debian：

apt-get update && apt-get install curl dnsutils -y

CentOS：

yum makecache fast

yum install curl bind-utils -y
