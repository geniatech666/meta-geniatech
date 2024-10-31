# Copyright (C) 2019, Fuzhou Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://crontab"


do_install:append() {
	install -m 644 ${WORKDIR}/crontab ${D}${sysconfdir}
}
