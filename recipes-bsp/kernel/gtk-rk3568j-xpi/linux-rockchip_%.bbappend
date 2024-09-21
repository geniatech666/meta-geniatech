# Copyright (C) 2020, Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

# Some opengl[es] libraries are multithreaded.
PATCHPATH:append = "${CURDIR}/${MACHINE}/files"
K_P:="${TOPDIR}/../meta-geniatech/recipes-bsp/kernel/${MACHINE}/files/"

SRC_URI = " \
        git://${TOPDIR}/../meta-rockchip/external/kernel;protocol=file;usehead=1 \
        file://cgroups.cfg \
	file://${K_P}/0001-kernel-dts-patch.patch \
        file://${K_P}/logo.bmp \
	file://${K_P}/logo_kernel.bmp \
"
