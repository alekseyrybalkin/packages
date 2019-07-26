_pkgname=xmodmap
pkgname=xorg-${_pkgname}
pkgver=1.0.10
vcs=git
gittag=${_pkgname}-${pkgver}

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
