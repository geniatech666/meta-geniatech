# Copyright (C) 2020, Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

# Some opengl[es] libraries are multithreaded.
PATCHPATH:append = "${CURDIR}/${MACHINE}/files"
K_P:="${TOPDIR}/../meta-geniatech/recipes-bsp/kernel/${MACHINE}/files/"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI = " \
        git://${TOPDIR}/../meta-rockchip/external/kernel;protocol=file;usehead=1 \
        file://cgroups.cfg \
	file://${K_P}/0001-kernel-dts-patch.patch \
        file://logo.bmp \
	file://logo_kernel.bmp \
"

do_compile:prepend() {
        cp ${B}/../logo.bmp ${S}/
        cp ${B}/../logo_kernel.bmp ${S}/
}
