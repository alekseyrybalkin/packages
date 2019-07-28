pkgname=xz
pkgver=5.2.4
vcs=git
gittag=v${pkgver}
relmon_id=5277
relmon_rules="skip_alpha"

build() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --disable-static \
        --docdir=/usr/share/doc/xz
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
