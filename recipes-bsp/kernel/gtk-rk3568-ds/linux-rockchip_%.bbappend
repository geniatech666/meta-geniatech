# Copyright (C) 2020, Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

# Some opengl[es] libraries are multithreaded.
PATCHPATH:append = "${CURDIR}/${MACHINE}/files"
#PATCHPATH:append = "${THISDIR}/files:"
K_P:="${TOPDIR}/../meta-geniatech/recipes-bsp/kernel/${MACHINE}/files/"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI = " \
        git://${TOPDIR}/../meta-rockchip/external/kernel;protocol=file;usehead=1 \
        file://cgroups.cfg \
        file://${K_P}/0001-ds3568-kernel-dts-config.patch \
        file://${K_P}/0002-ds3568-wifi-driver.patch \
	file://${K_P}/0003-3568-add-lt9211-driver.patch \
	file://${K_P}/0004-rk3568-add-bluetooth-driver.patch \
	file://logo.bmp \
        file://logo_kernel.bmp \
"
do_compile:prepend() {
	cp ${B}/../logo.bmp ${S}/
	cp ${B}/../logo_kernel.bmp ${S}/
}
