#!/bin/sh

pkgname=cups
pkgver=2.0.2
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
  CC=gcc ./configure --with-rcdir=/tmp/cupsinit \
    --with-docdir=/usr/share/cups/doc \
    --with-system-groups=lpadmin \
    --disable-systemd \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make BUILDROOT=${pkgdir} install-headers install-libs
}
