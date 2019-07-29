pkgname=libxdmcp
pkgver=1.1.3
vcs=git
gittag=libXdmcp-${pkgver}
relmon_id=1772

build() {
    ./autogen.sh $XORG_CONFIG --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
}