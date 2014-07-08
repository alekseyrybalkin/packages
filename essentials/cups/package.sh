#!/bin/sh

pkgname=cups
pkgver=1.7.3
urls="http://www.cups.org/software/${pkgver}/cups-${pkgver}-source.tar.bz2 \
  http://www.linuxfromscratch.org/patches/blfs/svn/cups-${pkgver}-blfs-1.patch \
  http://www.linuxfromscratch.org/patches/blfs/svn/cups-${pkgver}-avahi_optional-1.patch"
srctar=cups-${pkgver}-source.tar.bz2
srcdir=${location}/cups-${pkgver}

kiin_make() {
  sed -i 's#@CUPS_HTMLVIEW@#firefox#' desktop/cups.desktop.in
  patch -Np1 -i ${KIIN_HOME}/tarballs/cups-${pkgver}-avahi_optional-1.patch
  patch -Np1 -i ${KIIN_HOME}/tarballs/cups-${pkgver}-blfs-1.patch
  aclocal -I config-scripts
  autoconf -I config-scripts
  CC=gcc ./configure --with-rcdir=/tmp/cupsinit \
    --with-docdir=/usr/share/cups/doc \
    --with-system-groups=lpadmin \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make BUILDROOT=${pkgdir} install-headers install-libs
}
