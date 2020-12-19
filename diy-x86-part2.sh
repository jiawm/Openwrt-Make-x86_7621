#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#


#修复核心及添加温度显示
#sed -i 's|pcdata(boardinfo.system or "?")|luci.sys.exec("uname -m") or "?"|g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
#sed -i 's/or "1"%>/or "1"%> ( <%=luci.sys.exec("expr `cat \/sys\/class\/thermal\/thermal_zone0\/temp` \/ 1000") or "?"%> \&#8451; ) /g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

sed -i 's/invalid/# invalid/g' package/network/services/samba36/files/smb.conf.template
echo "DISTRIB_REVISION='S$(TZ=UTC-8 date +%Y.%m.%d) xylz0928 Products'" > ./package/base-files/files/etc/openwrt_release1

# Modify index 
#sed -i 's|https://github.com/sirpdboy/openwrt/actions|https://github.com/xylz0928/Openwrt-Make-x86_7621/actions|g' ./package/diy/autocore/files/x86/index.htm
#sed -i 's|https://github.com/sirpdboy/openwrt18.06/issues|https://github.com/xylz0928/Openwrt-Make-x86_7621/issues|g' ./package/diy/autocore/files/x86/index.htm
#sed -i 's|固件TG聊天群|作者网站首页|g' ./package/diy/autocore/files/x86/index.htm
#sed -i 's|https://t.me/joinchat/AAAAAEpRF88NfOK5vBXGBQ|https://7ze.top|g' ./package/diy/autocore/files/x86/index.htm

# Change default theme
sed -i 's/bootstrap/argon/g' feeds/luci/collections/luci/Makefile

# Add ServerChan
# git clone https://github.com/tty228/luci-app-serverchan.git feeds/luci/applications/luci-app-serverchan
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan

# Add Onliner
# git clone https://github.com/rufengsuixing/luci-app-onliner.git feeds/luci/applications/luci-app-onliner
git clone https://github.com/rufengsuixing/luci-app-onliner.git package/luci-app-onliner

# Add OpenAppFilter
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter


# Add ServerChan-DINGDING
git clone https://github.com/zzsj0928/luci-app-serverchand package/luci-app-serverchand

# Add Hello World
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  package/diy/luci-app-vssr
# svn co https://github.com/siropboy/luci-app-vssr-plus/trunk/luci-app-vssr-plus package/new/luci-app-vssr-plus

# Add Passwall
git clone https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall

# Add OpenClash
git clone -b master https://github.com/vernesong/OpenClash.git package/OpenClash


# Fix Multi-use on one physical port 
# 修复 5.4.68-5.4.69内核 于 MIPS 架构 单线复用BUG
# 取自 @AmadeusGhost， 原更新内容为 generic: limit commit "ramips/mediatek: improve GRO performance, fix PPE packet parsing" to mediatek target only
# wget https://github.com/AmadeusGhost/lede/commit/7a49d2cf99bd59506bbd9239e0bde81a61f93c40.patch
# git apply 7a49d2cf99bd59506bbd9239e0bde81a61f93c40.patch
