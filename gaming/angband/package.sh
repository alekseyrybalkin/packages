#!/bin/sh

pkgname=angband
vcs="git"
gittag=dd17148e286027116d05515665e9f16eaf9ba539
pkgver=3.5.0+
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  sed -i -e 's/rst2html/true/g' doc/Makefile
  sed -i -e 's/rst2latex/true/g' doc/Makefile
  ./configure --prefix=/usr \
    --bindir=/usr/bin/ \
    --sysconfdir=/usr/share/angband \
    --enable-sdl \
    --enable-sdl-mixer
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  rm -f ${pkgdir}/usr/share/angband/*/delete.me
}
