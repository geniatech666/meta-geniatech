# Copyright (C) 2020, Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

# Some opengl[es] libraries are multithreaded.
PATCHPATH:append = "${CURDIR}/${MACHINE}/"
K_P:="${TOPDIR}/../meta-geniatech/recipes-bsp/kernel/${MACHINE}"
FILESEXTRAPATHS:prepend := "${THISDIR}/${MACHINE}:"
DEPENDS += "bc-native dtc-native"

SRC_URI = " \
        git://${TOPDIR}/../meta-rockchip/external/kernel;protocol=file;usehead=1 \
        file://cgroups.cfg \
	"

SRC_URI:append = " ${@bb.utils.contains('MACHINE', 'gtk-rk3568j-xpi','file://${K_P}/0001-kernel-dts-patch.patch','', d)} \
                   ${@bb.utils.contains('MACHINE', 'gtk-rk3568j-xpi','file://${K_P}/0006-xpi3568j-add-wifi-bt-rtl8723bu-driver.patch','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568j-xpi','file://${K_P}/0001-xpi3568-modify-40-head-spi2-3-i2c2-5.patch','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568j-xpi','file://${K_P}/0004-xpi3568-close-40pin-i2c2-for-dsi-panel.patch','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568j-xpi','file://logo_kernel.bmp','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568j-xpi','file://logo.bmp','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568j-xpi','file://mkimage','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568j-xpi','file://rk356x.its','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568-ds','file://${K_P}/0001-ds3568-kernel-dts-config-all-br.patch','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568-ds','file://${K_P}/0002-ds3568-wifi-driver.patch','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568-ds','file://${K_P}/0003-3568-add-lt9211-driver-br.patch','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568-ds','file://${K_P}/0004-rk3568-add-bluetooth-driver.patch','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568-ds','file://${K_P}/0005-ds3568-spk-out.patch','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568-ds','file://${K_P}/0006-rtc-iptables-config.patch','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568-ds','file://${K_P}/0007-suspend-hid.patch','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568-ds','file://${K_P}/0008-rk809-hdmi-sound.patch','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568-ds','file://logo.bmp','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568-ds','file://logo_kernel.bmp','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568-ds','file://mkimage','', d)} \
		   ${@bb.utils.contains('MACHINE', 'gtk-rk3568-ds','file://rk356x.its','', d)} \
		"
SRCREV = "${AUTOREV}"
S = "${WORKDIR}/git"
B = "${WORKDIR}/build"

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
