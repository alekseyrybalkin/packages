pkgname=libxtst
pkgver=1.2.3
vcs=git
gittag=libXtst-${pkgver}
relmon_id=1794

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
