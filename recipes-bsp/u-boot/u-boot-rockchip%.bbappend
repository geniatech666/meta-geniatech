# Copyright (C) 2020, Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

# Some opengl[es] libraries are multithreaded.
PATCHPATH:append = "${CURDIR}/${PROJECT}"
U_P:="${TOPDIR}/../meta-geniatech/recipes-bsp/u-boot/${MACHINE}/"

SRC_URI = " \
        git://${TOPDIR}/../meta-rockchip/external/u-boot;protocol=file;usehead=1; \
        git://${TOPDIR}/../meta-rockchip/external/rkbin;branch=geniatech;protocol=file;usehead=1;name=rkbin;destsuffix=rkbin; \
	file://${U_P}/0001-u-boot-config.patch \
"

