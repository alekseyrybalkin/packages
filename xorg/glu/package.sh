pkgname=glu
pkgver=9.0.0
vcs=git
gittag=glu-${pkgver}

build() {
    ./autogen.sh --prefix=$XORG_PREFIX \
        --disable-static \
        --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
