DESCRIPTION = "suppot ap6275s wifi bt module"
SECTION = "ap6275s"
LICENSE = "CLOSED"
PV = "3"
PR = "r0"

TARGET_CC_ARCH += "${LDFLAGS}"
INSANE_SKIP_${PN} = "ldflags"
INSANE_SKIP_${PN}-dev = "ldflags"

SRC_URI = " \
          file://rk_wifi_init.c \
	  file://brcm_patchram_plus1.c \
	  file://usb8897_bt.bin \
	  file://usb8897_combo.bin \
	  file://usb8897_uapsta.bin \
	  file://makefile \
	  file://usb8897_wlan.bin \
	  file://WlanCalData_ext.conf \
          file://usb8897-startup \
          "

S = "${WORKDIR}"

do_compile () {
    make
}

do_install () {
    install -d ${D}${bindir}/
    install -m 0755 ${S}/rk_wifi_init ${D}${bindir}/
    #install -m 0755 ${S}/brcm_patchram_plus1 ${D}${bindir}/
    
    mkdir -p ${D}${sysconfdir}/firmware/mrvl/
    install -d ${D}${sysconfdir}/firmware/mrvl/
    install -m 0755 ${WORKDIR}/usb8897_bt.bin ${D}${sysconfdir}/firmware/mrvl
    install -m 0755 ${WORKDIR}/usb8897_combo.bin ${D}${sysconfdir}/firmware/mrvl
    install -m 0755 ${WORKDIR}/usb8897_uapsta.bin ${D}${sysconfdir}/firmware/mrvl
    install -m 0755 ${WORKDIR}/usb8897_wlan.bin ${D}${sysconfdir}/firmware/mrvl
    install -m 0755 ${WORKDIR}/WlanCalData_ext.conf  ${D}${sysconfdir}/firmware/mrvl

    install -d ${D}${sysconfdir}/init.d
    install -d ${D}${sysconfdir}/rc2.d
    install -d ${D}${sysconfdir}/rc3.d
    install -d ${D}${sysconfdir}/rc4.d
    install -d ${D}${sysconfdir}/rc5.d
    install -m 0755 ${WORKDIR}/usb8897-startup ${D}/${sysconfdir}/init.d

    ln -sf ../init.d/usb8897-startup  ${D}${sysconfdir}/rc2.d/S88usb8897-startup
    ln -sf ../init.d/usb8897-startup  ${D}${sysconfdir}/rc3.d/S88usb8897-startup
    ln -sf ../init.d/usb8897-startup  ${D}${sysconfdir}/rc4.d/S88usb8897-startup
    ln -sf ../init.d/usb8897-startup  ${D}${sysconfdir}/rc5.d/S88usb8897-startup
}

#FILES_${PN} = "${bindir}/rk_wifi_init"
