_pkgname=xset
pkgname=xorg-${_pkgname}
pkgver=1.2.4
vcs=git
gittag=${_pkgname}-${pkgver}
relmon_id=14954

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
