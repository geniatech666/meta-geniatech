# Copyright (C) 2020, Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

# Some opengl[es] libraries are multithreaded.
PATCHPATH:append = "${CURDIR}/${MACHINE}"
U_P:="${TOPDIR}/../meta-geniatech/recipes-bsp/u-boot/${MACHINE}/files/"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
RK_MISC_IMG="wipe_all-misc.img"

SRC_URI = " \
        git://${TOPDIR}/../meta-rockchip/external/u-boot;protocol=file;usehead=1; \
        git://${TOPDIR}/../meta-rockchip/external/rkbin;branch=geniatech;protocol=file;usehead=1;name=rkbin;destsuffix=rkbin; \
	file://${U_P}/0001-u-boot-config.patch \
	file://${U_P}/0002-uboot-sd-boot.patch \
	file://${U_P}/0003-uboot-usb-boot.patch \
"
