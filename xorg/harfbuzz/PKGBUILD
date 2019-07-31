pkgname=harfbuzz
pkgver=2.5.3
vcs=git
gittag=${pkgver}
relmon_id=1299

build() {
    ./autogen.sh --prefix=/usr --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
