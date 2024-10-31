# Copyright (C) 2020, Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

# Some opengl[es] libraries are multithreaded.
PATCHPATH:append = "${CURDIR}/${MACHINE}/files"
K_P:="${TOPDIR}/../meta-geniatech/recipes-bsp/kernel/${MACHINE}/files/"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
DEPENDS += "bc-native dtc-native"

SRC_URI = " \
        git://${TOPDIR}/../meta-rockchip/external/kernel;protocol=file;usehead=1 \
        file://cgroups.cfg \
	file://${K_P}/0001-kernel-dts-xpi-dsi-patch.patch \
	file://logo.bmp \
	file://logo_kernel.bmp \
	file://mkimage \
        file://rk356x.its \
        file://misc.img \
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
