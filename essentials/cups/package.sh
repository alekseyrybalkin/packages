#!/bin/sh

pkgname=cups
ARCH_NAME_LIB32=cups
pkgver=2.1.3
urls="http://www.cups.org/software/${pkgver}/cups-${pkgver}-source.tar.bz2"
srctar=cups-${pkgver}-source.tar.bz2
srcdir=${location}/cups-${pkgver}

kiin_make() {
  sed -i 's#@CUPS_HTMLVIEW@#firefox#' desktop/cups.desktop.in
  sed -i 's:555:755:g;s:444:644:g' Makedefs.in
  sed -i '/MAN.*.EXT/s:.gz::g' \
    configure config-scripts/cups-manpages.m4
  sed -i '/LIBGCRYPTCONFIG/d' config-scripts/cups-ssl.m4
  sed -i 's@else /\* HAVE_AVAHI \*/@elif defined(HAVE_AVAHI)@' \
    test/ippserver.c
  aclocal -I config-scripts
  autoconf -I config-scripts
  if [ -z "${KIIN_LIB32}" ]; then
    CC=gcc ./configure --with-rcdir=/tmp/cupsinit \
      --with-docdir=/usr/share/cups/doc \
      --with-system-groups=lpadmin \
      --disable-systemd \
      --libdir=${LIBDIR}
    make
  else
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --enable-raw-printing --disable-gssapi --disable-dbus \
      --enable-ssl=yes--enable-threads --enable-libusb=no \
      --disable-avahi --disable-dnssd --disable-systemd \
      --with-system-groups=lpadmin --libdir=${LIBDIR}
    make libs
  fi
}

kiin_install() {
  if [ -z "${KIIN_LIB32}" ]; then
    make BUILDROOT=${pkgdir} install-headers install-libs
  else
    make BUILDROOT=${pkgdir} install-libs
    rm -rf ${pkgdir}/usr/lib
  fi
}
