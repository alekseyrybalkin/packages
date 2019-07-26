pkgname=libxcursor
pkgver=1.2.0
vcs=git
gittag=libXcursor-${pkgver}
relmon_id=1770

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
