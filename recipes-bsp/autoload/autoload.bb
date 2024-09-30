DESCRIPTION = "suppot autoload file and script"
SECTION = "autoload"
LICENSE = "CLOSED"
PV = "3"
PR = "r0"

SRC_URI = " \
	  file://autoload.sh \
          file://autoload \
          file://ppp.sh \ 
	  file://uart_test.c \
         "

S = "${WORKDIR}"


do_install () {
    #install -d ${D}${bindir}/
    
    install -d ${D}${sysconfdir}/init.d
    install -d ${D}${sysconfdir}/rc5.d
    install -m 0755 ${WORKDIR}/autoload.sh ${D}/${sysconfdir}/
    install -m 0755 ${WORKDIR}/ppp.sh ${D}/${sysconfdir}/
    install -m 0755 ${WORKDIR}/uart_test.c ${D}/${sysconfdir}/
    install -m 0755 ${WORKDIR}/autoload ${D}/${sysconfdir}/init.d
    
    ln -sf ../init.d/autoload  ${D}${sysconfdir}/rc5.d/S89autoload
}
