#!/bin/sh

pkgname=eudev
SKIP_ARCH_CHECK=1
pkgver=3.1.5
extension=gz
folder="http://dev.gentoo.org/~blueness/eudev/"
check_server=1

. ${KIIN_REPO}/defaults.sh

ver_grep="^${pkgname}-[0-9\.]*\.tar\.${extension}$"

kiin_make() {
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

kiin_install() {
  mkdir -pv ${pkgdir}/usr/lib/udev/devices/pts
  mkdir -pv ${pkgdir}/etc/udev/rules.d
  make DESTDIR=${pkgdir} install
}

kiin_after_install() {
  udevadm hwdb --update
}

kiin_after_upgrade() {
  kiin_after_install
}

known="etc/udev/hwdb.bin \
  etc/udev/rules.d/70-persistent-net.rules"
