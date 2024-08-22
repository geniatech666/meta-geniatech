DESCRIPTION = "gprs"
LICENSE = "CLOSED"

#SRC_URI = " \
#	file://rk_wifi_init.c \
#	file://brcm_patchram_plus1.c \
#	file://autogen.sh \
#	file://configure.ac \
#	file://Makefile.am \
#	"

SRC_URI = " \
	file://net \
	file://gprs_call.sh \
	file://wvdial.conf \
	file://3gnet \
	file://connect \
	file://disconnect \
	"
PV = "1"

S = "${WORKDIR}"

do_install() {
    install -d ${D}${sysconfdir}/init.d
    install -d ${D}${sysconfdir}/rcS.d
    install -d ${D}${sysconfdir}/rc1.d
    install -d ${D}${sysconfdir}/rc2.d
    install -d ${D}${sysconfdir}/rc3.d
    install -d ${D}${sysconfdir}/rc4.d
    install -d ${D}${sysconfdir}/rc5.d
    install -m 0755 ${WORKDIR}/net ${D}/${sysconfdir}/init.d

    install -d ${D}/${sysconfdir}
    install -m 0755 ${WORKDIR}/gprs_call.sh ${D}/${sysconfdir}
    install -m 0755 ${WORKDIR}/wvdial.conf ${D}/${sysconfdir}
    install -m 0755 ${WORKDIR}/3gnet ${D}/${sysconfdir}
    install -m 0755 ${WORKDIR}/connect ${D}/${sysconfdir}
    install -m 0755 ${WORKDIR}/disconnect ${D}/${sysconfdir}

    ln -sf ../init.d/net  ${D}${sysconfdir}/rc2.d/S88net
    ln -sf ../init.d/net  ${D}${sysconfdir}/rc3.d/S88net
    ln -sf ../init.d/net  ${D}${sysconfdir}/rc4.d/S88net
    ln -sf ../init.d/net  ${D}${sysconfdir}/rc5.d/S88net
} 
