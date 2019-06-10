

# 一些从各地收集过来不错的一键脚本


## src.sh
由于有些VPS自带的源乱七八糟的，所以有了这个脚本。一键智能替换系统的源，支持debian 7/8/9，使用方法如下
```
wget -qO- https://raw.githubusercontent.com/jsjcjsjc/easy/master/src.sh | bash
```
## allsrc.sh
和src.sh差不多，支持CentOS/Ubuntu/Debian，使用方法如下
```
wget https://raw.githubusercontent.com/jsjcjsjc/easy/master/allsrc.sh
bash allsrc.sh
bash allsrc.sh 163
bash allsrc.sh restore
```
> 转自：https://www.oldking.net/697.html

## iptables.sh
手动配置端口转发太麻烦了，所以有了这个脚本，比较方便的设置debian系统的端口转发，支持TC/UDP，也支持端口段，使用方法如下
```
wget -qO- https://raw.githubusercontent.com/jsjcjsjc/easy/master/iptables.sh | bash
```
> 转自：https://doub.io/ss-jc34/

## aliddns.sh
通过aliyun的API实现DDNS功能，使用方法如下
```
apt-get update && apt-get install curl dnsutils -y #非必需
cd
mkdir ddns && cd ddns
wget https://raw.githubusercontent.com/jsjcjsjc/easy/master/aliddns.sh

vi aliddns.sh #修改如下信息
AliDDNS_DomainName="domain.com"
AliDDNS_SubDomainName="test"
AliDDNS_TTL="600"
AliDDNS_AK="xxxxxx"
AliDDNS_SK="yyyyyyyyyyyyyyy"

chmod +x aliddns.sh
./aliddns.sh #建议加入crontab

crontab -e
*/5 * * * * /bin/bash /root/ddns/aliddns.sh
```
> 转自：https://blog.ilemonrain.com/linux/aliddns.html

## InstallNET.sh
方便的给KVM VPS安装windows，使用方法如下
```
apt-get update && apt-get install -y xz-utils openssl gawk file
wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/jsjcjsjc/easy/master/InstallNET.sh' && chmod a+x InstallNET.sh
bash InstallNET.sh -dd 'https://image.moeclub.org/GoogleDrive/1tx6aZM8c289MaQyer37aq3ujVBsAESNm' 
```


## InstallNET.sh
也可以方便的安装全新的CentOS/Ubuntu/Debian，我一般只用debian，使用方法如下，其他参数详见作者页面
```
apt-get update && apt-get install -y xz-utils openssl gawk file
wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/jsjcjsjc/easy/master/InstallNET.sh'
chmod a+x InstallNET.sh && bash InstallNET.sh -d 9 -v 64 -a
```
> 转自：https://moeclub.org/2018/04/03/603/

## l2tp.sh
一键安装VPN，使用方法如下
```
wget --no-check-certificate https://raw.githubusercontent.com/jsjcjsjc/easy/master/l2tp.sh
chmod +x l2tp.sh
./l2tp.sh
```
> 转自：https://github.com/teddysun
