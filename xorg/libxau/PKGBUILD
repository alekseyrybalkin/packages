pkgname=libxau
pkgver=1.0.9
vcs=git
gittag=libXau-${pkgver}
relmon_id=1765

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
