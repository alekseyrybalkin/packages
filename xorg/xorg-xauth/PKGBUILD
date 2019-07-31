_pkgname=xauth
pkgname=xorg-${_pkgname}
pkgver=1.1
vcs=git
gittag=${_pkgname}-${pkgver}
relmon_id=5253

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
