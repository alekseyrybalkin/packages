#!/bin/sh

pkgname=inetutils
pkgver=1.9.2
vcs=git
gittag=inetutils-${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  git clone ${KIIN_HOME}/sources/gnulib
  ./bootstrap --skip-po
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
