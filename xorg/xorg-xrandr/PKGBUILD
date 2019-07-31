_pkgname=xrandr
pkgname=xorg-${_pkgname}
pkgver=1.5.0
vcs=git
gittag=${_pkgname}-${pkgver}
relmon_id=14957

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
