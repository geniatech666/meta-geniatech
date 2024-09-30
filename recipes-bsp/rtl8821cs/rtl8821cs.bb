DESCRIPTION = "suppot rtl8821cs wifi bt module"
SECTION = "rtl8821cs"
LICENSE = "CLOSED"
PV = "3"
PR = "r0"

TARGET_CC_ARCH += "${LDFLAGS}"
INSANE_SKIP_${PN} = "ldflags"
INSANE_SKIP_${PN}-dev = "ldflags"

SRC_URI = " \
          file://rk_wifi_init.c \
	  file://makefile \
          file://rtl8821cs-startup \
	  file://rtl8821c_config \
	  file://rtl8821c_fw \
	  file://hciattach.c \  
	  file://hciattach.h \
	  file://hciattach_h4.c \
	  file://hciattach_h4.h \
	  file://hciattach_rtk.c \
	  file://rtb_fwc.c \
	  file://rtb_fwc.h \ 
          "

S = "${WORKDIR}"

do_compile () {
    make
}

do_install () {
    install -d ${D}${bindir}/
    install -m 0755 ${S}/rk_wifi_init ${D}${bindir}/
    install -m 0755 ${S}/rtk_hciattach ${D}${bindir}/


    mkdir -p ${D}${sysconfdir}/firmware/rtlbt/
    install -d ${D}${sysconfdir}/firmware/rtlbt/
    install -m 0755 ${WORKDIR}/rtl8821c_config ${D}${sysconfdir}/firmware/rtlbt
    install -m 0755 ${WORKDIR}/rtl8821c_fw ${D}${sysconfdir}/firmware/rtlbt
    
    install -d ${D}${sysconfdir}/init.d
    install -d ${D}${sysconfdir}/rc2.d
    install -d ${D}${sysconfdir}/rc3.d
    install -d ${D}${sysconfdir}/rc4.d
    install -d ${D}${sysconfdir}/rc5.d
    install -m 0755 ${WORKDIR}/rtl8821cs-startup ${D}/${sysconfdir}/init.d

    ln -sf ../init.d/rtl8821cs-startup  ${D}${sysconfdir}/rc2.d/S88rtl8821cs-startup
    ln -sf ../init.d/rtl8821cs-startup  ${D}${sysconfdir}/rc3.d/S88rtl8821cs-startup
    ln -sf ../init.d/rtl8821cs-startup  ${D}${sysconfdir}/rc4.d/S88rtl8821cs-startup
    ln -sf ../init.d/rtl8821cs-startup  ${D}${sysconfdir}/rc5.d/S88rtl8821cs-startup
}

#FILES_${PN} = "${bindir}/rk_wifi_init"
