# Copyright (C) 2020, Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

# Some opengl[es] libraries are multithreaded.
PATCHPATH:append = "${CURDIR}/${MACHINE}/files"
#PATCHPATH:append = "${THISDIR}/files:"
K_P:="${TOPDIR}/../meta-geniatech/recipes-bsp/kernel/${MACHINE}/files/"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
DEPENDS += "bc-native dtc-native"

SRC_URI = " \
        git://${TOPDIR}/../meta-rockchip/external/kernel;protocol=file;usehead=1 \
        file://cgroups.cfg \
        file://${K_P}/0001-ds3568-kernel-dts-config-all.patch \
        file://${K_P}/0002-ds3568-wifi-driver.patch \
	file://${K_P}/0003-3568-add-lt9211-driver.patch \
	file://${K_P}/0004-rk3568-add-bluetooth-driver.patch \
	file://${K_P}/0005-ds3568-spk-out.patch \
	file://${K_P}/0006-rtc-iptables-config.patch \
	file://${K_P}/0007-suspend-hid.patch \
	file://${K_P}/0008-rk809-hdmi-sound.patch \
	file://logo.bmp \
        file://logo_kernel.bmp \
        file://mkimage \
	file://rk356x.its \
"

do_compile:prepend() {
	cp ${B}/../logo.bmp ${S}/
	cp ${B}/../logo_kernel.bmp ${S}/
	mv ${B}/../mkimage ${B}/
	mv ${B}/../rk356x.its ${B}/
}
do_compile:append(){
        cd ${B}
	cp arch/arm64/boot/dts/rockchip/rk3568-evb1-ddr4-v10-linux.dtb rk-kernel.dtb
        ./scripts/resource_tool rk-kernel.dtb logo.bmp logo_kernel.bmp
	./mkimage -f rk356x.its -E -p 0x800 boot.img	
	cp boot.img zboot.img
}
