SUMMARY = "A small image just capable of allowing a device to boot."

IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}"

IMAGE_LINGUAS = " "

LICENSE = "MIT"

inherit core-image

IMAGE_ROOTFS_SIZE ?= "8192"
IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"

CORE_IMAGE_EXTRA_INSTALL += "\
	alsa-utils-aplay \
        i2c-tools \
        alsa-utils-amixer \
        gcc \
        v4l-utils \
        ntp \
	sntp \
	ntpdate \
	net-tools \
	networkmanager \
	glib-networking \
	bluez5 \
	bluez5-obex \
	bluez5-noinst-tools \
	minicom \
	gcc \
    android-tools \
	qemu \
	autoconf \
    automake \
    binutils \
    binutils-symlinks \
    ccache \
    coreutils \
    cpp \
    cpp-symlinks \
    distcc \
    file \
    findutils \
    g++ \
    g++-symlinks \
    gcc \
    gcc-symlinks \
    ldd \
    less \
    libstdc++ \
    libstdc++-dev \
    libtool \
    make \
    perl-module-re \
    perl-module-text-wrap \
    pkgconfig \
    quilt \
    sed \
    burn-key \
    cronie \
    evtest \
    iperf3 \
    ethtool \
    pulseaudio \
    glibc-utils \
    glibc-gconv-utf-16 \
    fuse \
    libgcrypt \
    ntfs-3g-ntfsprogs \
    ntfs-3g \
    ntfsprogs \
    libntfs-3g \
   rtl8723bu \
	xserver-xorg \
   drm-cursor \
   libdrm \
   autorun \
   resize-helper \
 usbutils \
  udev-extraconf \
  glib-networking \
  resolvconf \
  dhcpcd \
"
