_pkgname=xkbcomp
pkgname=xorg-${_pkgname}
pkgver=1.4.2
vcs=git
gittag=${_pkgname}-${pkgver}
relmon_id=15018

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
