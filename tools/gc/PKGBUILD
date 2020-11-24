pkgname=gc
pkgver=8.0.4
vcs=git
vcs_pkgname=bdwgc
gittag=v${pkgver}
relmon_id=876

build() {
    ./autogen.sh
    ./configure --prefix=/usr --enable-cplusplus --disable-static
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
