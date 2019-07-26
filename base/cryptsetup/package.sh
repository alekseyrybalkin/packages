#!/bin/sh

pkgname=cryptsetup
pkgver=2.1.0
vcs=git
gittag=v${pkgver}
# rc
#relmon_id=13709

build() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --disable-static \
        --with-crypto_backend=openssl
    make
}

package() {
    make DESTDIR=${pkgdir} install
    mv ${pkgdir}/usr/{sbin,bin}
}
