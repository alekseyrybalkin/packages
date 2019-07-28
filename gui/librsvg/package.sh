pkgname=librsvg
pkgver=2.44.14
vcs=git
gittag=${pkgver}
extra_urls="somethere/librsvg-crates-${pkgver}.tar.gz"
relmon_id=5420

build() {
    rm -rf ~/.cargo
    tar xf ${TARBALLS_HOME}/${pkgname}-crates-${pkgver}.tar.gz -C ~
    cp -r `find_vcs_repo crates.io-index`/.git ~/.cargo/registry/index/github.com-1ecc6299db9ec823/

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
