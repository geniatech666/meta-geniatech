# Copyright (C) 2019, Fuzhou Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://60-drm.rules \
		   file://drm-hotplug.sh \
		"

do_install:append() {
	install -m 0755 ${WORKDIR}/drm-hotplug.sh ${D}/${sysconfdir}/
	install -m 0644 ${WORKDIR}/60-drm.rules     ${D}${sysconfdir}/udev/rules.d/60-drm.rules
}
