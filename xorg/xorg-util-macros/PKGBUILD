pkgname=xorg-util-macros
pkgver=1.19.2
vcs=git
gittag=util-macros-${pkgver}
relmon_id=15037

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
