DESCRIPTION = "route rule"
LICENSE = "CLOSED"

SRC_URI = " \
	file://route_rule.c \
	file://autogen.sh \
	file://configure.ac \
	file://Makefile.am \
	"

PV = "1"

S = "${WORKDIR}"

inherit autotools pkgconfig
