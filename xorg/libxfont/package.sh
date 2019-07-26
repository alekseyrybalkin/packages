pkgname=libxfont
ARCH_NAME=libxfont2
pkgver=2.0.3
vcs=git
gittag=libXfont2-${pkgver}
relmon_id=1776

build() {
    ./autogen.sh $XORG_CONFIG --disable-devel-docs
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
