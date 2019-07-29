pkgname=libpciaccess
pkgver=0.16
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=1703

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}