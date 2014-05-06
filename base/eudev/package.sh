#!/bin/sh

pkgname=eudev
SKIP_ARCH_CHECK=1
pkgver=1.6
_manpages_ver=1.5.3
urls="http://dev.gentoo.org/~blueness/eudev/eudev-${pkgver}.tar.gz \
  http://anduin.linuxfromscratch.org/sources/other/eudev-${_manpages_ver}-manpages.tar.bz2"
srctar=eudev-${pkgver}.tar.gz
srcdir=${location}/eudev-${pkgver}

kiin_make() {
  sed -i '/struct ucred/i struct ucred;' src/libudev/util.h
  sed -r -i 's|/usr(/bin/test)|\1|' test/udev-test.pl
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
  mkdir -pv ${pkgdir}/usr/lib/udev/rules.d
  mkdir -pv ${pkgdir}/etc/udev/rules.d
  make DESTDIR=${pkgdir} install
  if [ -z "${KIIN_LIB32}" ]; then
    rm -rf ${pkgdir}/usr/lib/udev/rules.d
    mv ${pkgdir}/lib/udev/* ${pkgdir}/usr/lib/udev/

    mv ${pkgdir}/usr/share/pkgconfig/* ${pkgdir}/usr/lib/pkgconfig
    rm -rf ${pkgdir}/usr/share/pkgconfig
    sed -i -e "s/\/lib/\/usr\/lib/g" ${pkgdir}/usr/lib/pkgconfig/udev.pc

    mv ${pkgdir}/usr/bin/udevd ${pkgdir}/usr/lib/udev/
  else
    rm -rf ${pkgdir}/usr/lib
  fi
  rm -rf ${pkgdir}/lib

  tar -xvf ${KIIN_HOME}/tarballs/eudev-${_manpages_ver}-manpages.tar.bz2 -C ${pkgdir}/usr/share
}

kiin_after_install() {
  udevadm hwdb --update
}

kiin_after_upgrade() {
  kiin_after_install
}

known="etc/udev/hwdb.bin \
  etc/udev/rules.d/70-persistent-net.rules"
