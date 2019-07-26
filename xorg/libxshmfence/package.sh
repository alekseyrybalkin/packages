pkgname=libxshmfence
pkgver=1.3
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=1792

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
