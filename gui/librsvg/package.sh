pkgname=librsvg
pkgver=2.44.14
vcs=git
gittag=${pkgver}
relmon_id=5420

build() {
    tar xf ${TARBALLS_HOME}/librsvg-crates-${pkgver}.tar.gz -C ~
    ./autogen.sh --prefix=/usr \
        --disable-static \
        --disable-introspection
    make
}

package() {
    make DESTDIR=${pkgdir} install
}

after_install() {
    gdk-pixbuf-query-loaders --update-cache
}

after_upgrade() {
    after_install
}
