pkgname=libxtrans
ARCH_NAME=xtrans
pkgver=1.4.0
vcs=git
gittag=xtrans-${pkgver}
relmon_id=13651

build() {
    ./autogen.sh $XORG_CONFIG
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
