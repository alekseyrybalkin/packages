#!/bin/sh

pkgname=inetutils
pkgver=1.9.1
urls="http://ftp.gnu.org/gnu/inetutils/inetutils-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '/gets is a/d' lib/stdio.in.h
  ./configure --prefix=/usr \
      --libexecdir=/usr/bin \
      --localstatedir=/var \
      --disable-ifconfig \
      --disable-logger \
      --disable-syslogd \
      --disable-whois \
      --disable-servers
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
