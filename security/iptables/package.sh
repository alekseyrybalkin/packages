#!/bin/sh

pkgname=iptables
vcs="git"
gittag=v1.4.21
pkgver=1.4.21
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --with-xtlibdir=/lib/xtables \
    --enable-libipq
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  ln -sfv xtables-multi ${pkgdir}/usr/bin/iptables-xml
  for file in ip4tc ip6tc ipq iptc xtables
  do
    mv -v ${pkgdir}/usr/lib/lib${file}.so.* ${pkgdir}/lib
    ln -sfv ../../lib/$(readlink ${pkgdir}/usr/lib/lib${file}.so) ${pkgdir}/usr/lib/lib${file}.so
  done
}
