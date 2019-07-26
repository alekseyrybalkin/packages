pkgname=libxinerama
pkgver=1.1.4
vcs=git
gittag=libXinerama-${pkgver}
relmon_id=1779

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
