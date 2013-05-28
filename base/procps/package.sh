#!/bin/sh

pkgname=procps
vcs="git"
gittag=v3.3.8
pkgver=3.3.8
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --exec-prefix=/ \
    --prefix=/usr \
    --libdir=/usr/lib \
    --mandir=/usr/share/man \
    --docdir=/usr/share/doc/${pkgname} \
    --disable-static \
    --disable-skill \
    --disable-kill
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
