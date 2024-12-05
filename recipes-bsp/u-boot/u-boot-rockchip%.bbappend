# Copyright (C) 2020, Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

# Some opengl[es] libraries are multithreaded.
PATCHPATH:append = "${CURDIR}/${MACHINE}"
U_P:="${TOPDIR}/../meta-geniatech/recipes-bsp/u-boot/${MACHINE}"

SRCREV = "${AUTOREV}"
SRCREV_rkbin = "${AUTOREV}"

SRC_URI = " \
        git://${TOPDIR}/../meta-rockchip/external/u-boot;protocol=file;usehead=1; \
        git://${TOPDIR}/../meta-rockchip/external/rkbin;branch=geniatech;protocol=file;usehead=1;name=rkbin;destsuffix=rkbin; \
"
SRC_URI:append = " ${@bb.utils.contains('MACHINE', 'gtk-rk3568j-xpi','file://${U_P}/0001-u-boot-config.patch','', d)} \
                   ${@bb.utils.contains('MACHINE', 'gtk-rk3568j-xpi','file://${U_P}/0002-uboot-sd-boot.patch','', d)} \
                   ${@bb.utils.contains('MACHINE', 'gtk-rk3568j-xpi','file://${U_P}/0003-uboot-usb-boot.patch','', d)} \
                   ${@bb.utils.contains('MACHINE', 'gtk-rk3568-ds','file://${U_P}/0001-u-boot-config.patch','', d)} \
                   ${@bb.utils.contains('MACHINE', 'gtk-rk3568-ds','file://${U_P}/0002-uboot-sd-boot.patch','', d)} \
                   ${@bb.utils.contains('MACHINE', 'gtk-rk3568-ds','file://${U_P}/0003-uboot-usb-boot.patch','', d)} \
                "

