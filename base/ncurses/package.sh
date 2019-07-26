#!/bin/sh

pkgname=ncurses
# pkgver too complex to parse, we check git tags instead
SKIP_ARCH_CHECK=1
pkgver=6.1.20190623
vcs=git
gittag=v${pkgver//\./_}
relmon_id=2057

build() {
    sed -i '/LIBTOOL_INSTALL/d' c++/Makefile.in

    ./configure --prefix=/usr \
        --mandir=/usr/share/man \
        --with-shared \
        --without-debug \
        --without-normal \
        --enable-pc-files \
        --with-pkg-config-libdir=/usr/lib/pkgconfig \
        --enable-widec
    make
}

package() {
    make DESTDIR=${pkgdir} install
    if [ -d ${pkgdir}/usr/share/pkgconfig ]; then
        mkdir -p ${pkgdir}/usr/lib/pkgconfig
        mv ${pkgdir}/usr/share/pkgconfig/* ${pkgdir}/usr/lib/pkgconfig/
        rm -rf ${pkgdir}/usr/share/pkgconfig
    fi
    for lib in ncurses form panel menu; do
        echo "INPUT(-l${lib}w)" > ${pkgdir}/usr/lib/lib${lib}.so
        ln -s ${lib}w.pc ${pkgdir}/usr/lib/pkgconfig/${lib}.pc
    done

    # some packages look for -lcurses during build
    echo "INPUT(-lncursesw)" > ${pkgdir}/usr/lib/libcursesw.so
    ln -s libncurses.so ${pkgdir}/usr/lib/libcurses.so

    mkdir -pv ${pkgdir}/usr/share/doc/ncurses
    cp -v -R doc/* ${pkgdir}/usr/share/doc/ncurses
}
