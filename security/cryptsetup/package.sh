#!/bin/sh

pkgname=cryptsetup
pkgver=1.6.5
urls="https://www.kernel.org/pub/linux/utils/${pkgname}/v1.6/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --disable-static \
    --with-crypto_backend=openssl \
    --enable-cryptsetup-reencrypt
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mv ${pkgdir}/usr/{sbin,bin}
}
