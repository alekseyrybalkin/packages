#!/bin/sh

pkgname=elfutils
vcs=git
gittag=elfutils-0.161
pkgver=0.161
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -e '/*runp =/,+2d' \
    -e '/runp +=/s/r.*;/*runp++ = '\0';/' \
    -i libelf/elf_begin.c
  autoreconf -fi
  ./configure --prefix=/usr \
    --program-prefix="eu-" \
    --enable-maintainer-mode
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
