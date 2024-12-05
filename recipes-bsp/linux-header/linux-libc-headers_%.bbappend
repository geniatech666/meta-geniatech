# Copyright (C) 2020, Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

# Some opengl[es] libraries are multithreaded.

KBRANCH = "HEAD"
SRCREV = "${AUTOREV}"

SRC_URI = " \
        git://${TOPDIR}/../meta-rockchip/external/kernel;protocol=file;usehead=1 \
"
