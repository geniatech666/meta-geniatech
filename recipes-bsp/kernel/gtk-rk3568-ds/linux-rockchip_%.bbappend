# Copyright (C) 2020, Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

# Some opengl[es] libraries are multithreaded.
PATCHPATH:append = "${CURDIR}/${MACHINE}/files"
K_P:="${TOPDIR}/../meta-geniatech/recipes-bsp/kernel/${MACHINE}/files/"

SRC_URI = " \
        git://${TOPDIR}/../meta-rockchip/external/kernel;protocol=file;usehead=1 \
        file://cgroups.cfg \
        file://${K_P}/0001-ds3568-kernel-dts-config.patch \
	file://${K_P}/0002-ds3568-wifi-driver.patch \	
	file://${K_P}/logo.bmp \
	file://${K_P}/logo_kernel.bmp \
"
