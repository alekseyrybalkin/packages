_pkgname=mkfontscale
pkgname=xorg-${_pkgname}
pkgver=1.2.1
vcs=git
gittag=${_pkgname}-${pkgver}

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
