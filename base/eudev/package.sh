#!/bin/sh

pkgname=eudev
SKIP_ARCH_CHECK=1
pkgver=3.2.5
vcs=git
gittag=v${pkgver}
extension=gz
folder="http://dev.gentoo.org/~blueness/eudev/"
check_server=1
relmon_id=13466

. ${UNDEAD_REPO}/defaults.sh

ver_grep="^${pkgname}-[0-9\.]*\.tar\.${extension}$"

undead_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --bindir=/usr/bin \
        --sbindir=/usr/bin \
        --libdir=/usr/lib \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --with-rootprefix= \
        --with-rootlibdir=/usr/lib \
        --enable-libkmod \
        --enable-rule_generator \
        --disable-introspection \
        --disable-keymap \
        --disable-gudev \
        --disable-gtk-doc-html \
        --disable-static \
        --with-firmware-path=/usr/lib/firmware
    make
}

undead_install() {
    mkdir -pv ${pkgdir}/usr/lib/udev/devices/pts
    mkdir -pv ${pkgdir}/etc/udev/rules.d
    make DESTDIR=${pkgdir} install
}

undead_after_install() {
    udevadm hwdb --update
}

undead_after_upgrade() {
    undead_after_install
}

known="etc/udev/hwdb.bin \
    etc/udev/rules.d/70-persistent-net.rules"
