DESCRIPTION = "suppot rtl8323bu wifi bt module"
SECTION = "rtl8723bu"
LICENSE = "CLOSED"
PV = "3"
PR = "r0"

TARGET_CC_ARCH += "${LDFLAGS}"
INSANE_SKIP_${PN} = "ldflags"
INSANE_SKIP_${PN}-dev = "ldflags"

SRC_URI = " \
          file://rk_wifi_init.c \
	  file://brcm_patchram_plus1.c \
	  file://rtl8723b_config \
	  file://rtl8723b_fw \
	  file://makefile \
          file://rtl8723bu-startup \
          "

S = "${WORKDIR}"

do_compile () {
    make
}

do_install () {
    install -d ${D}${bindir}/
    install -m 0755 ${S}/rk_wifi_init ${D}${bindir}/
    #install -m 0755 ${S}/brcm_patchram_plus1 ${D}${bindir}/
    
    mkdir -p ${D}${sysconfdir}/firmware/rtl_bt/
    install -d ${D}${sysconfdir}/firmware/rtl_bt/
    install -m 0755 ${WORKDIR}/rtl8723b_config ${D}${sysconfdir}/firmware/rtl_bt
    install -m 0755 ${WORKDIR}/rtl8723b_fw ${D}${sysconfdir}/firmware/rtl_bt

    install -d ${D}${sysconfdir}/init.d
    install -d ${D}${sysconfdir}/rc2.d
    install -d ${D}${sysconfdir}/rc3.d
    install -d ${D}${sysconfdir}/rc4.d
    install -d ${D}${sysconfdir}/rc5.d
    install -m 0755 ${WORKDIR}/rtl8723bu-startup ${D}/${sysconfdir}/init.d

    ln -sf ../init.d/rtl8723bu-startup  ${D}${sysconfdir}/rc2.d/S88rtl8723bu-startup
    ln -sf ../init.d/rtl8723bu-startup  ${D}${sysconfdir}/rc3.d/S88rtl8723bu-startup
    ln -sf ../init.d/rtl8723bu-startup  ${D}${sysconfdir}/rc4.d/S88rtl8723bu-startup
    ln -sf ../init.d/rtl8723bu-startup  ${D}${sysconfdir}/rc5.d/S88rtl8723bu-startup
}

#FILES_${PN} = "${bindir}/rk_wifi_init"
