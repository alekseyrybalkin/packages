#!/bin/sh

pkgname=eudev
SKIP_ARCH_CHECK=1
pkgver=3.0
vcs=git
gittag=v${pkgver}
extension=gz
folder="http://dev.gentoo.org/~blueness/eudev/"
check_server=1

. ${KIIN_REPO}/defaults.sh

ver_grep="^${pkgname}-[0-9\.]*\.tar\.${extension}$"

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libdir=${LIBDIR} \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --with-rootprefix= \
    --with-rootlibdir=${LIBDIR} \
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
  if [ -n "${KIIN_LIB32}" ]; then
    rm -rf ${pkgdir}/usr/lib
  fi
}

kiin_after_install() {
  udevadm hwdb --update
}

kiin_after_upgrade() {
  kiin_after_install
}

known="etc/udev/hwdb.bin \
  etc/udev/rules.d/70-persistent-net.rules"
