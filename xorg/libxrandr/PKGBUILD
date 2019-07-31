pkgname=libxrandr
pkgver=1.5.2
vcs=git
gittag=libXrandr-${pkgver}
relmon_id=1788

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
