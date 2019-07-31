pkgname=libxvmc
pkgver=1.0.11
vcs=git
gittag=libXvMC-${pkgver}
relmon_id=1796

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
