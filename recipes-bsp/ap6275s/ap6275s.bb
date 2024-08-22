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
	  file://clm_bcm43752a2_ag.blob \
	  file://fw_bcm43752a2_ag.bin \
	  file://fw_bcm43752a2_ag_apsta.bin \
	  file://makefile \
	  file://nvram_ap6275s.txt \
	  file://BCM4362A2.hcd \
          file://ap6275s-startup \
          "

S = "${WORKDIR}"

do_compile () {
    make
}

do_install () {
    install -d ${D}${bindir}/
    install -m 0755 ${S}/rk_wifi_init ${D}${bindir}/
    install -m 0755 ${S}/brcm_patchram_plus1 ${D}${bindir}/

    install -d ${D}${sysconfdir}/firmware
    install -m 0755 ${WORKDIR}/clm_bcm43752a2_ag.blob ${D}${sysconfdir}/firmware
    install -m 0755 ${WORKDIR}/fw_bcm43752a2_ag.bin ${D}${sysconfdir}/firmware
    install -m 0755 ${WORKDIR}/fw_bcm43752a2_ag_apsta.bin ${D}${sysconfdir}/firmware
    install -m 0755 ${WORKDIR}/nvram_ap6275s.txt ${D}${sysconfdir}/firmware
    install -m 0755 ${WORKDIR}/BCM4362A2.hcd ${D}${sysconfdir}/firmware

    install -d ${D}${sysconfdir}/init.d
    install -d ${D}${sysconfdir}/rc2.d
    install -d ${D}${sysconfdir}/rc3.d
    install -d ${D}${sysconfdir}/rc4.d
    install -d ${D}${sysconfdir}/rc5.d
    install -m 0755 ${WORKDIR}/ap6275s-startup ${D}/${sysconfdir}/init.d

    ln -sf ../init.d/ap6275s-startup  ${D}${sysconfdir}/rc2.d/S88ap6275s-startup
    ln -sf ../init.d/ap6275s-startup  ${D}${sysconfdir}/rc3.d/S88ap6275s-startup
    ln -sf ../init.d/ap6275s-startup  ${D}${sysconfdir}/rc4.d/S88ap6275s-startup
    ln -sf ../init.d/ap6275s-startup  ${D}${sysconfdir}/rc5.d/S88ap6275s-startup
}

#FILES_${PN} = "${bindir}/rk_wifi_init"
