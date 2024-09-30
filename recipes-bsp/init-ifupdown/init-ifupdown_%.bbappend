# Copyright (C) 2019, Fuzhou Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://interfaces"


do_install:append() {
        install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfaces
}
