#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#

rm -rf package/lean/luci-app-ttyd

# 修改openwrt登陆地址,把下面的192.168.10.1修改成你想要的就可以了，其它不要动
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把OpenWrt修改你喜欢的就行（不能纯数字或者使用中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='OpenWrt'' package/lean/default-settings/files/zzz-default-settings

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

# 开启 WiFi
#sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改默认 WIFI SSID
#sed -i 's/ssid=OpenWrt/ssid=Panzy/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改内核版本（下面两行代码前面没#为4.19内核,有#为5.4内核,只选择带#或者不带#就可以了，不用改动其他）
#sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=4.19/g' ./target/linux/x86/Makefile
#sed -i 's/KERNEL_TESTING_PATCHVER:=5.4/KERNEL_TESTING_PATCHVER:=4.19/g' ./target/linux/x86/Makefile

# 修改插件名字（修改名字后不知道会不会对插件功能有影响，自己多测试）
sed -i 's/"带宽监控"/"监视"/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
sed -i 's/"TTYD 终端"/"TTYD"/g' package/liuran001/luci-app-ttyd/po/zh-cn/terminal.po
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
