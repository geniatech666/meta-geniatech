DESCRIPTION = "Resize helper"
SECTION = "resize"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://autopart-ori;md5=bcb47387663ec0195af9d8ec5f23e92c"
SRCREV = "${AUTOREV}"
SRC_URI = "file://resize-helper \
           file://resize.sh \
           file://autopart-ori"

S = "${WORKDIR}"

inherit allarch

do_compile() {
}

do_install() {
 install -d ${D}${sysconfdir}
 install -d ${D}${sysconfdir}
 install -m 0755 ${WORKDIR}/resize-helper ${D}/${sysconfdir}/
 install -m 0755 ${WORKDIR}/autopart-ori ${D}/${sysconfdir}/

 install -d ${D}${sysconfdir}/init.d
 install -d ${D}${sysconfdir}/rc2.d
 install -d ${D}${sysconfdir}/rc3.d
 install -d ${D}${sysconfdir}/rc4.d
 install -d ${D}${sysconfdir}/rc5.d
 install -m 0755 ${WORKDIR}/resize.sh ${D}/${sysconfdir}/init.d

 ln -sf ../init.d/resize.sh  ${D}${sysconfdir}/rc2.d/S88resize.sh
 ln -sf ../init.d/resize.sh  ${D}${sysconfdir}/rc3.d/S88resize.sh
 ln -sf ../init.d/resize.sh  ${D}${sysconfdir}/rc4.d/S88resize.sh
 ln -sf ../init.d/resize.sh  ${D}${sysconfdir}/rc5.d/S88resize.sh
}
