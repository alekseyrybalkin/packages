pkgname=libxdamage
pkgver=1.1.5
vcs=git
gittag=libXdamage-${pkgver}
relmon_id=1771

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}