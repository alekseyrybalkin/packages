pkgname=openvpn
pkgver=2.4.7
vcs=git
gittag=v${pkgver}
relmon_id=2567

build() {
    autoreconf -fi
    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --enable-password-save \
        --mandir=/usr/share/man \
        --disable-lzo \
        --enable-iproute2
    make
}

package() {
    make DESTDIR=${pkgdir} install
}