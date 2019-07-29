pkgname=openssl
# pkgver too complex to parse, we check git tags instead
SKIP_ARCH_CHECK=1
pkgver=1.1.1c
vcs=git
gittag=OpenSSL_${pkgver//\./_}
relmon_id=2566

build() {
    ./config --prefix=/usr \
        --libdir=lib \
        --openssldir=/etc/ssl \
        shared
    make
}

package() {
    sed -i 's# libcrypto.a##;s# libssl.a##' Makefile
    make DESTDIR=${pkgdir} MANDIR=/usr/share/man MANSUFFIX=ssl install
}