#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#

# 添加组件
git clone https://github.com/chaoxiaozhu/chao package/chao

# 删除组件
rm -rf feeds/luci/applications/luci-app-ttyd
rm -rf feeds/luci/applications/luci-app-nlbwmon
rm -rf feeds/lienol/luci-app-fileassistant
rm -rf feeds/luci/applications/luci-app-advanced-reboot
rm -rf feeds/luci/collections/luci/Makefile

# 复制组件
mv package/chao/luci-app-ttyd feeds/luci/applications
mv package/chao/luci-app-nlbwmon feeds/luci/applications
mv package/chao/luci-app-advanced-reboot feeds/luci/applications
mv package/chao/luci-app-fileassistant feeds/lienol
mv package/chao/Makefile feeds/luci/collections/luci

# 空密码
# sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/default-settings/files/zzz-default-settings

# 修改openwrt登陆地址,把下面的192.168.10.1修改成你想要的就可以了，其它不要动
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 开启 WiFi
#sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改默认 WIFI SSID
#sed -i 's/ssid=OpenWrt/ssid=Panzy/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改内核版本（下面两行代码前面没#为4.19内核,有#为5.4内核,只选择带#或者不带#就可以了，不用改动其他）
#sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=4.19/g' ./target/linux/x86/Makefile
#sed -i 's/KERNEL_TESTING_PATCHVER:=5.4/KERNEL_TESTING_PATCHVER:=4.19/g' ./target/linux/x86/Makefile

# 修改插件名字（修改名字后不知道会不会对插件功能有影响，自己多测试）
#sed -i 's/"TTYD 终端"/"TTYD"/g' feeds/luci/transplant/luci-app-ttyd/po/zh-cn/terminal.po
#sed -i 's/"带宽监控"/"监控"/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' feeds/other/lean/luci-app-turboacc/po/zh-cn/turboacc.po

#sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-amule/po/zh-cn/amule.po
#sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
#sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-usb-printer/po/zh-cn/usb-printer.po
#sed -i 's/"实时流量监测"/"流量"/g' package/lean/luci-app-wrtbwmon/po/zh-cn/wrtbwmon.po
#sed -i 's/cbi("qbittorrent"),_("qBittorrent")/cbi("qbittorrent"),_("BT下载")/g' package/lean/luci-app-qbittorrent/luasrc/controller/qbittorrent.lua
#sed -i 's/"aMule设置"/"电驴下载"/g' package/lean/luci-app-amule/po/zh-cn/amule.po
#sed -i 's/"KMS 服务器"/"KMS激活"/g' package/lean/luci-app-vlmcsd/po/zh-cn/vlmcsd.zh-cn.po
#sed -i 's/"USB 打印服务器"/"打印服务"/g' package/lean/luci-app-usb-printer/po/zh-cn/usb-printer.po
#sed -i 's/"Web 管理"/"Web"/g' package/lean/luci-app-webadmin/po/zh-cn/webadmin.po
#sed -i 's/"管理权"/"改密码"/g' feeds/luci/modules/luci-base/po/zh-cn/base.po
