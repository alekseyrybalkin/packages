pkgname=libsm
pkgver=1.2.3
vcs=git
gittag=libSM-${pkgver}
relmon_id=1726

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
