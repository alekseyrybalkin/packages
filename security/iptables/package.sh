#!/bin/sh

pkgname=iptables
vcs="git"
gittag=v1.4.18
pkgver=1.4.18
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr \
    --exec-prefix= \
    --bindir=/usr/bin \
    --with-xtlibdir=/lib/xtables \
    --with-pkgconfigdir=/usr/lib/pkgconfig \
    --enable-libipq \
    --enable-devel
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  ln -sfv ../../sbin/xtables-multi ${pkgdir}/usr/bin/iptables-xml
  for file in libip4tc libip6tc libipq libiptc libxtables; do
    ln -sfv ../../lib/`readlink ${pkgdir}/lib/${file}.so` ${pkgdir}/usr/lib/${file}.so
    rm -v ${pkgdir}/lib/${file}.so
  done
}
