pkgname=libxxf86vm
pkgver=1.1.4
vcs=git
gittag=libXxf86vm-${pkgver}
relmon_id=1799

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
