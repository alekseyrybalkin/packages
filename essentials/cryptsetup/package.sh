#!/bin/sh

pkgname=cryptsetup
pkgver=1.7.5
vcs=git
gittag=v${pkgver//\./_}
urls="https://www.kernel.org/pub/linux/utils/${pkgname}/v1.6/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=13709

kiin_make() {
    ./autogen.sh --prefix=/usr \
        --disable-static \
        --with-crypto_backend=openssl \
        --enable-cryptsetup-reencrypt
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    mv ${pkgdir}/usr/{sbin,bin}
}
