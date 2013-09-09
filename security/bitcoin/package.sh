#!/bin/sh

pkgname=bitcoin
pkgver=0.8.4
urls="http://sourceforge.net/projects/bitcoin/files/Bitcoin/bitcoin-${pkgver}/bitcoin-${pkgver}-linux.tar.gz"
srctar=${pkgname}-${pkgver}-linux.tar.gz
srcdir=${location}/${pkgname}-${pkgver}-linux

kiin_make() {
  cd src
  make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS"
}

kiin_install() {
  cd src
  install -Dm755 src/bitcoind ${pkgdir}/usr/bin/bitcoind
  install -Dm644 contrib/debian/examples/bitcoin.conf \
    ${pkgdir}/usr/share/doc/${pkgname}/examples/bitcoin.conf
  install -Dm644 contrib/debian/manpages/bitcoind.1 \
    ${pkgdir}/usr/share/man/man1/bitcoind.1
  install -Dm644 contrib/debian/manpages/bitcoin.conf.5 \
    ${pkgdir}/usr/share/man/man5/bitcoin.conf.5
}
