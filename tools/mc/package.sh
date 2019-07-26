pkgname=mc
pkgver=4.8.23
vcs=git
gittag=${pkgver}
relmon_id=1954

build() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --libexecdir=/usr/lib \
        --enable-charset \
        --disable-static \
        --sysconfdir=/etc \
        --with-screen=slang
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
